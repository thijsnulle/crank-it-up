import 'package:crank_it_up/screens/pack_selection_screen.dart';
import 'package:flutter/material.dart';

import 'package:crank_it_up/components/buttons.dart';

import 'package:crank_it_up/screens/home_screen.dart';
import 'package:crank_it_up/screens/game_screen.dart';
import 'package:crank_it_up/screens/transitions.dart';

class GameCreationScreen extends StatelessWidget {
  const GameCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: Column(
          children: [
            Text('Game Creation Screen', style: Theme.of(context).textTheme.button),
            PrimaryButton(text: 'Back to Home', function: () => Navigator.of(context).push(to(const HomeScreen()))),
            PrimaryButton(text: 'Go to Game', function: () => Navigator.of(context).push(to(const GameScreen()))),
            PrimaryButton(
                text: 'Choose Pack', function: () => Navigator.of(context).push(to(const PackSelectionScreen()))),
          ],
        ),
      ),
    );
  }
}
