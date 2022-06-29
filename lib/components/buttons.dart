import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function() function;

  const PrimaryButton({required this.text, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      style: Theme.of(context).textButtonTheme.style,
      child: Text(text, style: Theme.of(context).textTheme.button),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function() function;

  const SecondaryButton({required this.text, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Text(text, style: Theme.of(context).textTheme.button),
    );
  }
}

class ClickableIcon extends StatelessWidget {
  final IconData iconData;
  final Function() function;

  const ClickableIcon({required this.iconData, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: function,
      icon: Icon(iconData),
      iconSize: 36,
      color: Colors.white,
    );
  }
}
