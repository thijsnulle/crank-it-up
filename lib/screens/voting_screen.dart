import 'package:crank_it_up/components/buttons.dart';
import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/screens/winner_screen.dart';
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
                    name: game.players[index].name,
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: PrimaryButton(
                    text: 'Next Round',
                    function: () => {
                          determineWinner(context)
                              ? Navigator.of(context).push(
                                  PageTransition(child: const WinnerScreen(), type: PageTransitionType.rightToLeft))
                              : Navigator.of(context)
                                  .push(PageTransition(child: const GameScreen(), type: PageTransitionType.rightToLeft))
                        }))
          ],
        ));
  }

  bool determineWinner(BuildContext context) {
    if (game.currentRound == game.totalRounds) return true;
    game.currentRound++;

    return false;
  }
}
