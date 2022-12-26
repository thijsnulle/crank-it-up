import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/screens/game_creation_screen.dart';
import 'package:crank_it_up/screens/game_screen.dart';
import 'package:crank_it_up/screens/rules_screen.dart';
import 'package:flutter/material.dart';

import 'package:crank_it_up/components/logo.dart';

import 'package:crank_it_up/screens/pack_selection_screen.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import 'package:crank_it_up/components/gradient_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: GradientBackground(
            child: Column(
          children: [
            const SizedBox(height: 64.0),
            const Logo(),
            TextButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                Navigator.of(context)
                    .push(PageTransition(type: PageTransitionType.rightToLeft, child: const GameCreationScreen()));
              },
              style: Theme.of(context).textButtonTheme.style,
              child: SizedBox(
                  width: 200,
                  child: Text('PLAY GAME',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.button!.copyWith(fontSize: 20.0))),
            ),
            const SizedBox(height: 16),
            if (game != null) ...[
              TextButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  Navigator.of(context)
                      .push(PageTransition(type: PageTransitionType.rightToLeft, child: const GameScreen()));
                },
                style: Theme.of(context)
                    .textButtonTheme
                    .style!
                    .copyWith(backgroundColor: MaterialStateProperty.all(colorScheme.surfaceVariant)),
                child: SizedBox(
                    width: 200,
                    child: Text('CONTINUE',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.button!.copyWith(fontSize: 20.0))),
              ),
              const SizedBox(height: 16),
            ],
            TextButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                Navigator.of(context)
                    .push(PageTransition(type: PageTransitionType.rightToLeft, child: const PackSelectionScreen()));
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: SizedBox(
                  width: 200,
                  child: Text('SELECT PACKS',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.button!.copyWith(fontSize: 20.0))),
            ),
            Expanded(child: Container()),
            IconButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                Navigator.of(context).push(
                  PageTransition(type: PageTransitionType.bottomToTop, child: RulesScreen()),
                );
              },
              icon: const Icon(Icons.rule),
              color: colorScheme.onBackground,
              iconSize: 36,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            const SizedBox(height: 64),
          ],
        )),
      ),
    );
  }
}
