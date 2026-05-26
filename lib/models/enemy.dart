class Enemy {
  final String name;
  final String emoji;
  int hp;
  final int maxHp;
  final int atk;
  final int def;
  final String dropItem; // item id or ''
  final int expReward;

  Enemy({
    required this.name,
    required this.emoji,
    required this.maxHp,
    required this.atk,
    required this.def,
    this.dropItem = '',
    this.expReward = 10,
  }) : hp = maxHp;

  bool get isAlive => hp > 0;

  void takeDamage(int damage) {
    final actual = (damage - def).clamp(1, 999);
    hp = (hp - actual).clamp(0, maxHp);
  }

  int attackDamage() => atk;

  static Enemy goblin() => Enemy(
        name: '고블린',
        emoji: '👺',
        maxHp: 40,
        atk: 8,
        def: 2,
        dropItem: 'potion',
        expReward: 15,
      );

  static Enemy darkKnight() => Enemy(
        name: '암흑 기사',
        emoji: '🗡️',
        maxHp: 80,
        atk: 18,
        def: 8,
        dropItem: 'bomb',
        expReward: 30,
      );

  static Enemy dragonLord() => Enemy(
        name: '용왕',
        emoji: '🐉',
        maxHp: 150,
        atk: 25,
        def: 10,
        dropItem: 'elixir',
        expReward: 100,
      );
}
