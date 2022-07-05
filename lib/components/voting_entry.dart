import 'package:flutter/material.dart';
import 'package:crank_it_up/app.dart';

class VotingEntry extends StatefulWidget {
  Player player;

  VotingEntry({super.key, required this.player});

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
                if (widget.player.rank == maxRanks && ranks.contains(false)) {
                  int newRank = ranks.indexOf(false);
                  widget.player.rank = newRank;
                  ranks[newRank] = true;
                } else if (widget.player.rank != maxRanks) {
                  ranks[widget.player.rank] = false;
                  widget.player.rank = maxRanks;
                }
              });
            },
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.white), shape: BoxShape.circle),
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
                              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
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
