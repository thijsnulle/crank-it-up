import 'dart:math';

import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/components/alert.dart';
import 'package:crank_it_up/components/app_header.dart';
import 'package:crank_it_up/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:page_transition/page_transition.dart';

class PlayerInputScreen extends StatefulWidget {
  const PlayerInputScreen({super.key, required this.numberOfPlayers, required this.numberOfRounds});

  final int numberOfPlayers;
  final int numberOfRounds;

  @override
  PlayerInputScreenState createState() => PlayerInputScreenState();
}

class PlayerInputScreenState extends State<PlayerInputScreen> {
  List<String> playerNames = [];

  PlayerInputScreenState();

  @override
  void initState() {
    playerNames = List.filled(widget.numberOfPlayers, '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppHeader.create('CHOOSE', 'PLAYERS', null, Icons.west_rounded, context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              Column(
                  children: List.generate(
                widget.numberOfPlayers,
                (index) => SizedBox(
                  height: 40,
                  child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        hintText: 'Player Name',
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                      ),
                      onChanged: (s) => playerNames[index] = s,
                      style: const TextStyle(color: Colors.white)),
                ),
              )),
              Expanded(child: Container()),
              PrimaryButton(
                text: 'START GAME',
                function: () => {
                  if (setupGame(context))
                    Navigator.of(context).push(
                      PageTransition(type: PageTransitionType.leftToRight, child: const GameScreen()),
                    )
                },
              ),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }

  bool setupGame(BuildContext context) {
    if (playerNames.any((n) => n.isEmpty || n.length > 12)) {
      return alert('Ensure all player names are between 1-12 characters!', context);
    }

    if (validate(playerNames)) {
      return alert('Make sure all player names are unique!', context);
    }

    maxRanks = max(1, min(playerNames.length - 1, 3));
    ranks = List<bool>.filled(maxRanks, false);

    game = GameObject(
      players: List<Player>.from(playerNames.map((name) => Player(name: name))),
      scenarios: List<String>.from(packs.where((p) => p.isSelected).map((p) => p.scenarios).expand((e) => e).toList()),
      totalRounds: widget.numberOfRounds,
    );

    return true;
  }

  bool validate(List<String> playerNames) {
    return playerNames.length != {...playerNames}.length;
  }
}
