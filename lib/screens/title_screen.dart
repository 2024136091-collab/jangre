import 'package:flutter/material.dart';
import '../game/game_state.dart';
import 'story_screen.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('⚔️', style: TextStyle(fontSize: 80)),
            const SizedBox(height: 24),
            const Text(
              'JANGRE',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFFe2c27d),
                letterSpacing: 6,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '텍스트 RPG',
              style: TextStyle(fontSize: 16, color: Colors.white60),
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFe2c27d),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                GameState().reset();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const StoryScreen()),
                );
              },
              child: const Text('🗡️  새 게임 시작'),
            ),
          ],
        ),
      ),
    );
  }
}
