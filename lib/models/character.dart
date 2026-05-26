class Character {
  final String name;
  int hp;
  int maxHp;
  int mp;
  int maxMp;
  int atk;
  int def;
  int level;
  int exp;

  Character({
    required this.name,
    required this.maxHp,
    required this.maxMp,
    required this.atk,
    required this.def,
    this.level = 1,
    this.exp = 0,
  })  : hp = maxHp,
        mp = maxMp;

  bool get isAlive => hp > 0;

  void takeDamage(int damage) {
    final actual = (damage - def).clamp(1, 999);
    hp = (hp - actual).clamp(0, maxHp);
  }

  void heal(int amount) {
    hp = (hp + amount).clamp(0, maxHp);
  }

  int attackDamage() => atk;

  factory Character.hero() => Character(
        name: '용사',
        maxHp: 100,
        maxMp: 30,
        atk: 15,
        def: 5,
      );
}
