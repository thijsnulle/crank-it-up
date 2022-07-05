import 'dart:math';

import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/screens/game_screen.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:page_transition/page_transition.dart';

class PlayerInputScreen extends StatefulWidget {
  const PlayerInputScreen({super.key, required this.numberOfPlayers, required this.numberOfRounds});

  final int numberOfPlayers;
  final int numberOfRounds;

  @override
  PlayerInputScreenState createState() =>
      PlayerInputScreenState(numberOfPlayers: numberOfPlayers, numberOfRounds: numberOfRounds);
}

class PlayerInputScreenState extends State<PlayerInputScreen> {
  final int numberOfPlayers;
  final int numberOfRounds;
  List<String> playerNames;

  PlayerInputScreenState({required this.numberOfPlayers, required this.numberOfRounds})
      : playerNames = List.filled(numberOfPlayers, '');

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.west_rounded)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CHOOSE', style: Theme.of(context).textTheme.headline1),
              Text('PLAYERS', style: Theme.of(context).textTheme.headline2)
            ],
          ),
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              Column(
                  children: List.generate(
                numberOfPlayers,
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
      showFlash(
        duration: const Duration(seconds: 5),
        context: context,
        builder: (_, controller) => Flash(
          controller: controller,
          position: FlashPosition.top,
          behavior: FlashBehavior.floating,
          child: FlashBar(
            content: const Text('Ensure all player names are between 1-12 characters.'),
            indicatorColor: colorScheme.primary,
          ),
        ),
      );
      return false;
    }

    maxRanks = max(1, min(playerNames.length - 1, 3));
    ranks = List<bool>.filled(maxRanks, false);

    game = GameObject(
      players: List<Player>.from(playerNames.map((name) => Player(name: name))),
      scenarios: List<String>.from(packs.where((p) => p.isSelected).map((p) => p.scenarios).expand((e) => e).toList()),
      totalRounds: numberOfRounds,
    );

    return true;
  }
}
