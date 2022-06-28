import 'package:flutter/material.dart';

const Color highlightColour = Color(0xFF247BA0);

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function() function;

  final TextStyle textStyle = const TextStyle(
      fontFamily: 'Montserrat', fontWeight: FontWeight.w500, letterSpacing: 2);
  final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(highlightColour),
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
      fontFamily: 'Montserrat', fontWeight: FontWeight.w300, letterSpacing: 2);
  final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      padding:
          MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(18.0)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.0),
              side: const BorderSide(color: highlightColour, width: 2))));

  SecondaryButton({required this.text, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        style: buttonStyle,
        child: RichText(text: TextSpan(text: text, style: textStyle)));
  }
}

class ClickableIcon extends StatelessWidget {
  final IconData iconData;
  final Function() function;

  const ClickableIcon(
      {required this.iconData, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: function,
      icon: Icon(iconData),
      iconSize: 36,
      color: Colors.white,
      splashColor: highlightColour,
    );
  }
}
