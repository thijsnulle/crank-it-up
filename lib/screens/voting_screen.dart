import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/screens/winner_screen.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:crank_it_up/components/voting_entry.dart';
import 'package:page_transition/page_transition.dart';
import 'game_screen.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.west),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('VOTING', style: Theme.of(context).textTheme.headline1),
              Text('SCREEN', style: Theme.of(context).textTheme.headline2),
            ],
          ),
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: game.players.length,
                itemBuilder: (context, index) {
                  return VotingEntry(
                    player: game.players[index],
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: PrimaryButton(text: 'Next Round', function: () => {determineWinner(context)}))
          ],
        ));
  }

  void determineWinner(BuildContext context) {
    if (!ranks.every((r) => r)) {
      showFlash(
          duration: const Duration(seconds: 5),
          context: context,
          builder: (_, controller) => Flash(
                controller: controller,
                position: FlashPosition.top,
                behavior: FlashBehavior.floating,
                child: FlashBar(
                  content: Text('Make sure to vote for ${maxRanks.toString()} players.'),
                  indicatorColor: colorScheme.primary,
                ),
              ));
      return;
    }

    // Update scores and reset ranks for next round.
    ranks = List<bool>.filled(maxRanks, false);
    for (var player in game.players) {
      player.updateScore();
    }

    (++game.currentRound > game.totalRounds)
        ? Navigator.of(context).push(PageTransition(child: const WinnerScreen(), type: PageTransitionType.rightToLeft))
        : Navigator.of(context).push(PageTransition(child: const GameScreen(), type: PageTransitionType.rightToLeft));
  }
}
