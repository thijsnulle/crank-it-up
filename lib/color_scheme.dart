import 'package:flutter/material.dart';

final ColorScheme colorScheme = ColorScheme.fromSwatch().copyWith(
  background: const Color(0xFF473198),
  onBackground: const Color(0xFFEFEFEF),
  primaryContainer: const Color.fromARGB(255, 121, 164, 255),
  onPrimary: Colors.white, //const Color(0xFF211D28),
  secondaryContainer: const Color.fromARGB(255, 121, 164, 255),
  onSecondary: const Color(0xFFEFEFEF),
  primary: const Color(0xFFEFEFEF),
  secondary: Colors.grey,
  tertiary: Colors.grey.shade500,
  surface: const Color.fromARGB(255, 30, 21, 65),
  surfaceTint: const Color(0xFF473198),
  surfaceVariant: const Color.fromARGB(255, 98, 67, 207),
);
