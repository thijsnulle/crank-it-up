import 'package:confetti/confetti.dart';
import 'package:crank_it_up/app.dart';
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
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Column(
                children: [
                  Text(game.players.reduce((p1, p2) => p1.score >= p2.score ? p1 : p2).name,
                      style: Theme.of(context).textTheme.headline1),
                  Text('WINS!!!', style: Theme.of(context).textTheme.headline2)
                ],
              ),
              toolbarHeight: 200,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(children: [
                    Text(
                      'Final Scoreboard',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: Column(
                              children: List.generate(
                            game.players.length,
                            (index) => Wrap(children: [
                              Text(
                                ' ${index + 1}. ',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                game.players[index].name,
                                style: Theme.of(context).textTheme.headline6,
                              )
                            ]),
                          )),
                        )),
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
            )));
  }
}
