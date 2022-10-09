import 'package:crank_it_up/components/alert.dart';
import 'package:crank_it_up/components/app_header.dart';
import 'package:crank_it_up/components/pack.dart';
import 'package:flutter/material.dart';

import 'package:crank_it_up/app.dart';

import 'package:crank_it_up/components/gradient_background.dart';

class PackSelectionScreen extends StatefulWidget {
  const PackSelectionScreen({super.key});

  @override
  PackSelectionScreenState createState() => PackSelectionScreenState();
}

class PackSelectionScreenState extends State<PackSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHeader.create('PACK', 'SELECTION', () => assertPackSelection(context), Icons.west_rounded, CrossAxisAlignment.start, context),
        extendBodyBehindAppBar: true,
        body: GradientBackground(
          child: Column(children: [
            const SizedBox(
              height: 200,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: TextButton(
                          onPressed: () => {
                            for (int i = 0; i < packs.length; i++) {packs[i].isSelected = true},
                            setState(() {})
                          },
                          style: Theme.of(context).textButtonTheme.style,
                          child: Text('SELECT ALL', style: Theme.of(context).textTheme.button),
                        ))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: TextButton(
                          onPressed: () => {
                            for (int i = 0; i < packs.length; i++) {packs[i].isSelected = false},
                            setState(() {})
                          },
                          style: Theme.of(context).textButtonTheme.style,
                          child: Text('DESELECT ALL', style: Theme.of(context).textTheme.button),
                        ))),
              ],
            ),
            Expanded(
                child: GridView(
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20, childAspectRatio: 2 / 3),
              children: packs.map((element) => PackCard(id: element.id, name: element.name, img: element.img)).toList(),
            ))
          ]),
        ));
  }

  void assertPackSelection(BuildContext context) {
    if (packs.any((pack) => pack.isSelected)) {
      Navigator.of(context).pop();
    } else {
      alert('Please select at least one pack!', context);
    }
  }
}
