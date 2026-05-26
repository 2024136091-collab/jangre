import 'package:flutter/material.dart';
import 'screens/title_screen.dart';

void main() {
  runApp(const JangreApp());
}

class JangreApp extends StatelessWidget {
  const JangreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jangre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFe2c27d),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const TitleScreen(),
    );
  }
}
