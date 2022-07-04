import 'package:crank_it_up/screens/pack_selection_screen.dart';
import 'package:crank_it_up/screens/player_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:crank_it_up/screens/transitions.dart';
import 'package:crank_it_up/components/buttons.dart';

class GameCreationScreen extends StatefulWidget {
  const GameCreationScreen({super.key});

  @override
  GameCreationScreenState createState() => GameCreationScreenState();
}

class GameCreationScreenState extends State<GameCreationScreen> {
  int numberOfPlayers = 4;
  int numberOfRounds = 5;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.west_rounded)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CREATE', style: Theme.of(context).textTheme.headline1),
              Text('GAME', style: Theme.of(context).textTheme.headline2)
            ],
          ),
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Number of Players:', style: Theme.of(context).textTheme.button),
                Wrap(children: [
                  Row(children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => setState(() => numberOfPlayers = (numberOfPlayers - 1).clamp(2, 8)),
                      color: Colors.white,
                    ),
                    NumberPicker(
                      value: numberOfPlayers,
                      minValue: 2,
                      maxValue: 8,
                      itemWidth: 30,
                      itemHeight: 30,
                      onChanged: (v) => setState(() => numberOfPlayers = v),
                      selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
                      textStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                      haptics: true,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => setState(() => numberOfPlayers = (numberOfPlayers + 1).clamp(2, 8)),
                      color: Colors.white,
                    )
                  ])
                ]),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Number of Rounds:', style: Theme.of(context).textTheme.button),
                Wrap(children: [
                  Row(children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => setState(() => numberOfRounds = (numberOfRounds - 1).clamp(5, 20)),
                      color: Colors.white,
                    ),
                    NumberPicker(
                      value: numberOfRounds,
                      minValue: 3,
                      maxValue: 10,
                      itemWidth: 30,
                      itemHeight: 30,
                      onChanged: (v) => setState(() => numberOfRounds = v),
                      selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
                      textStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                      haptics: true,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => setState(() => numberOfRounds = (numberOfRounds + 1).clamp(5, 20)),
                      color: Colors.white,
                    )
                  ])
                ]),
              ]),
              Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(to(const PackSelectionScreen())),
                      child: Text(
                        'Still want to change your pack?',
                        style: TextStyle(color: Colors.grey.shade500, decoration: TextDecoration.underline),
                      ))
                ],
              ),
              Expanded(child: Container()),
              PrimaryButton(
                  text: 'LET\'S GO',
                  function: () => Navigator.of(context)
                      .push(to(PlayerInputScreen(numberOfPlayers: numberOfPlayers, numberOfRounds: numberOfRounds)))),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}
