import 'package:flutter/material.dart';
import '../game/game_state.dart';
import '../models/character.dart';
import '../models/enemy.dart';
import '../models/item.dart';
import '../models/scene.dart';
import 'story_screen.dart';
import 'ending_screen.dart';

class BattleScreen extends StatefulWidget {
  final Scene scene;
  const BattleScreen({super.key, required this.scene});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  final gs = GameState();
  late Character hero;
  late Enemy enemy;
  final List<String> log = [];
  bool battleOver = false;
  bool playerWon = false;

  @override
  void initState() {
    super.initState();
    hero = gs.hero;
    enemy = gs.buildEnemy(widget.scene.enemyType);
    log.add('${enemy.emoji} ${enemy.name}이(가) 나타났다!');
  }

  void _attack() {
    if (battleOver) return;
    final dmg = hero.attackDamage();
    enemy.takeDamage(dmg);
    _addLog('⚔️ 공격! ${enemy.name}에게 $dmg 피해.');

    if (!enemy.isAlive) {
      _onVictory();
      return;
    }
    _enemyTurn();
  }

  void _useItemInBattle(Item item) {
    if (battleOver) return;
    if (item.type == ItemType.heal) {
      hero.heal(item.value);
      gs.useItem(item);
      _addLog('🧪 ${item.name} 사용! HP +${item.value}. 현재 HP: ${hero.hp}');
    } else if (item.type == ItemType.attack) {
      enemy.takeDamage(item.value);
      gs.useItem(item);
      _addLog('💣 ${item.name} 투척! ${enemy.name}에게 ${item.value} 피해.');
      if (!enemy.isAlive) {
        _onVictory();
        return;
      }
    }
    _enemyTurn();
  }

  void _defend() {
    if (battleOver) return;
    _addLog('🛡️ 방어 자세! 이번 턴 피해 -50%.');
    final originalDef = hero.def;
    hero.def = hero.def * 2;
    _enemyTurn();
    hero.def = originalDef;
  }

  void _enemyTurn() {
    final dmg = enemy.attackDamage();
    hero.takeDamage(dmg);
    _addLog('${enemy.emoji} ${enemy.name} 공격! ${hero.hp <= 0 ? "치명타!" : "$dmg 피해."}');

    if (!hero.isAlive) {
      setState(() {
        battleOver = true;
        playerWon = false;
      });
    }
  }

  void _onVictory() {
    gs.grantSceneReward(enemy.dropItem);
    _addLog('🎉 ${enemy.name}을(를) 쓰러뜨렸다!');
    if (enemy.dropItem.isNotEmpty) {
      _addLog('📦 아이템을 획득했다!');
    }
    setState(() {
      battleOver = true;
      playerWon = true;
    });
  }

  void _addLog(String msg) {
    setState(() {
      log.add(msg);
    });
  }

  void _proceed() {
    final nextId = widget.scene.choices.isNotEmpty
        ? widget.scene.choices.first.nextSceneId
        : 'victory';
    gs.goToScene(nextId);

    if (playerWon) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const StoryScreen()),
      );
    } else {
      final defeatScene = Scene(
        id: 'defeat',
        title: '패배',
        description: '당신은 쓰러졌다.\n\n왕국은 어둠에 잠긴다.\n\n💀 엔딩 [패배]',
        type: SceneType.ending,
        endingType: 'defeat',
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => EndingScreen(scene: defeatScene)),
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16213e),
        automaticallyImplyLeading: false,
        title: Text(
          '⚔️  ${enemy.emoji} ${enemy.name}과의 전투',
          style: const TextStyle(color: Color(0xFFe2c27d)),
        ),
      ),
      body: Column(
        children: [
          _buildHpBars(),
          const Divider(color: Colors.white24),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              reverse: true,
              itemCount: log.length,
              itemBuilder: (_, i) => Text(
                log[log.length - 1 - i],
                style: TextStyle(
                  color: i == 0 ? Colors.white : Colors.white54,
                  fontSize: i == 0 ? 15 : 13,
                  height: 1.6,
                ),
              ),
            ),
          ),
          const Divider(color: Colors.white24),
          if (!battleOver) _buildActions(),
          if (battleOver) _buildResult(),
        ],
      ),
    );
  }

  Widget _buildHpBars() {
    return Container(
      color: const Color(0xFF16213e),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _hpRow('🧙 ${hero.name}', hero.hp, hero.maxHp, Colors.green),
          const SizedBox(height: 8),
          _hpRow('${enemy.emoji} ${enemy.name}', enemy.hp, enemy.maxHp, Colors.redAccent),
        ],
      ),
    );
  }

  Widget _hpRow(String label, int hp, int maxHp, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 13)),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: hp / maxHp,
              backgroundColor: Colors.white12,
              color: color,
              minHeight: 12,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text('$hp/$maxHp',
            style: const TextStyle(color: Colors.white60, fontSize: 12)),
      ],
    );
  }

  Widget _buildActions() {
    final hasUsableItem = gs.inventory.any((i) => i.quantity > 0);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          _actionBtn('⚔️ 공격', Colors.redAccent, _attack),
          _actionBtn('🛡️ 방어', Colors.blueAccent, _defend),
          if (hasUsableItem)
            _actionBtn('🎒 아이템', Colors.teal, _showItemDialog),
        ],
      ),
    );
  }

  Widget _actionBtn(String label, Color color, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: onTap,
      child: Text(label, style: const TextStyle(fontSize: 15)),
    );
  }

  void _showItemDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF16213e),
      builder: (_) => ListView(
        shrinkWrap: true,
        children: gs.inventory
            .where((i) => i.quantity > 0)
            .map((item) => ListTile(
                  title: Text('${item.name} ×${item.quantity}',
                      style: const TextStyle(color: Color(0xFFe2c27d))),
                  subtitle: Text(item.description,
                      style: const TextStyle(color: Colors.white60)),
                  onTap: () {
                    Navigator.pop(context);
                    _useItemInBattle(item);
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _buildResult() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            playerWon ? '🎉 승리!' : '💀 패배...',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: playerWon ? const Color(0xFFe2c27d) : Colors.redAccent,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: playerWon ? const Color(0xFFe2c27d) : Colors.redAccent,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: _proceed,
            child: Text(playerWon ? '계속하기 ▶' : '결과 보기',
                style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
