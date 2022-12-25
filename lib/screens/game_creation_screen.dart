import 'package:crank_it_up/color_scheme.dart';
import 'package:crank_it_up/components/app_header.dart';
import 'package:crank_it_up/components/gradient_background.dart';
import 'package:crank_it_up/screens/pack_selection_screen.dart';
import 'package:crank_it_up/screens/player_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:crank_it_up/app.dart';

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
        appBar: AppHeader.create('CREATE', 'GAME', null, Icons.west_rounded, CrossAxisAlignment.start, context),
        extendBodyBehindAppBar: true,
        body: GradientBackground(
            child: Column(children: [
          const SizedBox(height: 240),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Number of Players:', style: Theme.of(context).textTheme.button),
                  Wrap(children: [
                    Row(children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => setState(() {
                          HapticFeedback.mediumImpact();
                          numberOfPlayers = (numberOfPlayers - 1).clamp(2, 8);
                        }),
                        color: colorScheme.onBackground,
                      ),
                      NumberPicker(
                        value: numberOfPlayers,
                        minValue: 2,
                        maxValue: 8,
                        itemWidth: 30,
                        itemHeight: 30,
                        onChanged: (v) => setState(() {
                          HapticFeedback.mediumImpact();
                          numberOfPlayers = v;
                        }),
                        selectedTextStyle: TextStyle(color: colorScheme.onBackground, fontSize: 24),
                        textStyle: TextStyle(color: colorScheme.secondary, fontSize: 16),
                        haptics: true,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => setState(() {
                          HapticFeedback.mediumImpact();
                          numberOfPlayers = (numberOfPlayers + 1).clamp(2, 8);
                        }),
                        color: colorScheme.onBackground,
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
                        onPressed: () => setState(() {
                          HapticFeedback.mediumImpact();
                          numberOfRounds = (numberOfRounds - 1).clamp(3, 10);
                        }),
                        color: colorScheme.onBackground,
                      ),
                      NumberPicker(
                        value: numberOfRounds,
                        minValue: 3,
                        maxValue: 10,
                        itemWidth: 30,
                        itemHeight: 30,
                        onChanged: (v) => setState(() {
                          HapticFeedback.mediumImpact();
                          numberOfRounds = v;
                        }),
                        selectedTextStyle: TextStyle(color: colorScheme.onBackground, fontSize: 24),
                        textStyle: TextStyle(color: colorScheme.secondary, fontSize: 16),
                        haptics: true,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => setState(() {
                          HapticFeedback.mediumImpact();
                          numberOfRounds = (numberOfRounds + 1).clamp(3, 10);
                        }),
                        color: colorScheme.onBackground,
                      )
                    ])
                  ]),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Selected packs: ',
                      style: TextStyle(color: colorScheme.tertiary),
                    )
                  ],
                ),
                Row(
                    children: List.generate(
                        (packs.where((p) => p.isSelected)).length,
                        (index) => Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: Svg(
                                            'assets/images/${(packs.where((p) => p.isSelected)).toList()[index].img}.svg',
                                            color: colorScheme.tertiary))))))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          Navigator.of(context)
                              .push(PageTransition(
                                  type: PageTransitionType.bottomToTop, child: const PackSelectionScreen()))
                              .then((_) => setState(() {}));
                        },
                        child: Text(
                          'Still want to change your packs?',
                          style: TextStyle(color: colorScheme.tertiary, decoration: TextDecoration.underline),
                        ))
                  ],
                ),
                Expanded(child: Container()),
                PrimaryButton(
                    text: 'LET\'S GO',
                    function: () {
                      HapticFeedback.mediumImpact();
                      Navigator.of(context).push(
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: PlayerInputScreen(numberOfPlayers: numberOfPlayers, numberOfRounds: numberOfRounds)),
                      );
                    }),
                const SizedBox(height: 32)
              ],
            ),
          ))
        ])),
      ),
    );
  }
}
