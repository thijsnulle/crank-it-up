library crank_it_up.lib.app;

import 'dart:ui';
import 'components/pack.dart';

List<Player> players = [
  Player('Player 1'),
  Player('Player 2'),
  Player('Player 3'),
  Player('Player 4'),
];

List<Pack> packs = [
  Pack(id: 0, name: "18+", img: "18+", scenarios: const [], color: const Color.fromARGB(255, 160, 44, 36)),
  Pack(id: 1, name: "VACATION", img: "vacation", scenarios: const [], color: const Color(0xFF247BA0)),
  Pack(id: 2, name: "MOVIES", img: "movies", scenarios: const [], color: const Color.fromARGB(255, 36, 160, 42)),
  Pack(id: 3, name: "CARS", img: "cars", scenarios: const [], color: const Color.fromARGB(255, 160, 125, 36)),
  Pack(id: 4, name: "SPORTS", img: "sports", scenarios: const [], color: const Color.fromARGB(255, 114, 36, 160)),
  Pack(id: 5, name: "DRUGS", img: "drugs", scenarios: const [], color: const Color.fromARGB(255, 160, 44, 36)),
  Pack(id: 6, name: "MUSIC", img: "music", scenarios: const [], color: const Color(0xFF247BA0)),
  Pack(id: 7, name: "HISTORY", img: "history", scenarios: const [], color: const Color.fromARGB(255, 36, 160, 42)),
  Pack(id: 8, name: "POLITICS", img: "politics", scenarios: const [], color: const Color.fromARGB(255, 160, 125, 36)),
  Pack(id: 9, name: "ANIMALS", img: "animals", scenarios: const [], color: const Color.fromARGB(255, 114, 36, 160)),
  Pack(id: 10, name: "GAMES", img: "games", scenarios: const [], color: const Color.fromARGB(255, 160, 44, 36)),
  Pack(id: 11, name: "BOOKS", img: "books", scenarios: const [], color: const Color(0xFF247BA0)),
];

GameObject game = GameObject(players: players, packs: packs);

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
