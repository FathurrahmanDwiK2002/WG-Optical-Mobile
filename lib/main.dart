// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wg_optical/home/widget/navbar.dart';
import 'package:wg_optical/login.dart';
import 'package:wg_optical/splash.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('Profile');
  await Hive.openBox('Data');
  runApp(
    myApp()
  );
}

class myApp extends StatelessWidget {
  final _loadHiveProfile = Hive.box('Profile');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WG Optical',
      home: _loadHiveProfile.get(0) != null ? navbar() : splashPage(),
    );
  }
}
