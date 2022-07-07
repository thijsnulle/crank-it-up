import 'package:crank_it_up/components/app_header.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppHeader.create('SETTINGS', 'SCREEN', null, Icons.west_rounded, context),
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
              Color.fromARGB(255, 30, 21, 65),
              Color.fromARGB(255, 44, 31, 95),
              Color(0xFF473198),
              Color.fromARGB(255, 98, 67, 207)
            ])),
            child: Container()),
      ),
    );
  }
}
