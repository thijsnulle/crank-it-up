library crank_it_up.lib.app;

import 'package:flutter/material.dart';
import 'scenarios.dart';

int maxRanks = 1;
List<bool> ranks = List<bool>.filled(maxRanks, false);
List<Color> rankColors = [
  const Color.fromARGB(255, 255, 223, 0),
  const Color.fromARGB(255, 196, 202, 206),
  const Color.fromARGB(255, 205, 127, 50)
];

int id = 0;
List<Pack> packs = scenarios.entries
    .map((entry) => Pack(
          id: id++,
          name: entry.key,
          img: '${entry.key}.svg',
          scenarios: entry.value,
        ))
    .toList();

class GameObject {
  final List<Player> players;
  final int totalRounds;
  final List<String> scenarios;

  int currentRound = 1;
  String currentScenario = "";

  GameObject({required this.players, required this.totalRounds, required this.scenarios});
}

class Player {
  final String name;
  int score = 0;
  int rank = maxRanks;

  Player({required this.name});

  updateScore() => {score += maxRanks - rank, rank = maxRanks};
}

class Pack {
  final int id;
  final String name;
  final String img;
  final List scenarios;
  bool isSelected;

  Pack({
    required this.id,
    required this.name,
    required this.img,
    required this.scenarios,
    this.isSelected = true,
  });
}

GameObject? game;
