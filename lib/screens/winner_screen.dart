import 'package:confetti/confetti.dart';
import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/components/app_header.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:flutter/material.dart';

import 'package:crank_it_up/components/gradient_background.dart';
import 'package:flutter/services.dart';

class WinnerScreen extends StatefulWidget {
  const WinnerScreen({super.key});

  @override
  WinnerScreenState createState() => WinnerScreenState();
}

class WinnerScreenState extends State<WinnerScreen> {
  late ConfettiController controller;

  @override
  void initState() {
    controller = ConfettiController(duration: const Duration(seconds: 5));
    controller.play();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Builder(
            builder: (context) => Scaffold(
                appBar: AppHeader.create(game!.players.reduce((p1, p2) => p1.score >= p2.score ? p1 : p2).name,
                    'WINS!!!', null, null, CrossAxisAlignment.center, context),
                extendBodyBehindAppBar: true,
                body: GradientBackground(
                    child: Column(children: [
                  const SizedBox(height: 200),
                  Expanded(
                      child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(children: [
                          const Podium(),
                          const ScoreBoard(),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          PrimaryButton(
                              text: 'END GAME',
                              function: () {
                                game = null;
                                HapticFeedback.mediumImpact();
                                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                              }),
                        ]),
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: ConfettiWidget(
                            confettiController: controller,
                            maxBlastForce: 100,
                            blastDirectionality: BlastDirectionality.explosive,
                            colors: const [Colors.green, Colors.blue, Colors.pinkAccent, Colors.orange, Colors.purple],
                            numberOfParticles: 25,
                            shouldLoop: true,
                          )),
                    ],
                  ))
                ])))));
  }
}

class Podium extends StatelessWidget {
  const Podium({super.key});

  @override
  Widget build(BuildContext context) {
    if (game!.players.length > 2) {
      return Stack(
        children: const [
          Positioned(bottom: 0, left: 0, child: Pillar(height: 240, rank: 2)),
          Positioned(bottom: 0, right: 0, child: Pillar(height: 165, rank: 3)),
          Align(alignment: Alignment.bottomCenter, child: Pillar(height: 310, rank: 1)),
        ],
      );
    } else {
      return Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              game!.players.length,
              (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(children: [
                    Text(
                      '${index + 1}. ',
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: colorScheme.onBackground),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('\t${game!.players[index].name}',
                        style: Theme.of(context).textTheme.headline5!.copyWith(color: colorScheme.onBackground)),
                    Expanded(
                        child: Text(
                      'Score: \t${game!.players[index].score}',
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: colorScheme.onBackground),
                      textAlign: TextAlign.right,
                    )),
                  ])),
            ),
          ));
    }
  }
}

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onBackground,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        boxShadow: const [BoxShadow(blurRadius: 32.0, color: Color(0x66000000))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          game!.players.length,
          (index) {
            if (index > 2) {
              return Padding(
                  padding: const EdgeInsets.only(left: 20, top: 3, bottom: 3, right: 20),
                  child: Row(children: [
                    Wrap(children: [
                      SizedBox(
                        width: 30,
                        child: Text(
                          '${index + 1}. ',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(color: colorScheme.surface, fontSize: 20),
                        ),
                      )
                    ]),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('\t${game!.players[index].name}',
                        style:
                            Theme.of(context).textTheme.headline6!.copyWith(color: colorScheme.surface, fontSize: 20)),
                    Expanded(
                        child: Text(
                      'Score: \t${game!.players[index].score}',
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: colorScheme.surface, fontSize: 20),
                      textAlign: TextAlign.right,
                    )),
                  ]));
            }

            return Container();
          },
        ),
      ),
    );
  }
}

class Pillar extends StatelessWidget {
  final double height;
  final int rank;
  const Pillar({super.key, required this.height, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          boxShadow: const [BoxShadow(blurRadius: 32.0, color: Color(0x66000000))],
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      width: (MediaQuery.of(context).size.width - 48.0) / 3.0,
      height: height,
      child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.onBackground),
                    shape: BoxShape.circle,
                    color: rankColors[rank - 1],
                  ),
                  height: 48,
                  width: 48,
                  child: Center(
                      child: Text('$rank',
                          style: Theme.of(context).textTheme.headline5!.copyWith(color: colorScheme.onBackground))),
                ),
                const SizedBox(height: 16),
                Text(game!.players[rank - 1].name),
                const SizedBox(height: 10),
                Text(game!.players[rank - 1].score.toString()),
              ]))),
    );
  }
}
