// ignore_for_file: unnecessary_import, implementation_imports, duplicate_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:wg_optical/home/widget/searchBar.dart';

import '../models/kacaMata_item.dart';

class riwayat extends StatefulWidget {
  const riwayat({super.key});

  @override
  State<riwayat> createState() => _riwayatState();
}

class _riwayatState extends State<riwayat> {
  final List<KacaMataItem> listKacaMata = [
    KacaMataItem(
        Waktu: 'Riski Doer', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rizal Sakne', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Riski Doer', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rizal Sakne', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Riski Doer', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rizal Sakne', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Riski Doer', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rizal Sakne', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rizal Sakne', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Riski Doer', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rizal Sakne', title: '#TR7265486', subtitle: 'Nama Pelanggan')
  ];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: 50,
                  width: screenWidth,
                  // color: Colors.amber,
                ),
                Positioned(
                    top: 10.0,
                    left: 10.0,
                    child: Container(
                      color: Colors.transparent,
                      // height: 50.0,
                      width: screenWidth - 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 35.0,
                              width: 35.0,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.transparent, width: 1.0),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.transparent,
                                size: 20.0,
                              ),
                            ),
                          ),
                          Text(
                            "Riwayat",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 35.0,
                              width: 35.0,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.transparent, width: 1.0),
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Icon(
                                Icons.favorite_rounded,
                                color: Colors.transparent,
                                size: 17.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          searchBar(),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 347,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Color(0xff343948),
            ),
            child: Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Pesanan Selesai :",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  width: 250,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "230",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  width: 97,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: screenWidth,
            height: 1,
            color: Colors.white38,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 350,
            height: (screenHeight / 2) - (-45),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                        ),
                        child: Text(
                          'Nama Customer & No Faktur ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      width: 150,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          "Waktu",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      width: 150,
                    ),
                  ],
                ),
                Container(
                    // color: Colors.blue,
                    height: (MediaQuery.of(context).size.height / 2) - 30,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      padding: EdgeInsets.only(
                        top: 25.0,
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 40),
                          child: Container(
                            // color: Colors.amber,
                            width: MediaQuery.of(context).size.width - 10.0,
                            height:
                                (MediaQuery.of(context).size.height / 2) - 103,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                ...listKacaMata.map((e) {
                                  return _listkacamata(e);
                                }).toList()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listkacamata(KacaMataItem cItem) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          height: (screenHeight / 2) - 380,
          width: 120.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        cItem.subtitle!,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        cItem.title!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 80.0),
                child: Text(
                  cItem.Waktu!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
