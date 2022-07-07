import 'package:confetti/confetti.dart';
import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/components/app_header.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:flutter/material.dart';

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
    game.players.sort((p1, p2) => p2.score.compareTo(p1.score));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Scaffold(
            appBar: AppHeader.create(
                game.players.reduce((p1, p2) => p1.score >= p2.score ? p1 : p2).name, 'WINS!!!', null, null, context),
            body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                  Color.fromARGB(255, 30, 21, 65),
                  Color.fromARGB(255, 44, 31, 95),
                  Color(0xFF473198),
                  Color.fromARGB(255, 98, 67, 207)
                ])),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(children: [
                        Text(
                          'Final Scoreboard',
                          style: Theme.of(context).textTheme.headline5!.copyWith(color: colorScheme.onBackground),
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
                                                    .headline5!
                                                    .copyWith(color: colorScheme.onBackground))),
                                        Text(game.players[index].name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(color: colorScheme.onBackground)),
                                      ]),
                                      Text('\t${game.players[index].score}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(color: colorScheme.onBackground)),
                                    ]),
                                  ),
                                ))),
                        Expanded(child: Container()),
                        PrimaryButton(
                            text: 'END GAME',
                            function: () => Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false)),
                        const SizedBox(height: 32.0)
                      ]),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: ConfettiWidget(
                          confettiController: controller,
                          blastDirectionality: BlastDirectionality.explosive,
                          colors: const [Colors.green, Colors.blue, Colors.pinkAccent, Colors.orange, Colors.purple],
                          numberOfParticles: 25,
                        )),
                  ],
                ))));
  }
}
