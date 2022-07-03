library crank_it_up.lib.app;

import 'dart:ui';

import 'components/pack.dart';

GameObject game = GameObject(players: [], packs: []);
List<Pack> selectedPacks = []; //Denk dat dit minder handig is dan gewoon een isSelected field in alle packs.
List<Pack> packs = [
  Pack(name: "18+", img: "18+", scenarios: const [], color: const Color.fromARGB(255, 160, 44, 36)),
  Pack(name: "vacation", img: "vacation", scenarios: [], color: const Color(0xFF247BA0)),
  Pack(name: "movies", img: "movies", scenarios: [], color: const Color.fromARGB(255, 36, 160, 42)),
  Pack(name: "cars", img: "cars", scenarios: [], color: const Color.fromARGB(255, 160, 125, 36)),
  Pack(name: "sports", img: "sports", scenarios: [], color: const Color.fromARGB(255, 114, 36, 160)),
  Pack(name: "drugs", img: "drugs", scenarios: [], color: const Color.fromARGB(255, 160, 44, 36)),
  Pack(name: "music", img: "music", scenarios: [], color: const Color(0xFF247BA0)),
  Pack(name: "history", img: "history", scenarios: [], color: const Color.fromARGB(255, 36, 160, 42)),
  Pack(name: "politics", img: "politics", scenarios: [], color: const Color.fromARGB(255, 160, 125, 36)),
  Pack(name: "animals", img: "animals", scenarios: [], color: const Color.fromARGB(255, 114, 36, 160)),
  Pack(name: "games", img: "games", scenarios: [], color: const Color.fromARGB(255, 160, 44, 36)),
  Pack(name: "books", img: "books", scenarios: [], color: const Color(0xFF247BA0)),
];

class GameObject {
  final List<Player> players;
  int currentRound = 0;
  int totalRounds = 0;
  final List<Pack> packs;

  GameObject({required this.players, required this.packs});
}

class Player {
  final String name;
  int score = 0;

  Player(this.name);
}
