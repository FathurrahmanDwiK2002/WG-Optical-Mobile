// ignore_for_file: unnecessary_import, implementation_imports, duplicate_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:wg_optical/home/widget/searchBar.dart';

class riwayat extends StatefulWidget {
  const riwayat({super.key});

  @override
  State<riwayat> createState() => _riwayatState();
}

class _riwayatState extends State<riwayat> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
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
            height: 20.0,
          ),
          Container(
            width: 347,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Pesanan Selesai :",
                      style: TextStyle(
                        color: Colors.black,
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
                        color: Colors.black,
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
        ],
      ),
    );
  }
}
