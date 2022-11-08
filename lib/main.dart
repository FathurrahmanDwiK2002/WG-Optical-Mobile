import 'package:flutter/material.dart';
import 'package:wg_optical/home/widget/navbar.dart';
import 'package:wg_optical/home/screens/detailFrame.dart';
import 'models/kacaMata_item.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WG Optical',
      home: pageHome()));
}

class pageHome extends StatefulWidget {
  const pageHome({super.key});

  @override
  State<pageHome> createState() => _pageHomeState();
}

class _pageHomeState extends State<pageHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: navbar(),
        backgroundColor: Colors.black,
      ),
    );
  }
}
