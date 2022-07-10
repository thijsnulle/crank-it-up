import 'package:auto_size_text/auto_size_text.dart';
import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/components/app_header.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/components/gradient_background.dart';
import 'package:crank_it_up/screens/home_screen.dart';
import 'package:crank_it_up/screens/voting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:page_transition/page_transition.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  String currentScenario = '';

  @override
  void initState() {
    game.scenarios.shuffle();
    currentScenario = game.scenarios.removeLast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppHeader.create(
                'ROUND ${game.currentRound}',
                null,
                () => Navigator.of(context).push(PageTransition(
                      child: const HomeScreen(),
                      type: PageTransitionType.bottomToTop,
                    )),
                Icons.home_outlined,
                CrossAxisAlignment.center,
                context,
                actions: [
                  IconButton(
                      icon: const Icon(Icons.leaderboard_outlined), onPressed: () => pageFlipKey.currentState?.flip()),
                ]),
            extendBodyBehindAppBar: true,
            body: GradientBackground(
                child: Column(children: [
              const SizedBox(height: 200),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: PageFlipBuilder(
                              key: pageFlipKey,
                              frontBuilder: (_) => PackView(
                                  onFlip: () {
                                    HapticFeedback.mediumImpact();
                                    pageFlipKey.currentState?.flip();
                                  },
                                  text: currentScenario),
                              backBuilder: (_) => ScoreBoard(
                                onFlip: () {
                                  HapticFeedback.mediumImpact();
                                  pageFlipKey.currentState?.flip();
                                },
                              ),
                              flipAxis: Axis.horizontal,
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          PrimaryButton(
                              text: 'START VOTING',
                              function: () {
                                HapticFeedback.mediumImpact();
                                Navigator.of(context).push(PageTransition(
                                  child: const VotingScreen(),
                                  type: PageTransitionType.rightToLeft,
                                ));
                              })
                        ],
                      )))
            ])),
          ),
        ));
  }
}

class PackView extends StatelessWidget {
  const PackView({super.key, required this.onFlip, required this.text});

  final Function() onFlip;
  final String text;

  @override
  Widget build(context) {
    return GestureDetector(
        onTap: onFlip,
        child: Container(
            decoration: BoxDecoration(
                color: colorScheme.onPrimary,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [BoxShadow(blurRadius: 32.0, color: Color(0x66000000))]),
            child: Padding(
              key: const ValueKey<int>(0),
              padding: const EdgeInsets.all(32.0),
              child: AutoSizeText(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: const Color.fromARGB(255, 22, 22, 29), fontWeight: FontWeight.bold),
              ),
            )));
  }
}

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key, required this.onFlip});

  final Function() onFlip;

  @override
  Widget build(context) {
    return GestureDetector(
        onTap: onFlip,
        child: Container(
            decoration: BoxDecoration(
                color: colorScheme.onPrimary,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [BoxShadow(blurRadius: 32.0, color: Color(0x66000000))]),
            child: Padding(
                key: const ValueKey<int>(0),
                padding: const EdgeInsets.all(32.0),
                child: Column(children: [
                  Text(
                    'Scoreboard',
                    style:
                        Theme.of(context).textTheme.headline3?.copyWith(color: const Color.fromARGB(255, 22, 22, 29)),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              game.players.length,
                              (index) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Wrap(children: [
                                  SizedBox(
                                      width: 30,
                                      child: Text('${index + 1}. ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(color: const Color.fromARGB(255, 22, 22, 29)))),
                                  Text(game.players[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(color: const Color.fromARGB(255, 22, 22, 29))),
                                ]),
                                Text('\t${game.players[index].score}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(color: const Color.fromARGB(255, 22, 22, 29))),
                              ]),
                            ),
                          )))
                ]))));
  }
}
