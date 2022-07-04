import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crank_it_up/app.dart' as app;

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
              if (widget.rank == "1" && !app.first) {
                app.first = false;
                widget.rank = "";
              } else if (widget.rank == "2" && !app.second) {
                app.second = false;
                widget.rank = "";
              } else if (!app.first) {
                app.first = true;
                widget.rank = "1";
              } else if (!app.second) {
                app.second = true;
                widget.rank = "2";
              } else {
                widget.rank = "3";
              }
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
}
