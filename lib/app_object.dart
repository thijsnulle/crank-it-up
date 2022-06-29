library crank_it_up.lib.app_object;

GameObject obj = GameObject();
List packs = [];
String selectedPack = "";

class GameObject {
  List<Player> players = [];
  int currentRound = 0;
  int totalRounds = 0;
  Pack pack = Pack("", []);
}

class Player {
  final String name;
  int score = 0;

  Player(this.name);
}

class Pack {
  final String packName;
  final List scenarios;

  Pack(this.packName, this.scenarios);
}
