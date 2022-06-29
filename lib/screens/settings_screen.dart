import 'package:flutter/material.dart';

import 'package:crank_it_up/components/buttons.dart';
import 'package:crank_it_up/components/logo.dart';

import 'package:crank_it_up/screens/transitions.dart';
import 'package:crank_it_up/screens/home_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: Column(
          children: [
            const Logo(),
            PrimaryButton(text: 'PLAY', function: () => {}),
            const SizedBox(height: 16),
            SecondaryButton(text: 'CHOOSE', function: () => {}),
            Expanded(child: Container()),
            ClickableIcon(iconData: Icons.settings, function: () => Navigator.of(context).push(to(const HomeScreen()))),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
