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
import 'package:wg_optical/home/screens/pembayaran.dart';
import 'package:wg_optical/home/slideFrame/infoSales.dart';
import 'package:wg_optical/home/widget/searchBar.dart';
import 'package:wg_optical/home/screens/detailFrame.dart';
import 'package:wg_optical/models/warna.dart';
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
    final appbar = AppBar(
        backgroundColor: color1,
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
                  color: color3,
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
                  color: color3,
                  size: 30,
                )),
          )
        ]);

    final heightPhone = screenHeight -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: color1,
      appBar: appbar,
      body: Column(
        children: [
          SizedBox(
            height: heightPhone * 0.01,
          ),
          //bagian grade
          infoSales(),
          SizedBox(
            height: heightPhone * 0.02,
          ),
          //bagian heading
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transaksi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Pilih transaksi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: heightPhone * 0.02,
          ),
          Container(
            width: screenWidth * 0.86,
            height: heightPhone * 0.0698,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              color: color3,
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
            height: heightPhone * 0.02,
          ),
          Container(
            width: screenWidth * 0.86,
            height: heightPhone * 0.0698,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              color: color3,
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
            height: heightPhone * 0.02,
          ),
          Container(
            width: screenWidth * 0.86,
            height: heightPhone * 0.0698,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              color: color3,
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
            height: heightPhone * 0.2,
            width: (screenWidth / 2) + 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Copyright @2022 Walyo Group IT Team. ALL Right Reserved",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: color3,
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
}
