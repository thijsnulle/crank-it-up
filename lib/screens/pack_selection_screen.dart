import 'package:crank_it_up/components/app_header.dart';
import 'package:flutter/material.dart';

import 'package:crank_it_up/app.dart';

class PackSelectionScreen extends StatelessWidget {
  const PackSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHeader.create('PACK', 'SELECTION', null, Icons.west_rounded, context),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
            Color.fromARGB(255, 30, 21, 65),
            Color.fromARGB(255, 44, 31, 95),
            Color(0xFF473198),
            Color.fromARGB(255, 98, 67, 207)
          ])),
          child: GridView(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20, childAspectRatio: 2 / 3),
            children: packs,
          ),
        ));
  }
}
