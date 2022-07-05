import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crank_it_up/app.dart';

class VotingEntry extends StatefulWidget {
  final String name;
  String rank = "";

  VotingEntry({super.key, required this.name});

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
                if (widget.rank == "1") {
                  Ranks.first = false;
                  updateRank(-1);
                } else if (widget.rank == "2") {
                  Ranks.second = false;
                  updateRank(-1);
                } else if (widget.rank == "3") {
                  Ranks.third = false;
                  updateRank(-1);
                } else if (!Ranks.first) {
                  Ranks.first = true;
                  updateRank(1);
                } else if (!Ranks.second) {
                  Ranks.second = true;
                  updateRank(2);
                } else if (!Ranks.third) {
                  Ranks.third = true;
                  updateRank(3);
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
                      child: Center(child: Text(widget.rank, style: Theme.of(context).textTheme.button)),
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
                            Text(
                              widget.name,
                              style: Theme.of(context).textTheme.button,
                            )
                          ],
                        )))
              ],
            ),
          )),
    );
  }

  updateRank(int newRank) {
    game.players.firstWhere((element) => element.name == widget.name).rank = newRank;

    if (newRank == -1) {
      widget.rank = "";
    } else {
      widget.rank = newRank.toString();
    }
  }
}
