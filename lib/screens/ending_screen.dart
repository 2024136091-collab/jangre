import 'package:flutter/material.dart';
import '../game/game_state.dart';
import '../models/scene.dart';
import 'title_screen.dart';

class EndingScreen extends StatelessWidget {
  final Scene scene;
  const EndingScreen({super.key, required this.scene});

  @override
  Widget build(BuildContext context) {
    final isVictory = scene.endingType == 'victory';
    final isHidden = scene.endingType == 'hidden';

    final emoji = isVictory ? '🏆' : isHidden ? '🔮' : '💀';
    final color = isVictory
        ? const Color(0xFFe2c27d)
        : isHidden
            ? Colors.purple
            : Colors.redAccent;
    final label = isVictory ? '영웅의 귀환' : isHidden ? '숨겨진 진실' : '패배';

    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 80)),
              const SizedBox(height: 24),
              Text(
                'ENDING — $label',
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: color),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF16213e),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: color.withOpacity(0.4)),
                ),
                child: Text(
                  scene.description,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 15, height: 1.7),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                ),
                onPressed: () {
                  GameState().reset();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const TitleScreen()),
                    (_) => false,
                  );
                },
                child: const Text('🔄  처음으로', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
