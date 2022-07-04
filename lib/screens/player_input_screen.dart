import 'package:crank_it_up/screens/game_screen.dart';
import 'package:crank_it_up/screens/transitions.dart';
import 'package:flutter/material.dart';
import 'package:crank_it_up/components/buttons.dart';

class PlayerInputScreen extends StatefulWidget {
  const PlayerInputScreen({super.key, required this.numberOfPlayers, required this.numberOfRounds});

  final int numberOfPlayers;
  final int numberOfRounds;

  @override
  PlayerInputScreenState createState() =>
      PlayerInputScreenState(numberOfPlayers: numberOfPlayers, numberOfRounds: numberOfRounds);
}

class PlayerInputScreenState extends State<PlayerInputScreen> {
  final int numberOfPlayers;
  final int numberOfRounds;
  List<String> playerNames;

  PlayerInputScreenState({required this.numberOfPlayers, required this.numberOfRounds})
      : playerNames = List.filled(numberOfPlayers, '');

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CHOOSE', style: Theme.of(context).textTheme.headline1),
              Text('PLAYERS', style: Theme.of(context).textTheme.headline2)
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
              Column(
                  children: List.generate(
                numberOfPlayers,
                (index) => SizedBox(
                  height: 40,
                  child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        hintText: 'Player Name',
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                      ),
                      onChanged: (s) => playerNames[index] = s,
                      style: const TextStyle(color: Colors.white)),
                ),
              )),
              Expanded(child: Container()),
              PrimaryButton(
                text: 'START GAME',
                function: () => {
                  Navigator.of(context).push(to(const GameScreen())),
                },
              ),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}
