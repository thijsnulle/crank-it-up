import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/components/app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

import 'package:crank_it_up/components/gradient_background.dart';

class RulesScreen extends StatelessWidget {
  RulesScreen({super.key});

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar:
            AppHeader.create('RULES', 'BOOK', null, Icons.west_rounded, CrossAxisAlignment.center, context, actions: [
          IconButton(
              icon: const Icon(Icons.rotate_left),
              onPressed: () {
                HapticFeedback.mediumImpact();
                pageFlipKey.currentState?.flip();
              }),
        ]),
        body: GradientBackground(
            child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: PageFlipBuilder(
            key: pageFlipKey,
            frontBuilder: (_) => BasicRules(onFlip: () {
              HapticFeedback.mediumImpact();
              pageFlipKey.currentState?.flip();
            }),
            backBuilder: (_) => DrinkingRules(onFlip: () {
              HapticFeedback.mediumImpact();
              pageFlipKey.currentState?.flip();
            }),
          ),
        )),
      ),
    );
  }
}

class BasicRules extends StatelessWidget {
  const BasicRules({super.key, required this.onFlip});

  final Function() onFlip;

  @override
  Widget build(context) {
    return GestureDetector(
        onTap: onFlip,
        child: Container(
            decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [BoxShadow(blurRadius: 32.0, color: Color(0x66000000))]),
            child: Padding(
              key: const ValueKey<int>(0),
              padding: const EdgeInsets.all(16.0),
              child: Markdown(
                data:
                    '# BASIC RULES\nThe aim of the game is to find the perfect song to a given scenario, or at least better than your competitors!\n1. Select the themed packs you want to play in _Pack Selection_ on the home screen.\n2. Create a game from the home screen.\n3. Prepare your speaker and make sure everyone can player their songs, e.g. with Spotify Sessions.\n4. Play a round, read the card and think about what song fits with the scenario.\n5. If everyone has found a song, play them in order of the current score.\n6. Go to the voting screen and decide collectively on who you thought had the best songs.\n7. Play until the rounds are over and repeat!',
                styleSheet: MarkdownStyleSheet(
                  listBullet: const TextStyle(fontSize: 18.0),
                  p: const TextStyle(fontSize: 18.0),
                ),
              ),
            )));
  }
}

class DrinkingRules extends StatelessWidget {
  const DrinkingRules({super.key, required this.onFlip});

  final Function() onFlip;

  @override
  Widget build(context) {
    return GestureDetector(
        onTap: onFlip,
        child: Container(
            decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [BoxShadow(blurRadius: 32.0, color: Color(0x66000000))]),
            child: const Padding(
              key: ValueKey<int>(0),
              padding: EdgeInsets.all(16.0),
              child: Markdown(
                data: '# DRINKING GAME',
              ),
            )));
  }
}
