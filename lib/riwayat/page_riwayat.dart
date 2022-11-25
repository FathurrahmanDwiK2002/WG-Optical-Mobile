// ignore_for_file: unnecessary_import, implementation_imports, duplicate_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:wg_optical/home/widget/searchBar.dart';
import 'package:wg_optical/models/warna.dart';
import 'package:wg_optical/pesanan_saya/screen/detailPesanan.dart';

import '../models/kacaMata_item.dart';

class riwayat extends StatefulWidget {
  const riwayat({super.key});

  @override
  State<riwayat> createState() => _riwayatState();
}

class _riwayatState extends State<riwayat> {
  final List<KacaMataItem> listKacaMata = [
    KacaMataItem(
        Waktu: 'Rp.232.000', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rp.560.000', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rp.540.000', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rp.220.000', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rp.200.000', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rp.560.000', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rp.700.000', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rp.560.000', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rp.100.000', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rp.500.000', title: '#TR7265486', subtitle: 'Nama Pelanggan'),
    KacaMataItem(
        Waktu: 'Rp.560.000', title: '#TR7265486', subtitle: 'Nama Pelanggan')
  ];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appbar = AppBar(
      backgroundColor: color1,
      elevation: 0,
      toolbarHeight: 0,
    );

    final heightPhone = screenHeight -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: color1,
      appBar: appbar,
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: heightPhone * 0.06,
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
                              color: Colors.white,
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
            height: heightPhone * 0.03,
          ),
          Container(
            width: screenWidth * 0.88,
            height: heightPhone * 0.047,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: color3,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Pesanan Selesai :",
                      style: TextStyle(
                        color: color2,
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "230",
                      style: TextStyle(
                        color: color2,
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: heightPhone * 0.028,
          ),
          Container(
            width: screenWidth,
            height: 1,
            color: Colors.white38,
          ),
          SizedBox(
            height: heightPhone * 0.02,
          ),
          Container(
              // color: Colors.blue,
              height: heightPhone * 0.6,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  Container(
                    // color: Colors.amber,
                    width: screenWidth,
                    height: heightPhone * 0.53,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        ...listKacaMata.map((e) {
                          return _listkacamata(e);
                        }).toList()
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _listkacamata(KacaMataItem cItem) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appbar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 0,
    );

    final heightPhone = screenHeight -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => detailPesanan(anu: cItem)));
          // print(cItem.title.toString());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          height: heightPhone * 0.066,
          width: 120.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            cItem.subtitle!,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            cItem.title!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      cItem.Waktu!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightPhone * 0.0073,
                ),
                SizedBox(
                  width: screenWidth * 0.9,
                  height: 1,
                  child: Material(
                    color: Color.fromARGB(255, 220, 220, 220),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
