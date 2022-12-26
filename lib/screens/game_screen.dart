import 'package:auto_size_text/auto_size_text.dart';
import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/components/app_header.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/components/gradient_background.dart';
import 'package:crank_it_up/screens/home_screen.dart';
import 'package:crank_it_up/screens/tie_voting_screen.dart';
import 'package:crank_it_up/screens/voting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:page_flip_builder/page_flip_builder.dart';
import 'package:page_transition/page_transition.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (game!.currentRound > game!.totalRounds) {
        showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return TieDialog();
            });
      }
    });
  }

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppHeader.create(
                'ROUND ${game!.currentRound}',
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
                              frontBuilder: (_) => StandardPackView(
                                  pageFlipKey: pageFlipKey,
                                  content: PackView(
                                    scenario: game!.currentScenario,
                                  )),
                              backBuilder: (_) => StandardPackView(
                                pageFlipKey: pageFlipKey,
                                content: const ScoreBoard(),
                              ),
                              flipAxis: Axis.horizontal,
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          PrimaryButton(
                              text: 'START VOTING',
                              function: () {
                                HapticFeedback.mediumImpact();
                                (game!.currentRound > game!.totalRounds)
                                    ? Navigator.of(context).push(PageTransition(
                                        child: const TieVotingScreen(),
                                        type: PageTransitionType.rightToLeft,
                                      ))
                                    : Navigator.of(context).push(PageTransition(
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

class StandardPackView extends StatelessWidget {
  const StandardPackView({super.key, required this.pageFlipKey, required this.content});

  final GlobalKey<PageFlipBuilderState> pageFlipKey;
  final Widget content;

  @override
  Widget build(context) {
    return GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          pageFlipKey.currentState?.flip();
        },
        child: Container(
            decoration: BoxDecoration(
                color: colorScheme.onPrimary,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [BoxShadow(blurRadius: 32.0, color: Color(0x66000000))]),
            child: Padding(key: const ValueKey<int>(0), padding: const EdgeInsets.all(32.0), child: content)));
  }
}

class PackView extends StatelessWidget {
  const PackView({super.key, required this.scenario});

  final Scenario scenario;

  @override
  Widget build(context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                    image: DecorationImage(image: Svg('assets/images/${scenario.pack}.svg', color: Colors.black))))),
        const SizedBox(height: 16.0),
        AutoSizeText(scenario.content,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: const Color.fromARGB(255, 22, 22, 29), fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(context) {
    return Column(children: [
      Text(
        'Scoreboard',
        style: Theme.of(context).textTheme.headline3?.copyWith(color: const Color.fromARGB(255, 22, 22, 29)),
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  game!.players.length,
                  (index) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Wrap(children: [
                      SizedBox(
                          width: 30,
                          child: Text('${index + 1}. ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: const Color.fromARGB(255, 22, 22, 29)))),
                      Text(game!.players[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: const Color.fromARGB(255, 22, 22, 29))),
                    ]),
                    Text('\t${game!.players[index].score}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: const Color.fromARGB(255, 22, 22, 29))),
                  ]),
                ),
              )))
    ]);
  }
}

class TieDialog extends StatelessWidget {
  TieDialog({super.key});
  final tiedPlayers = game!.players.where((element) => element.score == game!.players[0].score).toList();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'TIE-BREAKER',
        style: Theme.of(context).textTheme.headline4?.copyWith(color: colorScheme.surface),
        textAlign: TextAlign.center,
      ),
      content: Text(
        '${tiedPlayers.where((element) => element.name != tiedPlayers.last.name).map((e) => e.name).join(", ")} and ${tiedPlayers.last.name} are competing for first place',
        style: Theme.of(context).textTheme.headline4?.copyWith(color: colorScheme.surface, fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
