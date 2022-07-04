import 'package:flutter/material.dart';

class VotingEntry extends StatefulWidget {
  final String name;

  const VotingEntry({super.key, required this.name});

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
            onTap: () {},
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.white), shape: BoxShape.circle),
                      height: 40,
                      child: Container(),
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
