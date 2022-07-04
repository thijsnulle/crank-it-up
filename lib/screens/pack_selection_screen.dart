import 'package:flutter/material.dart';

import 'package:crank_it_up/app.dart';

class PackSelectionScreen extends StatelessWidget {
  const PackSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('PACK', style: Theme.of(context).textTheme.headline1),
            Text('SELECTION', style: Theme.of(context).textTheme.headline2)
          ],
        ),
        toolbarHeight: 200,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
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
