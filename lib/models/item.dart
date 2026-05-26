enum ItemType { heal, attack, special }

class Item {
  final String id;
  final String name;
  final String description;
  final ItemType type;
  final int value;
  int quantity;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.value,
    this.quantity = 1,
  });

  static Item potion() => Item(
        id: 'potion',
        name: '회복 포션',
        description: 'HP를 30 회복한다.',
        type: ItemType.heal,
        value: 30,
      );

  static Item bomb() => Item(
        id: 'bomb',
        name: '폭탄',
        description: '적에게 25 고정 피해를 입힌다.',
        type: ItemType.attack,
        value: 25,
      );

  static Item elixir() => Item(
        id: 'elixir',
        name: '엘릭서',
        description: 'HP를 완전히 회복한다.',
        type: ItemType.special,
        value: 999,
      );
}
