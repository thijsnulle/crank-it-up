import 'package:crank_it_up/components/alert.dart';
import 'package:crank_it_up/components/app_header.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/screens/winner_screen.dart';
import 'package:flutter/material.dart';
import 'package:crank_it_up/components/voting_entry.dart';
import 'package:page_transition/page_transition.dart';
import '../components/gradient_background.dart';
import 'game_screen.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHeader.create('VOTING', 'SCREEN', null, Icons.west_rounded, context),
        body: GradientBackground(
            child: Column(
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
        )));
  }

  void determineWinner(BuildContext context) {
    if (!ranks.every((r) => r)) {
      alert('Make sure to vote for ${maxRanks.toString()} players!', context);
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
