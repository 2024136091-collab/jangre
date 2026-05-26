import '../models/scene.dart';

const Map<String, Scene> storyScenes = {
  'start': Scene(
    id: 'start',
    title: '여정의 시작',
    description:
        '어둠에 뒤덮인 왕국. 용왕이 깨어났다는 소식이 퍼진다.\n\n'
        '마을 촌장이 당신을 불러 말한다:\n'
        '"용사여, 이 위기를 막을 수 있는 자는 당신뿐이오."',
    type: SceneType.story,
    choices: [
      Choice(text: '✅ 의뢰를 받아들인다', nextSceneId: 'forest'),
      Choice(text: '🏃 도망쳐 숨는다', nextSceneId: 'hiding'),
    ],
  ),
  'hiding': Scene(
    id: 'hiding',
    title: '도주',
    description:
        '당신은 마을을 떠나 산속에 숨었다.\n\n'
        '그러나 어느 날 밤, 마을이 불타는 것을 멀리서 바라보게 된다.\n'
        '왕국은 멸망했다.',
    type: SceneType.ending,
    endingType: 'defeat',
  ),
  'forest': Scene(
    id: 'forest',
    title: '어두운 숲',
    description:
        '용왕의 성으로 가는 길목, 어두운 숲.\n\n'
        '덤불 사이에서 고블린이 튀어나왔다!\n\n'
        '👺 고블린이 으르렁거린다.',
    type: SceneType.battle,
    enemyType: 'goblin',
    choices: [
      Choice(text: '다음으로', nextSceneId: 'forest_after'),
    ],
  ),
  'forest_after': Scene(
    id: 'forest_after',
    title: '숲을 지나며',
    description:
        '고블린을 물리쳤다. 숲 깊은 곳에서 낡은 상자를 발견했다.\n\n'
        '"회복 포션이 들어있다."',
    type: SceneType.story,
    itemReward: 'potion',
    choices: [
      Choice(text: '🏰 성으로 향한다', nextSceneId: 'castle_gate'),
      Choice(text: '🔮 신비한 동굴로 간다', nextSceneId: 'cave'),
    ],
  ),
  'cave': Scene(
    id: 'cave',
    title: '신비한 동굴',
    description:
        '동굴 안에서 한 노인을 만났다.\n\n'
        '"용왕의 약점은 얼음이다. 이 폭탄을 받아라."\n\n'
        '💣 폭탄을 얻었다.',
    type: SceneType.story,
    itemReward: 'bomb',
    choices: [
      Choice(text: '🏰 성으로 향한다', nextSceneId: 'castle_gate'),
    ],
  ),
  'castle_gate': Scene(
    id: 'castle_gate',
    title: '용왕의 성 앞',
    description:
        '드디어 용왕의 성 앞에 도달했다.\n\n'
        '성문을 지키는 암흑 기사가 가로막는다.\n\n'
        '🗡️ "여기서 더 이상 나아갈 수 없다!"',
    type: SceneType.battle,
    enemyType: 'darkKnight',
    choices: [
      Choice(text: '다음으로', nextSceneId: 'throne_room'),
    ],
  ),
  'throne_room': Scene(
    id: 'throne_room',
    title: '왕좌의 방',
    description:
        '마침내 왕좌의 방. 용왕이 그 자리에 앉아 당신을 내려다본다.\n\n'
        '🐉 "감히 여기까지 왔느냐, 용사여!"',
    type: SceneType.battle,
    enemyType: 'dragonLord',
    choices: [
      Choice(text: '다음으로', nextSceneId: 'victory'),
    ],
  ),
  'victory': Scene(
    id: 'victory',
    title: '승리!',
    description:
        '용왕을 쓰러뜨렸다!\n\n'
        '왕국에 평화가 찾아오고, 당신은 영웅으로 칭송받는다.\n\n'
        '🎉 축하합니다! 엔딩 [영웅의 귀환]',
    type: SceneType.ending,
    endingType: 'victory',
  ),
};
