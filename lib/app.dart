library crank_it_up.lib.app;

import 'dart:ui';
import 'components/pack.dart';

class Ranks {
  static bool first = false;
  static bool second = false;
  static bool third = false;
}

List<Pack> packs = [
  Pack(
      id: 0,
      name: "18+",
      img: "18+",
      scenarios: const [
        '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus est eu vestibulum tristique.',
        '2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus est eu vestibulum tristique.',
        '3. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus est eu vestibulum tristique.',
        '4. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus est eu vestibulum tristique.',
        '5. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus est eu vestibulum tristique.',
      ],
      color: const Color.fromARGB(255, 160, 44, 36)),
  Pack(
      id: 1,
      name: "VACATION",
      img: "vacation",
      scenarios: const [
        '1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum facilisis dignissim est, at tempor leo.',
        '2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum facilisis dignissim est, at tempor leo.',
        '3. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum facilisis dignissim est, at tempor leo.',
        '4. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum facilisis dignissim est, at tempor leo.',
        '5. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum facilisis dignissim est, at tempor leo.',
      ],
      color: const Color(0xFF247BA0)),
];

class GameObject {
  final List<Player> players;
  final int totalRounds;
  final List<String> scenarios;

  int currentRound = 1;

  GameObject({required this.players, required this.totalRounds, required this.scenarios});
}

class Player {
  final String name;
  int score = 0;
  int rank = -1;

  Player(this.name);

  updateScore() {
    if (rank == 1) {
      score += 3;
    } else if (rank == 2) {
      score += 2;
    } else if (rank == 3) {
      score += 1;
    }
  }
}

GameObject game = GameObject(players: [], totalRounds: -1, scenarios: []);
