import 'package:flutter/material.dart';

const Color highlightColour = Color(0xFF247BA0);

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
        color: highlightColour);

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
