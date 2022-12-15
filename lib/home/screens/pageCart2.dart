// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, camel_case_types, non_constant_identifier_names, prefer_final_fields, prefer_typing_uninitialized_variables, unused_element, file_names, use_build_context_synchronously, sized_box_for_whitespace, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_field, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wg_optical/home/screens/pembayaran.dart';
import 'package:wg_optical/models/warna.dart';
import 'package:http/http.dart' as http;
import 'package:wg_optical/env/env.dart';


class pageCart2 extends StatefulWidget {
  const pageCart2({super.key});

  @override
  State<pageCart2> createState() => _pageCart2State();
}

class _pageCart2State extends State<pageCart2>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> _Data = [];
  var _account = Hive.box('Data');
  bool isChecked = false;
  int aaa = 0;
  late TabController tabController;
  int _counter = 0;
  var currentItem;

  _deleteInfo() {
    _account.deleteAt(0);
  }

  void _increment() {
    setState(() {
      currentItem["qty"]++;
    });
  }

  void _decrement() {
    setState(() {
      currentItem["qty"]--;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    _refreshItems();
  }

  void _refreshItems() {
    final data = _account.keys.map((key) {
      final value = _account.get(key);
      return {
        "key": key,
        "value": false,
        "nama_barang": value["nama_barang"],
        "kode_barang": value['kode_barang'],
        "qty": value['qty']
      };
    }).toList();

    setState(() {
      _Data = data.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  Future<List> _getdata() async {
    final response =
        await http.get(Uri.parse("${Env.URL_PREFIX}/get_data.php"));
    return json.decode(response.body);
  }

  Future<void> _deleteItem(int itemKey) async {
    await _account.delete(itemKey);
    _refreshItems();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          leading: Stack(
            children: [
              Padding(
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 18, bottom: 19),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // _deleteInfo();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: color1,
                    )),
              ),
            ],
          ),
          title: Text(
            "Keranjang",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
            ),
          )),
      body: Container(
        color: Color(0xff5e5e5e),
        child: Column(
          children: [
            Container(
              color: Color(0xff5e5e5e),
              height: MediaQuery.of(context).size.height * 0.007,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pilih Barang ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2 + 150,
              width: MediaQuery.of(context).size.width * 0.97,
              child: ListView.builder(
                  // the list of items
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    // currentItem = _Data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: _Data[index]["value"],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _Data[index]["value"] = value!;
                                        print(_Data[index]["value"]);
                                        if (_Data[index]["value"] == true) {
                                          print("ini true");
                                          aaa = 1;
                                          print(aaa);
                                        } else {
                                          print("ini false");
                                          aaa = 0;
                                        }
                                      });
                                    },
                                  ),
                                  // Checkbox(
                                  //   checkColor: Colors.white,
                                  //   fillColor:
                                  //       MaterialStateProperty.resolveWith(
                                  //           getColor),
                                  //   value: _Data[index]["value"],
                                  //   // int.parse(currentItem["value"]) == 0,
                                  //   onChanged: (bool? value) {
                                  //     setState(() {
                                  //       print(value!);
                                  //     });
                                  //     // setState(() {
                                  //     //   // isChecked = value!;
                                  //     //   // print('object');
                                  //     //   // if (int.parse(currentItem["value"]) ==
                                  //     //   //     0) {
                                  //     //   //   ab = 0;
                                  //     //   //   print(isChecked);
                                  //     //   // }
                                  //     //   // if (int.parse(
                                  //     //   // widget.list[index]["value"]) ==
                                  //     //   // 1) {
                                  //     //   // anu = "0";
                                  //     //   // ab =
                                  //     //   // widget.list[index]["kode_barang"];
                                  //     //   // print(ab);
                                  //     //   // print(anu);
                                  //     //   // } else if (int.parse(
                                  //     //   // widget.list[index]["value"]) ==
                                  //     //   // 0) {
                                  //     //   // anu = "1";
                                  //     //   // ab =
                                  //     //   // widget.list[index]["kode_barang"];
                                  //     //   // print(anu);
                                  //     //   // print(ab);
                                  //     //   // }
                                  //     //   // changedata();
                                  //     //   // if (value == true) {
                                  //     //   // print(currentItem["kode_barang"]);
                                  //     //   // } else if (value != true) {
                                  //     //   // print("false");
                                  //     //   // }
                                  //     // });
                                  //   },
                                  // ),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: Stack(
                                      children: [
                                        Container(
                                          color: Colors.amber,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.32,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'nama barang'
                                                .toString(),
                                            // widget.list[index]["nama_barang"],
                                            style: TextStyle(
                                              color: Color(0xff3a3a3a),
                                              fontSize: 15,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Kode Barang : ',
                                                style: TextStyle(
                                                  color: Color(0xff3a3a3a),
                                                  fontSize: 12,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                'kode barang'
                                                    .toString(),
                                                // widget.list[index]
                                                //     ["kode_barang"],
                                                style: TextStyle(
                                                  color: Color(0xff3a3a3a),
                                                  fontSize: 12,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: _decrement,
                                      // _decrement,
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Color(0xfff35e58),
                                        size: 20,
                                      )),
                                  Text(
                                    '$_counter',
                                  ),
                                  IconButton(
                                      onPressed: _increment,
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Color(0xff82dcc6),
                                        size: 20,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 103,
        color: Color(0xffc9cbca),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                        print(isChecked);
                      });
                    },
                  ),
                  // Container(
                  // width: 22.40,
                  // height: 22.40,
                  // decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(3),
                  // border: Border.all(
                  // color: Color(0x7f000000),
                  // width: 1,
                  // ),
                  // color: Color(0xffc9cbca),
                  // ),
                  // ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Container(
                    width: 3,
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Color(0x3f000000),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Barang :",
                        style: TextStyle(
                          color: Color(0xff3a3a3a),
                          fontSize: 12,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                          color: Color(0xff3a3a3a),
                          fontSize: 12,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pembayaran(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 10),
                  child: Text(
                    "Lanjutkan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
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

class itemList extends StatefulWidget {
  final List list;
  itemList({required this.list});

  @override
  State<itemList> createState() => _itemListState();
}

class _itemListState extends State<itemList> {
  int _counter = 0;

  // void aaa() {
  // setState(() {
  // print(int.parse(currentItem["value"]));
  // });
  // }

  bool isChecked = false;
  var currentItem;
  var anu;
  int ab = 0;

  // BOOL(int value) {
  // setState(() {
  // if (value == int.parse(currentItem["value"])) {
  // print(false);
  // }
  // // return true;
  // });
  // }

  @override
  void initState() {
    super.initState();
    //in first time, this method will be executed
    _getData();
  }

  List _get = [];
  Future _getData() async {
    try {
      final response =
          await http.post(Uri.parse("${Env.URL_PREFIX}/change_data.php"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void changedata() {
    http.post(Uri.parse("${Env.URL_PREFIX}/change_data.php"), body: {
      "kodebarang": ab,
      "value": anu,
    });
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

  @override
  Widget build(BuildContext context) {
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

    return Container(
      color: Color(0xff5e5e5e),
      child: Column(
        children: [
          Container(
            color: Color(0xff5e5e5e),
            height: MediaQuery.of(context).size.height * 0.007,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pilih Barang ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2 + 150,
            width: MediaQuery.of(context).size.width * 0.97,
            child: ListView.builder(
                // the list of items
                itemCount: widget.list == null ? 0 : widget.list.length,
                itemBuilder: (context, index) {
                  //currentItem = widget.list[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Stack(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: isChecked,
                                    // int.parse(currentItem["value"]) == 0,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        // isChecked = value!;
                                        // print('object');
                                        // if (int.parse(currentItem["value"]) ==
                                        //     0) {
                                        //   ab = 0;
                                        //   print(isChecked);
                                        // }
                                        // if (int.parse(
                                        // widget.list[index]["value"]) ==
                                        // 1) {
                                        // anu = "0";
                                        // ab =
                                        // widget.list[index]["kode_barang"];
                                        // print(ab);
                                        // print(anu);
                                        // } else if (int.parse(
                                        // widget.list[index]["value"]) ==
                                        // 0) {
                                        // anu = "1";
                                        // ab =
                                        // widget.list[index]["kode_barang"];
                                        // print(anu);
                                        // print(ab);
                                        // }
                                        // changedata();
                                        // if (value == true) {
                                        // print(currentItem["kode_barang"]);
                                        // } else if (value != true) {
                                        // print("false");
                                        // }
                                      });
                                    },
                                  ),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: Stack(
                                      children: [
                                        Container(
                                          color: Colors.amber,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.32,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.list[index]["nama_barang"],
                                            style: TextStyle(
                                              color: Color(0xff3a3a3a),
                                              fontSize: 15,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Kode Barang : ',
                                                style: TextStyle(
                                                  color: Color(0xff3a3a3a),
                                                  fontSize: 12,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                widget.list[index]
                                                    ["kode_barang"],
                                                style: TextStyle(
                                                  color: Color(0xff3a3a3a),
                                                  fontSize: 12,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: _decrement,
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Color(0xfff35e58),
                                        size: 20,
                                      )),
                                  Text(
                                    '$_counter',
                                  ),
                                  IconButton(
                                      onPressed: _increment,
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Color(0xff82dcc6),
                                        size: 20,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 72,
                          child: GestureDetector(
                            onTap: () {
                              // if (int.parse(widget.list[index]["value"]) == 1) {
                              // anu = "0";
                              // ab = widget.list[index]["kode_barang"];
                              // print(ab);
                              // print(anu);
                              // } else if (int.parse(
                              // widget.list[index]["value"]) ==
                              // 0) {
                              // anu = "1";
                              // ab = widget.list[index]["kode_barang"];
                              // print(anu);
                              // print(ab);
                              // }
                              // changedata();
                              // Navigator.pop(context);
                            },
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
