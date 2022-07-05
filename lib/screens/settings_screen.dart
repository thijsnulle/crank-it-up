import 'package:crank_it_up/components/app_header.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppHeader.create('SETTINGS', 'SCREEN', null, Icons.west_rounded, context),
        body: Container(),
      ),
    );
  }
}
