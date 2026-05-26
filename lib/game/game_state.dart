import '../models/character.dart';
import '../models/item.dart';
import '../models/enemy.dart';
import '../models/scene.dart';
import 'story_data.dart';

class GameState {
  static final GameState _instance = GameState._internal();
  factory GameState() => _instance;
  GameState._internal();

  late Character hero;
  List<Item> inventory = [];
  String currentSceneId = 'start';
  List<String> visitedScenes = [];
  String? lastBattleResult; // 'win' | 'lose'

  void reset() {
    hero = Character.hero();
    inventory = [];
    currentSceneId = 'start';
    visitedScenes = [];
    lastBattleResult = null;
  }

  Scene get currentScene => storyScenes[currentSceneId]!;

  void goToScene(String id) {
    currentSceneId = id;
    if (!visitedScenes.contains(id)) visitedScenes.add(id);
  }

  void addItem(Item item) {
    final existing = inventory.where((i) => i.id == item.id);
    if (existing.isNotEmpty) {
      existing.first.quantity++;
    } else {
      inventory.add(item);
    }
  }

  void grantSceneReward(String? itemId) {
    if (itemId == null) return;
    switch (itemId) {
      case 'potion':
        addItem(Item.potion());
      case 'bomb':
        addItem(Item.bomb());
      case 'elixir':
        addItem(Item.elixir());
    }
  }

  Enemy buildEnemy(String? type) {
    switch (type) {
      case 'goblin':
        return Enemy.goblin();
      case 'darkKnight':
        return Enemy.darkKnight();
      case 'dragonLord':
        return Enemy.dragonLord();
      default:
        return Enemy.goblin();
    }
  }

  bool useItem(Item item) {
    if (item.quantity <= 0) return false;
    item.quantity--;
    if (item.quantity == 0) inventory.remove(item);
    return true;
  }
}
