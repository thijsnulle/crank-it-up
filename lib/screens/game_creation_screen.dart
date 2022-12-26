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
  Map<String, int> variables = {
    'numberOfPlayers': 4,
    'numberOfRounds': 5,
  };

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
                createNumberPicker('Number of Players:', 2, 8, 'numberOfPlayers'),
                createNumberPicker('Number of Rounds:', 3, 10, 'numberOfRounds'),
                const SizedBox(height: 16.0),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Selected packs: ', style: TextStyle(color: colorScheme.tertiary))),
                createPackList(),
                const SizedBox(height: 16.0),
                createPackSelectionButton(),
                Expanded(child: Container()),
                PrimaryButton(
                    text: 'LET\'S GO',
                    function: () {
                      HapticFeedback.mediumImpact();
                      Navigator.of(context).push(
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: PlayerInputScreen(
                                numberOfPlayers: variables['numberOfPlayers']!,
                                numberOfRounds: variables['numberOfRounds']!)),
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

  Widget createNumberPicker(String description, final int minValue, final int maxValue, String key) {
    void updateValue(String key, int minValue, int maxValue, int value) {
      setState(() {
        HapticFeedback.mediumImpact();
        variables[key] = value.clamp(minValue, maxValue);
      });
    }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(description, style: Theme.of(context).textTheme.button),
      Row(children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () => updateValue(key, minValue, maxValue, variables[key]! - 1),
          color: colorScheme.onBackground,
        ),
        NumberPicker(
          value: variables[key]!,
          minValue: minValue,
          maxValue: maxValue,
          itemWidth: 30,
          itemHeight: 30,
          onChanged: (value) => updateValue(key, minValue, maxValue, value),
          selectedTextStyle: TextStyle(color: colorScheme.onBackground, fontSize: 24),
          textStyle: TextStyle(color: colorScheme.secondary, fontSize: 16),
          haptics: true,
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => updateValue(key, minValue, maxValue, variables[key]! + 1),
          color: colorScheme.onBackground,
        ),
      ])
    ]);
  }

  Widget createPackList() => Row(
      children: packs
          .where((p) => p.isSelected)
          .map((p) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: Svg('assets/images/${p.img}', color: colorScheme.tertiary))))))
          .toList());

  Widget createPackSelectionButton() => Row(children: [
        GestureDetector(
            onTap: () {
              HapticFeedback.mediumImpact();
              Navigator.of(context)
                  .push(PageTransition(type: PageTransitionType.bottomToTop, child: const PackSelectionScreen()))
                  .then((_) => setState(() {}));
            },
            child: Text('Still want to change your packs?',
                style: TextStyle(color: colorScheme.tertiary, decoration: TextDecoration.underline)))
      ]);
}
