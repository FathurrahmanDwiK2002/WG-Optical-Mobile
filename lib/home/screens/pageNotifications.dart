// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wg_optical/home/component/dasboard.dart';
import 'package:wg_optical/home/widget/navbar.dart';

import '../../models/kacaMata_item.dart';

class pageNotification extends StatefulWidget {
  const pageNotification({super.key});

  @override
  State<pageNotification> createState() => _pageNotificationState();
}

class _pageNotificationState extends State<pageNotification>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  List<Map<String, dynamic>> _Data = [];
  var _account = Hive.box('Data');
  bool isChecked = false;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    _refreshItems();
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  void _refreshItems() {
    final data = _account.keys.map((key) {
      final value = _account.get(key);
      return {"key": key, "name": value["name"], "kode": value['kode']};
    }).toList();

    setState(() {
      _Data = data.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  Future<void> _deleteItem(int itemKey) async {
    await _account.delete(itemKey);
    _refreshItems();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        'Permintaan Anda Di Terima',
        style: TextStyle(color: Color(0xff5e5e5e)),
      ),
      backgroundColor: Colors.white,
    ));
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
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color(0xff5e5e5e);
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            toolbarHeight: 70,
            centerTitle: true,
            backgroundColor: Color(0xff5e5e5e),
            leading: Padding(
              padding: const EdgeInsets.only(top: 19, left: 23, bottom: 19),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffc9cbca),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 8,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => navbar(),
                          ));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.transparent,
                    )),
              ),
            ),
            title: Text(
              "Aktivitas",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
              ),
            )),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Color(0xff5e5e5e),
          child: Column(
            children: [
              Container(
                width: 322,
                height: 80,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            width: 298,
                            height: 51,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                // color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Icon(
                                    Icons.search_rounded,
                                    size: 30,
                                    color: Color(0xff5e5e5e),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                // color: Colors.green,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 30),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration.collapsed(
                                        hintText: 'Search..',
                                        hintStyle: TextStyle(
                                          color: Color(0xff5e5e5e),
                                          fontSize: 14,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Perijinan Barang ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: screenHeight / 2 - 170,
                width: screenWidth,
                child: Scaffold(
                  backgroundColor: Color(0xff5e5e5e),
                  body: _Data.isEmpty
                      ? Center(
                          child: Container(
                            width: 369,
                            height: screenHeight / 2 - 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 10,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              color: Color(0xffc9cbca),
                            ),
                          ),
                        )
                      : Center(
                          child: Container(
                            width: 369,
                            height: screenHeight / 2 - 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 10,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              color: Color(0xffc9cbca),
                            ),
                            child: ListView.builder(
                                // the list of items
                                itemCount: _Data.length,
                                itemBuilder: (_, index) {
                                  final currentItem = _Data[index];
                                  return Container(
                                    color: Colors.transparent,
                                    height: 70,
                                    width: screenWidth,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, top: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.account_circle_rounded,
                                            size: 55,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 102,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    currentItem['name']
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Color(0xff3a3a3a),
                                                      fontSize: 15,
                                                      fontFamily: "Montserrat",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Request Kode : ',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff3a3a3a),
                                                          fontSize: 10,
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        currentItem['kode'],
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff3a3a3a),
                                                          fontSize: 10,
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  150),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                  onPressed: () => _deleteItem(
                                                      currentItem['key']),
                                                  icon: Icon(
                                                    Icons.check_box,
                                                    color: Color(0xff82dcc6),
                                                    size: 30,
                                                  )),
                                              IconButton(
                                                  onPressed: _decrement,
                                                  icon: Icon(
                                                    Icons
                                                        .disabled_by_default_rounded,
                                                    color: Color(0xfff35e58),
                                                    size: 30,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Permintaan Barang ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: screenHeight / 2 - 170,
                width: screenWidth,
                child: Scaffold(
                  backgroundColor: Color(0xff5e5e5e),
                  body: _Data.isEmpty
                      ? Center(
                          child: Container(
                            width: 369,
                            height: screenHeight / 2 - 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 10,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              color: Color(0xffc9cbca),
                            ),
                          ),
                        )
                      : Center(
                          child: Container(
                            width: 369,
                            height: screenHeight / 2 - 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  blurRadius: 10,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              color: Color(0xffc9cbca),
                            ),
                            child: ListView.builder(
                                // the list of items
                                itemCount: _Data.length,
                                itemBuilder: (_, index) {
                                  final currentItem = _Data[index];
                                  return Container(
                                    color: Colors.transparent,
                                    height: 70,
                                    width: screenWidth,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, top: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.account_circle_rounded,
                                            size: 55,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 102,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    currentItem['name']
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Color(0xff3a3a3a),
                                                      fontSize: 15,
                                                      fontFamily: "Montserrat",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Request Kode : ',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff3a3a3a),
                                                          fontSize: 10,
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        currentItem['kode'],
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff3a3a3a),
                                                          fontSize: 10,
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  140),
                                          Container(
                                            width: 70.73,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color(0xff0065ff),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Setuju",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ));
  }
}
