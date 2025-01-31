import 'package:crank_it_up/components/app_header.dart';
import 'package:flutter/material.dart';

import 'package:crank_it_up/components/gradient_background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppHeader.create('SETTINGS', 'SCREEN', null, Icons.west_rounded, CrossAxisAlignment.start, context),
        extendBodyBehindAppBar: true,
        body: GradientBackground(
            child: Column(children: [
          const SizedBox(
            height: 200,
          ),
          Container()
        ])),
      ),
    );
  }
}
