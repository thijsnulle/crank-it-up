import 'dart:math';

import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/color_scheme.dart';
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
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
              Color.fromARGB(255, 30, 21, 65),
              Color.fromARGB(255, 44, 31, 95),
              Color(0xFF473198),
              Color.fromARGB(255, 98, 67, 207)
            ])),
            child: Padding(
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
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorScheme.onBackground),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorScheme.secondary),
                            ),
                            hintText: 'Player Name',
                            hintStyle: TextStyle(color: colorScheme.tertiary),
                          ),
                          onChanged: (s) => playerNames[index] = s,
                          style: TextStyle(color: colorScheme.onBackground)),
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
            )),
      ),
    );
  }

  bool setupGame(BuildContext context) {
    if (playerNames.any((n) => n.isEmpty || n.length > 12)) {
      return alert('Ensure all player names are between 1-12 characters!', context);
    }

    if (playerNames.length != {...playerNames}.length) {
      return alert('Make sure all player names are unique!', context);
    }

    if (playerNames.any((p) => p.trim().isEmpty)) {
      return alert('Make sure every player has a name!', context);
    }

    maxRanks = max(1, min(playerNames.length - 1, 3));
    ranks = List<bool>.filled(maxRanks, false);

    game = GameObject(
      players: List<Player>.from(playerNames.map((name) => Player(name: capitalise(name.trim())))),
      scenarios: List<String>.from(packs.where((p) => p.isSelected).map((p) => p.scenarios).expand((e) => e).toList()),
      totalRounds: widget.numberOfRounds,
    );

    return true;
  }

  String capitalise(String s) => s[0].toUpperCase() + s.substring(1);
}
