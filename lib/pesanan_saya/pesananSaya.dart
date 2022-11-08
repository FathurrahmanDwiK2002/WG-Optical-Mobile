// ignore_for_file: unnecessary_import, implementation_imports, duplicate_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class pesananSaya extends StatefulWidget {
  const pesananSaya({super.key});

  @override
  State<pesananSaya> createState() => _pesananSayaState();
}

class _pesananSayaState extends State<pesananSaya> {
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
                  height: 110,
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
                            "Pesanan Saya",
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
          Container(
            width: screenWidth - 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSizeButton('DiProduksi', 0),
                _buildSizeButton('Dikirim', 1),
                _buildSizeButton('Selesai', 2)
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 1,
            color: Colors.white38,
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: 362,
            height: 49,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff535357),
            ),
            child: Row(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  width: 65,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 21),
                    child: Text(
                      "No Faktur",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  width: 150,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Nama Pelanggan ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  width: 145,
                )
              ],
            ),
          )
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
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        ),
      ),
    );
  }
}
