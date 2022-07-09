import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/screens/game_creation_screen.dart';
import 'package:crank_it_up/screens/rules_screen.dart';
import 'package:flutter/material.dart';

import 'package:crank_it_up/components/logo.dart';

import 'package:crank_it_up/screens/pack_selection_screen.dart';
import 'package:crank_it_up/screens/settings_screen.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 64.0),
            const Logo(),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .push(PageTransition(type: PageTransitionType.rightToLeft, child: const GameCreationScreen())),
              style: Theme.of(context).textButtonTheme.style,
              child: SizedBox(
                  width: 200,
                  child: Text('PLAY GAME',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.button!.copyWith(fontSize: 20.0))),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .push(PageTransition(type: PageTransitionType.rightToLeft, child: const PackSelectionScreen())),
              style: Theme.of(context).elevatedButtonTheme.style,
              child: SizedBox(
                  width: 200,
                  child: Text('SELECT PACKS',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.button!.copyWith(fontSize: 20.0))),
            ),
            Expanded(child: Container()),
            Wrap(children: [
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  PageTransition(type: PageTransitionType.bottomToTop, child: const SettingsScreen()),
                ),
                icon: const Icon(Icons.settings),
                color: colorScheme.onBackground,
                iconSize: 36,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  PageTransition(type: PageTransitionType.bottomToTop, child: RulesScreen()),
                ),
                icon: const Icon(Icons.rule),
                color: colorScheme.onBackground,
                iconSize: 36,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              )
            ]),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
