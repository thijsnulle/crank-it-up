import 'package:crank_it_up/screens/score_board_screen.dart';
import 'package:flutter/material.dart';

import 'package:crank_it_up/components/buttons.dart';

import 'package:crank_it_up/screens/home_screen.dart';
import 'package:crank_it_up/screens/winner_screen.dart';
import 'package:crank_it_up/screens/transitions.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: Column(children: [
          Text('Game Screen', style: Theme.of(context).textTheme.button),
          PrimaryButton(text: 'Next Game Screen', function: () => Navigator.of(context).push(to(const GameScreen()))),
          PrimaryButton(text: 'Abort Game', function: () => Navigator.of(context).push(to(const HomeScreen()))),
          PrimaryButton(text: 'Score Board', function: () => Navigator.of(context).push(to(const ScoreBoardScreen()))),
          PrimaryButton(text: 'Go to Winner', function: () => Navigator.of(context).push(to(const WinnerScreen()))),
        ]),
      ),
    );
  }
}
