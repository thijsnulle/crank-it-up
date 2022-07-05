import 'package:crank_it_up/components/buttons.dart';

import 'package:crank_it_up/screens/winner_screen.dart';

import 'package:crank_it_up/screens/transitions.dart';

import 'package:crank_it_up/app.dart';
import 'package:flutter/material.dart';
import 'package:crank_it_up/components/voting_entry.dart';
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
                    name: game.players[index].name,
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: PrimaryButton(
                  text: 'Next Round',
                  function: () => determineWinner(context),
                ))
          ],
        ));
  }

  void determineWinner(BuildContext context) {
    if (game.players.length == 2) {
      if (!Ranks.first || !Ranks.second) {
        return;
      }
      nextScreen(context);
    } else {
      if (!Ranks.first || !Ranks.second || !Ranks.third) {
        return;
      }
      nextScreen(context);
    }
  }

  void nextRound() {
    Ranks.first = false;
    Ranks.second = false;
    Ranks.third = false;
    for (int i = 0; i < game.players.length; i++) {
      game.players[i].updateScore();
      game.players[i].rank = -1;
    }
    game.players.sort(((a, b) => b.score.compareTo(a.score)));
  }

  void nextScreen(BuildContext context) {
    if (game.currentRound == game.totalRounds) {
      nextRound();
      Navigator.of(context).push(to(const WinnerScreen()));
      return;
    }
    game.currentRound++;
    nextRound();
    Navigator.of(context).push(to(const GameScreen()));
  }
}
