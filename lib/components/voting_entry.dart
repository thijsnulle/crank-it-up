import 'package:crank_it_up/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:crank_it_up/app.dart';
import 'package:flutter/services.dart';

//ignore: must_be_immutable
class VotingEntry extends StatefulWidget {
  Player player;
  final Function() notifyParent;

  VotingEntry({super.key, required this.player, required this.notifyParent});

  @override
  VotingEntryState createState() => VotingEntryState();
}

class VotingEntryState extends State<VotingEntry> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: GestureDetector(
            onTap: () {
              setState(() {
                HapticFeedback.mediumImpact();
                if (widget.player.rank == maxRanks) {
                  if (ranks.contains(false)) {
                    int newRank = ranks.indexOf(false);
                    widget.player.rank = newRank;
                    ranks[newRank] = true;
                  } else {
                    Player p = game.players.firstWhere((p) => p.rank == maxRanks - 1);
                    p.rank = maxRanks;
                    widget.player.rank = maxRanks - 1;
                  }
                } else if (widget.player.rank != maxRanks) {
                  ranks[widget.player.rank] = false;
                  widget.player.rank = maxRanks;
                }
                widget.notifyParent();
              });
            },
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: colorScheme.onBackground), shape: BoxShape.circle),
                      height: 40,
                      child: Center(
                        child: Text(widget.player.rank != maxRanks ? (widget.player.rank + 1).toString() : '',
                            style: Theme.of(context).textTheme.button),
                      ),
                    )),
                Expanded(
                    flex: 9,
                    child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Stack(
                          children: [
                            Container(
                              height: 40,
                              decoration:
                                  BoxDecoration(border: Border(bottom: BorderSide(color: colorScheme.onBackground))),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.player.name,
                                  style: Theme.of(context).textTheme.button,
                                ))
                          ],
                        )))
              ],
            ),
          )),
    );
  }
}
