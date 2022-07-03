import 'package:crank_it_up/color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:crank_it_up/components/buttons.dart';

import 'package:crank_it_up/screens/home_screen.dart';
import 'package:crank_it_up/screens/transitions.dart';

import '../app.dart';
import '../components/pack.dart';

class PackSelectionScreen extends StatelessWidget {
  PackSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: colorScheme.secondary),
          onPressed: () => Navigator.of(context).push(to(const HomeScreen())),
        ),
        title: Text('Select your packs', style: Theme.of(context).textTheme.button),
        backgroundColor: Colors.transparent,
      ),
      body: GridView(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20, childAspectRatio: 2 / 3),
        children: packs,
      ),
    );
  }
}
