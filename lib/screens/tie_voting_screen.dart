import 'package:crank_it_up/components/alert.dart';
import 'package:crank_it_up/components/app_header.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:crank_it_up/app.dart';
import 'package:crank_it_up/screens/winner_screen.dart';
import 'package:flutter/material.dart';
import 'package:crank_it_up/components/voting_entry.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:crank_it_up/components/gradient_background.dart';

class TieVotingScreen extends StatefulWidget {
  const TieVotingScreen({super.key});

  @override
  TieVotingScreenState createState() => TieVotingScreenState();
}

class TieVotingScreenState extends State<TieVotingScreen> {
  @override
  void initState() {
    maxRanks = 1;
    for (var element in game!.players) {
      element.rank = 1;
    }
    for (int i = 1; i < ranks.length; i++) {
      ranks[i] = true;
    }
    super.initState();
  }

  final tiedPlayers = game!.players.where((element) => element.score == game!.players[0].score).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHeader.create('VOTING', 'SCREEN', null, Icons.west_rounded, CrossAxisAlignment.start, context),
        extendBodyBehindAppBar: true,
        body: GradientBackground(
            child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: tiedPlayers.length,
                itemBuilder: (context, index) {
                  return VotingEntry(
                    player: tiedPlayers[index],
                    notifyParent: refresh,
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: PrimaryButton(
                    text: 'Next Round',
                    function: () {
                      HapticFeedback.mediumImpact;
                      determineWinner(context);
                    }))
          ],
        )));
  }

  void refresh() {
    setState(() {});
  }

  void determineWinner(BuildContext context) {
    if (!ranks[0]) {
      alert('Make sure to vote for 1 player!', context);
      return;
    }

    // Update scores and reset ranks for next round.
    ranks = List<bool>.filled(maxRanks, false);
    for (var player in tiedPlayers) {
      player.updateScore();
    }

    game!.players.sort((p1, p2) => p2.score.compareTo(p1.score));

    Navigator.of(context).push(PageTransition(child: const WinnerScreen(), type: PageTransitionType.rightToLeft));
  }
}
