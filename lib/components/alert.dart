import 'package:crank_it_up/color_scheme.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

bool alert(String text, BuildContext context) {
  showFlash(
    duration: const Duration(seconds: 5),
    context: context,
    builder: (_, controller) => Flash(
      controller: controller,
      position: FlashPosition.top,
      behavior: FlashBehavior.floating,
      child: FlashBar(
        content: Text(text),
        indicatorColor: colorScheme.primary,
      ),
    ),
  );
  return false;
}
