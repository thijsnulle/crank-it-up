import 'package:flutter/material.dart';
import 'package:crank_it_up/components/buttons.dart';
import 'package:crank_it_up/components/title.dart' as components;
import 'home_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                backgroundColor: Colors.red,
                body: Column(
                  children: [
                    const components.Title(),
                    PrimaryButton(text: 'PLAY', function: () => {}),
                    const SizedBox(height: 16),
                    SecondaryButton(text: 'CHOOSE', function: () => {}),
                    Expanded(child: Container()),
                    ClickableIcon(
                        iconData: Icons.settings,
                        function: () =>
                            Navigator.of(context).push(to(const HomeScreen()))),
                    const SizedBox(height: 64),
                  ],
                ))));
  }
}

Route to(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
