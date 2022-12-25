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
    return WillPopScope(child: buildPage(context), onWillPop: () async => false);
  }

  Widget buildPage(BuildContext context) {
    Player winner = game!.players.reduce((p1, p2) => p1.score >= p2.score ? p1 : p2);

    return Builder(
      builder: (context) => Scaffold(
          appBar: AppHeader.create(winner.name, 'WINS!', null, null, CrossAxisAlignment.center, context),
          extendBodyBehindAppBar: true,
          body: GradientBackground(
            child: Column(children: [
              const SizedBox(height: 240),
              Expanded(child: Stack(children: [createScoreboard(context), createConfetti()]))
            ]),
          )),
    );
  }

  Widget createScoreboard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(children: [
        // const Podium(),
        const ScoreBoard(),
        Expanded(child: Container()),
        PrimaryButton(
            text: 'END GAME',
            function: () {
              game = null;
              HapticFeedback.mediumImpact();
              Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
            }),
      ]),
    );
  }

  Widget createConfetti() {
    return Align(
        alignment: Alignment.topCenter,
        child: ConfettiWidget(
          confettiController: controller,
          maxBlastForce: 100,
          blastDirectionality: BlastDirectionality.explosive,
          colors: const [Colors.green, Colors.blue, Colors.pinkAccent, Colors.orange, Colors.purple],
          numberOfParticles: 25,
          shouldLoop: true,
        ));
  }
}

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      createPodium(),
      createScoreboard(),
    ]);
  }

  Widget createPodium() {
    return Stack(
      children: [
        const Positioned(bottom: 0, left: 0, child: Pillar(height: 240, rank: 2)),
        (game!.players.length >= 3)
            ? const Positioned(bottom: 0, right: 0, child: Pillar(height: 165, rank: 3))
            : Container(),
        const Align(alignment: Alignment.bottomCenter, child: Pillar(height: 310, rank: 1)),
      ],
    );
  }

  Widget createScoreboard() {
    if (game!.players.length <= 3) {
      return Container();
    }

    List<Player> remainingPlayers = game!.players.sublist(3);
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onBackground,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        boxShadow: const [BoxShadow(blurRadius: 32.0, color: Color(0x66000000))],
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: remainingPlayers.map(createScoreboardElement).toList(),
      ),
    );
  }

  Widget createScoreboardElement(Player player) {
    return Container(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(children: [
            Text(player.name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            Expanded(child: Container()),
            Text('${player.score} pts', style: const TextStyle(color: Colors.black)),
          ])),
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
      child: Column(children: [
        const SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: colorScheme.onBackground), shape: BoxShape.circle, color: rankColors[rank - 1]),
          height: 48,
          child: Center(
              child: Text('$rank',
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: colorScheme.onBackground))),
        ),
        const SizedBox(height: 16.0),
        Text(game!.players[rank - 1].name, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),
        Text('${game!.players[rank - 1].score.toString()} pts'),
      ]),
    );
  }
}
