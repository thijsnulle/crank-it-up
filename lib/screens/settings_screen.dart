import 'package:flutter/material.dart';

import 'package:crank_it_up/components/buttons.dart';

import 'package:crank_it_up/screens/home_screen.dart';
import 'package:crank_it_up/screens/transitions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: Column(children: [
          Text('Settings Screen', style: Theme.of(context).textTheme.button),
          PrimaryButton(text: 'Back to Home', function: () => Navigator.of(context).push(to(const HomeScreen()))),
        ]),
      ),
    );
  }
}
