library crank_it_up.lib.app;

GameObject game = GameObject(players: [], pack: const Pack(name: "", scenarios: []));
List<Pack> selectedPacks = [];

class GameObject {
  final List<Player> players;
  int currentRound = 0;
  int totalRounds = 0;
  final Pack pack;

  GameObject({required this.players, required this.pack});
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
