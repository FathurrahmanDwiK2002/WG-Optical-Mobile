// ignore_for_file: implementation_imports, unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:wg_optical/home/slideFrame/frameA.dart';
import 'package:wg_optical/home/slideFrame/frameB.dart';
import 'package:wg_optical/home/widget/searchBar.dart';
import 'package:wg_optical/home/screens/detailFrame.dart';

import '../../models/kacaMata_item.dart';
import '../slideFrame/framePremium.dart';

class dasboard extends StatefulWidget {
  const dasboard({super.key});

  @override
  State<dasboard> createState() => _dasboardState();
}

class _dasboardState extends State<dasboard> with TickerProviderStateMixin {
  int counter = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    frameA(),
    frameB(),
    framePremium()
  ];
  var anu = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //bagian search
              searchBar(),
              SizedBox(
                height: 20,
              ),
              //bagian grade
              Container(
                width: screenWidth - 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSizeButton('Grade A', 0),
                    _buildSizeButton('Grade B', 1),
                    _buildSizeButton('Premium', 2)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //bagian text pilih frame
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 19, right: 220),
                  child: Text(
                    "Pilih Frame yang tersedia",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: _widgetOptions.elementAt(counter),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeButton(String title, int index) {
    return AnimatedContainer(
      duration: Duration(seconds: 4),
      curve: Curves.easeIn,
      child: GestureDetector(
        onTap: () {
          setState(() {
            counter = index;
          });
          print(index);
        },
        child: Container(
          height: 40.0,
          width: 100.0,
          decoration: BoxDecoration(
              color: index == counter ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: index == counter
                  ? Border.all(
                      color: Colors.white, style: BorderStyle.solid, width: 1.0)
                  : Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 0.2)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: index == counter ? Colors.white : Colors.black,
                  fontSize: 15.0),
            ),
          ),
        ),
      ),
    );
  }
}
