import 'package:flutter/material.dart';
import 'app_object.dart' as app_object;

import 'package:crank_it_up/screens/home_screen.dart';
import 'package:crank_it_up/color_scheme.dart';

void main() {
  runApp(const CrankItUp());
}

class CrankItUp extends StatelessWidget {
  const CrankItUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const HomeScreen(),
        theme: ThemeData(
            scaffoldBackgroundColor: colorScheme.background,
            fontFamily: 'Montserrat',
            textTheme: TextTheme(
              headline1: TextStyle(fontWeight: FontWeight.w700, fontSize: 48.0, color: colorScheme.primary),
              headline2: TextStyle(fontWeight: FontWeight.w300, fontSize: 48.0, color: colorScheme.secondary),
              button: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 14.0, color: colorScheme.secondary, letterSpacing: 2),
            ),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(colorScheme.primary),
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(18.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.0))))),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(18.0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48.0),
                      side: BorderSide(color: colorScheme.primary, width: 2)))),
            )));
  }
}
