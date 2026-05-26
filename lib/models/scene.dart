enum SceneType { story, battle, ending }

class Choice {
  final String text;
  final String nextSceneId;

  const Choice({required this.text, required this.nextSceneId});
}

class Scene {
  final String id;
  final String title;
  final String description;
  final SceneType type;
  final List<Choice> choices;
  final String? enemyType; // 'goblin' | 'darkKnight' | 'dragonLord'
  final String? endingType; // 'victory' | 'defeat' | 'hidden'
  final String? itemReward;

  const Scene({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    this.choices = const [],
    this.enemyType,
    this.endingType,
    this.itemReward,
  });
}
