// ignore_for_file: implementation_imports, unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:wg_optical/home/screens/pageCart.dart';
import 'package:wg_optical/home/screens/pageFrame.dart';
import 'package:wg_optical/home/screens/pageLensa.dart';
import 'package:wg_optical/home/screens/pageNotifications.dart';
import 'package:wg_optical/home/screens/pageSet.dart';
import 'package:wg_optical/home/slideFrame/infoSales.dart';
import 'package:wg_optical/home/widget/searchBar.dart';
import 'package:wg_optical/home/screens/detailFrame.dart';
import 'package:wg_optical/pesanan_saya/screen/detailPesanan.dart';

import '../../models/kacaMata_item.dart';

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
    pageSet(),
  ];
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
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: AppBar(
          backgroundColor: Color(0xfff0f0f0),
          elevation: 0,
          toolbarHeight: 70,
          leading: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pageNotification(),
                        ));
                  },
                  icon: Icon(
                    Icons.alarm_add_outlined,
                    color: Colors.black,
                    size: 30,
                  ))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              // detailPesanan()
                              pageCart(),
                        ));
                  },
                  icon: Icon(
                    Icons.card_travel_outlined,
                    color: Colors.black,
                    size: 30,
                  )),
            )
          ]),
      body: Column(
        children: [
          //bagian search
          SizedBox(
            height: 2,
          ),
          //bagian grade
          infoSales(),
          SizedBox(
            height: 20,
          ),
          //bagian text pilih frame
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transaksi",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Pilih transaksi",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: (screenWidth / 2) + 149,
            height: (screenHeight / 2) - 371,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    "Set",
                    style: TextStyle(
                      color: Color(0xff343948),
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pageSet(),
                        ));
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: (screenWidth / 2) + 149,
            height: (screenHeight / 2) - 371,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pageFrame(),
                        ));
                  },
                  child: Text(
                    "Frame",
                    style: TextStyle(
                      color: Color(0xff343948),
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: (screenWidth / 2) + 149,
            height: (screenHeight / 2) - 371,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pageLensa(),
                        ));
                  },
                  child: Text(
                    "Lensa",
                    style: TextStyle(
                      color: Color(0xff343948),
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: (screenHeight / 2) - 268,
            width: (screenWidth / 2) + 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Copyright @2022 Walyo Group IT Team. ALL Right Reserved",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x7f000000),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          )
          // Container(
          //   child: _widgetOptions.elementAt(counter),
          // )
        ],
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
