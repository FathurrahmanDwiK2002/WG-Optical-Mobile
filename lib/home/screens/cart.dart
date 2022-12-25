// ignore_for_file: prefer_const_constructors, camel_case_types, unused_element, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:wg_optical/env/currency.dart';
import 'package:wg_optical/home/screens/pembayaran.dart';
import '../../env/env.dart';
import '../../models/warna.dart';

class cartPage extends StatefulWidget {
  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  final _loadHiveProfile = Hive.box('Profile');
  List<Map<String, dynamic>> _dataProfile = [];

  Future<List> getData() async {
    var response = await http.post(
      Uri.parse('${Env.URL_PREFIX}api/getKeranjang.php'),
      body: {
        "apikey": "aoi12j1h7dwgopticalw1dggwuawdki",
        'id_pegawai': _dataProfile[0]['id_pegawai'],
      },
    );

    print(jsonDecode(response.body));

    return jsonDecode(response.body);
  }

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
        ),
      ),
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
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                child: FutureBuilder<List>(
                  future: getData(),
                  builder: (context, snaphot) {
                    if (snaphot.hasError) {
                      print(snaphot.error);
                    }
                    return snaphot.hasData
                        ? ItemList(
                            list: snaphot.requireData,
                            id_pegawai: _dataProfile[0]['id_pegawai'],
                          )
                        : Center(
                            child: Text(
                              'No Data',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  final List list;
  String id_pegawai;
  ItemList({required this.list, required this.id_pegawai});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final List _isCheck = [];
  final List _idSelected = [];
  bool checkAll = false;
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < widget.list.length; i++) {
      _isCheck.insert(i, false);
      // _isCheck[i] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.list.length,
              itemBuilder: ((context, index) {
                // _isCheck[index] = false;
                print('ini ${_isCheck[index]}');
                var currentItem = widget.list[index];
                return Padding(
                  padding: EdgeInsets.all(8),
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
                                value: _isCheck[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isCheck[index] = !_isCheck[index];

                                    if (_idSelected.contains(
                                        currentItem['data']['kode_pesanan'])) {
                                      _idSelected.remove(
                                          currentItem['data']['kode_pesanan']);
                                      total = total -
                                          int.parse(
                                              currentItem['data']['total']);
                                    } else {
                                      _idSelected.add(
                                          currentItem['data']['kode_pesanan']);
                                      total = total +
                                          int.parse(
                                              currentItem['data']['total']);
                                    }

                                    if (_isCheck.contains(false)) {
                                      checkAll = false;
                                    } else {
                                      checkAll = true;
                                    }
                                  });
                                  print(_idSelected);
                                  print(total);
                                },
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${Env.URL_PREFIX}assets/images/heroimg.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.32,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentItem['jenis'].toString(),
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
                                            CurrencyFormat.convertToIdr(
                                                int.parse(currentItem['data']
                                                    ['total']),
                                                0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  // _decrement,
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Color(0xfff35e58),
                                    size: 20,
                                  )),
                              Text(
                                '2',
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Color(0xff82dcc6),
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
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
                        value: checkAll,
                        onChanged: (bool? value) {
                          setState(() {
                            checkAll = value!;

                            if (checkAll) {
                              _idSelected.clear();
                              total = 0;

                              for (var i = 0; i < widget.list.length; i++) {
                                _isCheck[i] = value;
                                _idSelected.add(
                                    widget.list[i]['data']['kode_pesanan']);
                                total = total +
                                    int.parse(widget.list[i]['data']['total']);
                              }
                            } else {
                              for (var i = 0; i < widget.list.length; i++) {
                                _isCheck[i] = value;
                              }
                              total = 0;
                              _idSelected.clear();
                            }
                          });
                          print(_idSelected);
                        },
                      ),
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
                            "Total :",
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
                            CurrencyFormat.convertToIdr(total, 2)
                                .toString()
                                .replaceAll(',00', ''),
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
                      if (_idSelected.length == 0) {
                        ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.warning,
                              title: 'Informasi',
                              onConfirm: () {
                                Navigator.of(context).pop();
                              },
                              text: "Pilih salah satu barang terlebih dahulu"),
                        );
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => pembayaran(
                                      data: _idSelected,
                                      total: total,
                                      id_pegawai: widget.id_pegawai,
                                    ))));
                      }
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
        ],
      ),
    );
  }
}
