library crank_it_up.lib.app;

GameObject game = GameObject([], const Pack(name: "", scenarios: []));
List packs = [];
Pack selectedPack = const Pack(name: "", scenarios: []);

class GameObject {
  final List<Player> players;
  int currentRound = 0;
  int totalRounds = 0;
  final Pack pack;

  GameObject(this.players, this.pack);
}

class Player {
  final String name;
  int score = 0;

  Player(this.name);
}

class Pack {
  final String name;
  final List scenarios;

  const Pack({required this.name, required this.scenarios});
}
