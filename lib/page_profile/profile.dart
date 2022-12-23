// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:wg_optical/env/env.dart';
import 'package:wg_optical/login.dart';
import 'package:wg_optical/models/warna.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final _loadHiveProfile = Hive.box('Profile');
  int selectedIndex = 0;
  List<Map<String, dynamic>> _dataProfile = [];

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  void _refreshItems() {
    final data = _loadHiveProfile.keys.map((key) {
      final value = _loadHiveProfile.get(key);
      return {
        "key": key,
        "id_pegawai": value["id_pegawai"],
        "nama": value["nama"],
        "alamat": value["alamat"],
        "notelepon": value["notelepon"],
        "urlFoto": value["urlFoto"],
      };
    }).toList();

    setState(() {
      _dataProfile = data.reversed.toList();
    });
  }

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
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 159,
                        height: 163,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(47),
                          image: DecorationImage(
                            image: NetworkImage(
                                '${Env.URL_PREFIX}images/pegawai/foto_pegawai/${_dataProfile[0]['urlFoto']}'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              blurRadius: 4,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightPhone * 0.024,
            ),
            Text(
              _dataProfile[0]['nama'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: "Montserrat-Bold",
              ),
            ),
            SizedBox(
              height: heightPhone * 0.024,
            ),
            Container(
              height: heightPhone * 0.36,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 330,
                    height: heightPhone * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            width: 47,
                            height: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(0x66343948),
                                width: 1,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenHeight * 0.024,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ID Karyawan",
                              style: TextStyle(
                                color: Color(0xff343948),
                                fontSize: 17,
                                fontFamily: "Montserrat-Bold",
                              ),
                            ),
                            Text(
                              _dataProfile[0]['id_pegawai'],
                              style: TextStyle(
                                color: Color(0xff343948),
                                fontSize: 10,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.006,
                  ),
                  Container(
                    width: 330,
                    height: heightPhone * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            width: 47,
                            height: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(0x66343948),
                                width: 1,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenHeight * 0.024,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Alamat",
                              style: TextStyle(
                                color: Color(0xff343948),
                                fontSize: 17,
                                fontFamily: "Montserrat-Bold",
                              ),
                            ),
                            Container(
                              width: heightPhone * 0.28,
                              child: Text(
                                _dataProfile[0]['alamat'],
                                maxLines: 3,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  color: Color(0xff343948),
                                  fontSize: 10,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.006,
                  ),
                  Container(
                    width: 330,
                    height: heightPhone * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            width: 47,
                            height: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color(0x66343948),
                                width: 1,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenHeight * 0.024,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Telepon",
                              style: TextStyle(
                                color: Color(0xff343948),
                                fontSize: 17,
                                fontFamily: "Montserrat-Bold",
                              ),
                            ),
                            Text(
                              _dataProfile[0]['notelepon'],
                              style: TextStyle(
                                color: Color(0xff343948),
                                fontSize: 10,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                _loadHiveProfile.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: ((context) => loginPage()),
                    ),
                    (route) => false);
              },
              child: Container(
                width: screenWidth * 0.74,
                height: heightPhone * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  color: color1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "keluar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Montserrat-SemiBold",
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
