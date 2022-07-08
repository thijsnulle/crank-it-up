import 'dart:convert';
import 'dart:io';

import 'package:crank_it_up/components/app_header.dart';
import 'package:crank_it_up/components/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  final SettingsStorage storage = SettingsStorage();

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  Map<String, dynamic> settings = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    widget.storage.read().then((newSettings) {
      setState(() {
        settings = newSettings;
      });
    });
  }

  Future<File> saveSettings() {
    return widget.storage.write(settings);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppHeader.create('SETTINGS', 'SCREEN', () => {saveSettings(), Navigator.of(context).pop()},
            Icons.west_rounded, CrossAxisAlignment.start, context),
        body: GradientBackground(child: Container()),
      ),
    );
  }
}

class SettingsStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/settings.json');
  }

  Future<Map<String, dynamic>> read() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      return jsonDecode(contents);
    } catch (e) {
      return <String, dynamic>{};
    }
  }

  Future<File> write(Map<String, dynamic> settings) async {
    final file = await _localFile;
    return file.writeAsString(jsonEncode(settings));
  }
}
