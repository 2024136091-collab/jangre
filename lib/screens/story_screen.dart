import 'package:flutter/material.dart';
import '../game/game_state.dart';
import '../models/scene.dart';
import 'battle_screen.dart';
import 'ending_screen.dart';
import 'inventory_screen.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final gs = GameState();

  @override
  void initState() {
    super.initState();
    // 장면 진입 시 아이템 보상 지급
    gs.grantSceneReward(gs.currentScene.itemReward);
  }

  void _onChoice(String nextSceneId) {
    setState(() {
      gs.goToScene(nextSceneId);
    });

    final next = gs.currentScene;

    if (next.type == SceneType.battle) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => BattleScreen(scene: next)),
      ).then((_) => setState(() {}));
    } else if (next.type == SceneType.ending) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => EndingScreen(scene: next)),
      );
    } else {
      // 스토리 장면이면 아이템 보상
      gs.grantSceneReward(next.itemReward);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final scene = gs.currentScene;
    final hero = gs.hero;

    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16213e),
        automaticallyImplyLeading: false,
        title: Text(
          scene.title,
          style: const TextStyle(color: Color(0xFFe2c27d)),
        ),
        actions: [
          IconButton(
            icon: const Text('🎒', style: TextStyle(fontSize: 22)),
            tooltip: '인벤토리',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const InventoryScreen()),
            ).then((_) => setState(() {})),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildStatBar(hero),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF16213e),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: Text(
                      scene.description,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16, height: 1.8),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ...scene.choices.map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0f3460),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            side: const BorderSide(color: Colors.white24),
                            alignment: Alignment.centerLeft,
                          ),
                          onPressed: () => _onChoice(c.nextSceneId),
                          child: Text(c.text, style: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBar(hero) {
    return Container(
      color: const Color(0xFF16213e),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statChip('❤️', '${hero.hp}/${hero.maxHp}', 'HP'),
          _statChip('💙', '${hero.mp}/${hero.maxMp}', 'MP'),
          _statChip('⚔️', '${hero.atk}', 'ATK'),
          _statChip('🛡️', '${hero.def}', 'DEF'),
          _statChip('🎒', '${gs.inventory.fold(0, (s, i) => s + i.quantity)}', '아이템'),
        ],
      ),
    );
  }

  Widget _statChip(String emoji, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
        Text(label,
            style: const TextStyle(color: Colors.white38, fontSize: 10)),
      ],
    );
  }
}
