import 'package:crank_it_up/screens/game_creation_screen.dart';
import 'package:flutter/material.dart';

import 'package:crank_it_up/components/buttons.dart';
import 'package:crank_it_up/components/logo.dart';

import 'package:crank_it_up/screens/pack_selection_screen.dart';
import 'package:crank_it_up/screens/settings_screen.dart';
import 'package:crank_it_up/screens/transitions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: Column(
          children: [
            const Logo(),
            PrimaryButton(
                text: 'PLAY GAME', function: () => Navigator.of(context).push(to(const GameCreationScreen()))),
            const SizedBox(height: 16),
            SecondaryButton(
                text: 'CHOOSE PACK', function: () => Navigator.of(context).push(to(const PackSelectionScreen()))),
            Expanded(child: Container()),
            ClickableIcon(
                iconData: Icons.settings, function: () => Navigator.of(context).push(to(const SettingsScreen()))),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
