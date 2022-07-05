import 'package:auto_size_text/auto_size_text.dart';
import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/screens/home_screen.dart';
import 'package:crank_it_up/screens/voting_screen.dart';
import 'package:flutter/material.dart';

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
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).push(PageTransition(
              child: const HomeScreen(),
              type: PageTransitionType.bottomToTop,
            )),
            icon: const Icon(Icons.home_outlined),
          ),
          title: Text('ROUND ${game.currentRound}', style: Theme.of(context).textTheme.headline1),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.leaderboard_outlined), onPressed: () => pageFlipKey.currentState?.flip()),
          ],
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Expanded(
                  child: PageFlipBuilder(
                    key: pageFlipKey,
                    frontBuilder: (_) =>
                        PackView(onFlip: () => pageFlipKey.currentState?.flip(), text: currentScenario),
                    backBuilder: (_) => ScoreBoard(
                      onFlip: () => pageFlipKey.currentState?.flip(),
                    ),
                    flipAxis: Axis.horizontal,
                  ),
                ),
                const SizedBox(height: 32.0),
                PrimaryButton(
                    text: 'START VOTING',
                    function: () => Navigator.of(context).push(PageTransition(
                          child: const VotingScreen(),
                          type: PageTransitionType.rightToLeft,
                        )))
              ],
            )),
      ),
    );
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
                color: colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [BoxShadow(blurRadius: 32.0, color: Color(0x66000000))]),
            child: Padding(
              key: const ValueKey<int>(0),
              padding: const EdgeInsets.all(32.0),
              child: AutoSizeText(
                text,
                style: Theme.of(context).textTheme.headline4,
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
                color: colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [BoxShadow(blurRadius: 32.0, color: Color(0x66000000))]),
            child: Padding(
                key: const ValueKey<int>(0),
                padding: const EdgeInsets.all(32.0),
                child: Column(children: [
                  Text(
                    'Scoreboard',
                    style: Theme.of(context).textTheme.headline3,
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
                                      child: Text('${index + 1}. ', style: Theme.of(context).textTheme.headline5)),
                                  Text(game.players[index].name, style: Theme.of(context).textTheme.headline6),
                                ]),
                                Text('\t${game.players[index].score}', style: Theme.of(context).textTheme.headline5),
                              ]),
                            ),
                          )))
                ]))));
  }
}
