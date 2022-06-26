import 'package:flutter/material.dart';

void main() {
  runApp(const CrankItUp());
}

class CrankItUp extends StatelessWidget {
  const CrankItUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Column(
          children: [
            const Title(),
            PrimaryButton(text: 'PLAY GAME', function: () => {}),
            const SizedBox(height: 16),
            SecondaryButton(text: 'CHOOSE PACK', function: () => {})
          ],
        ));
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    const String font = 'Montserrat';
    const double fontSize = 48.0;

    const TextStyle boldStyle = TextStyle(
        fontWeight: FontWeight.w700, fontFamily: font, fontSize: fontSize);
    const TextStyle lightStyle = TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: font,
        fontSize: fontSize,
        color: Colors.teal);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(text: const TextSpan(text: 'CRANK', style: boldStyle)),
            Wrap(children: [
              RichText(text: const TextSpan(text: 'IT', style: lightStyle)),
              RichText(text: const TextSpan(text: 'UP', style: boldStyle))
            ])
          ],
        ));
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function() function;

  final TextStyle textStyle = const TextStyle(
      fontFamily: 'Montserrat', fontWeight: FontWeight.w500, letterSpacing: 2);
  final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
      padding:
          MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(18.0)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48.0),
      )));

  PrimaryButton({required this.text, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        style: buttonStyle,
        child: RichText(text: TextSpan(text: text, style: textStyle)));
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function() function;

  final TextStyle textStyle = const TextStyle(
      fontFamily: 'Montserrat', fontWeight: FontWeight.w500, letterSpacing: 2);
  final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      padding:
          MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(18.0)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.0),
              side: const BorderSide(color: Colors.teal, width: 2))));

  SecondaryButton({required this.text, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        style: buttonStyle,
        child: RichText(text: TextSpan(text: text, style: textStyle)));
  }
}
