import 'package:flutter/material.dart';

import 'package:crank_it_up/components/buttons.dart';

import 'package:crank_it_up/screens/home_screen.dart';
import 'package:crank_it_up/screens/transitions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.west_rounded)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SETTINGS', style: Theme.of(context).textTheme.headline1),
              Text('SCREEN', style: Theme.of(context).textTheme.headline2)
            ],
          ),
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Container(),
      ),
    );
  }
}
