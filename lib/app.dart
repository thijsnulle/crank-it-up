library crank_it_up.lib.app;

GameObject game = GameObject();
List packs = [];
String selectedPack = "";

class GameObject {
  List<Player> players = [];
  int currentRound = 0;
  int totalRounds = 0;
  Pack pack = const Pack();
}

class Player {
  final String name;
  int score = 0;

  Player(this.name);
}

class Pack {
  final String? packName;
  final List? scenarios;

  const Pack({this.packName, this.scenarios});
}
