library crank_it_up.lib.app_object;

GameObject obj = GameObject();
List packs = [];
String selectedPack = "";

class GameObject {
  List players = [Player("A"), Player("B")];
  int currentRound = 0;
  int totalRounds = 0;
  Pack pack = Pack("");
}

class Player {
  String name;
  int score = 0;

  Player(this.name);
}

class Pack {
  String packName;
  List scenarios = [];

  Pack(this.packName);
}
