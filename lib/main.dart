import 'package:crank_it_up/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CrankItUp());
}

class CrankItUp extends StatelessWidget {
  const CrankItUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
