import 'package:flutter/material.dart';
import '../game/game_state.dart';
import '../models/item.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final gs = GameState();

  String _itemEmoji(ItemType t) {
    switch (t) {
      case ItemType.heal:
        return '🧪';
      case ItemType.attack:
        return '💣';
      case ItemType.special:
        return '✨';
    }
  }

  void _useItem(Item item) {
    if (item.type == ItemType.heal) {
      gs.hero.heal(item.value);
      gs.useItem(item);
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${item.name} 사용! HP +${item.value}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('전투 중에만 사용 가능한 아이템입니다.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final hero = gs.hero;
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16213e),
        title: const Text('🎒 인벤토리', style: TextStyle(color: Color(0xFFe2c27d))),
        iconTheme: const IconThemeData(color: Colors.white70),
      ),
      body: Column(
        children: [
          _buildStatBar(hero),
          const Divider(color: Colors.white24),
          Expanded(
            child: gs.inventory.isEmpty
                ? const Center(
                    child: Text('아이템이 없습니다.',
                        style: TextStyle(color: Colors.white54, fontSize: 16)),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: gs.inventory.length,
                    itemBuilder: (_, i) {
                      final item = gs.inventory[i];
                      return Card(
                        color: const Color(0xFF16213e),
                        child: ListTile(
                          leading: Text(_itemEmoji(item.type),
                              style: const TextStyle(fontSize: 28)),
                          title: Text(
                            '${item.name}  ×${item.quantity}',
                            style: const TextStyle(
                                color: Color(0xFFe2c27d), fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(item.description,
                              style: const TextStyle(color: Colors.white60)),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => _useItem(item),
                            child: const Text('사용'),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBar(character) {
    return Container(
      color: const Color(0xFF16213e),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _stat('❤️', '${character.hp}/${character.maxHp}', 'HP'),
          _stat('💙', '${character.mp}/${character.maxMp}', 'MP'),
          _stat('⚔️', '${character.atk}', 'ATK'),
          _stat('🛡️', '${character.def}', 'DEF'),
        ],
      ),
    );
  }

  Widget _stat(String emoji, String value, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 20)),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
      ],
    );
  }
}
