// ignore_for_file: camel_case_types, file_names, unnecessary_new, prefer_final_fields, unused_element, non_constant_identifier_names, prefer_const_constructors, unused_local_variable, unused_field, avoid_types_as_parameter_names, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:ffi';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wg_optical/env/currency.dart';
import 'package:wg_optical/home/screens/pageCart.dart';
import 'package:wg_optical/home/screens/pembayaran.dart';
import 'package:wg_optical/models/warna.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../env/env.dart';
import '../widget/navbar.dart';

class pageFrame extends StatefulWidget {
  const pageFrame({super.key});

  @override
  State<pageFrame> createState() => _pageFrameState();
}

class _pageFrameState extends State<pageFrame>
    with SingleTickerProviderStateMixin {
  final _loadHiveProfile = Hive.box('Profile');
  List<Map<String, dynamic>> _dataProfile = [];
  List<dynamic> _dataFrame = [];

  final nominal = new TextEditingController();
  late TabController tabController;
  String selectedFrame = '';
  String minHarga = '';

  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    _refreshItems();
    _getFrame();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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

  void _getFrame() async {
    EasyLoading.show(status: 'Loading');

    final respone = await http.post(
      Uri.parse('${Env.URL_PREFIX}api/menuFrame.php'),
      body: {
        "type": "getFrame",
        "apikey": "aoi12j1h7dwgopticalw1dggwuawdki",
        'id_pegawai': _dataProfile[0]['id_pegawai'],
      },
    );

    setState(() {
      _dataFrame = jsonDecode(respone.body);
    });

    if (respone.statusCode == 200) {
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appbar = AppBar(
      backgroundColor: Color(0xfff0f0f0),
      elevation: 0,
      toolbarHeight: 0,
    );

    final heightPhone = screenHeight -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 5,
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
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: color1,
                    )),
              ),
            ],
          ),
          title: Text(
            "Pembayaran Frame",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Montserrat-Bold",
            ),
          )),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: color1,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 246,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kode Frame",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Montserrat-SemiBold",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: DropdownSearch(
                              onChanged: (value) {
                                setState(() {
                                  selectedFrame = value;
                                  for (var i = 0; i < _dataFrame.length; i++) {
                                    if (_dataFrame[i]['data']['Id_Bawa'] ==
                                        value) {
                                      minHarga =
                                          '${_dataFrame[i]['data']['harga_jual']}';
                                    }
                                  }
                                });
                              },
                              popupProps: PopupProps.dialog(
                                  listViewProps: ListViewProps(
                                    physics: BouncingScrollPhysics(),
                                  ),
                                  title: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    child: Text(
                                      'Pilih Kode Frame',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat-SemiBold',
                                      ),
                                    ),
                                  ),
                                  searchFieldProps: TextFieldProps(
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                      ),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.search),
                                          hintText: 'Cari Kode Frame')),
                                  fit: FlexFit.loose,
                                  searchDelay: Duration(seconds: 0),
                                  showSearchBox: true),
                              items: _dataFrame.map((data) {
                                return data['data']['Id_Bawa'];
                              }).toList(),
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlignVertical: TextAlignVertical.center,
                                dropdownSearchDecoration:
                                    InputDecoration.collapsed(
                                        hintStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                        ),
                                        hintText: selectedFrame),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nominal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Montserrat-SemiBold",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                InputFormatCurrency(),
                              ],
                              keyboardType: TextInputType.number,
                              controller: nominal,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: minHarga == ''
                                    ? ""
                                    : curr.format(int.parse(minHarga)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: screenWidth,
        color: color2,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth * 0.4,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xff5e5e5e),
                    width: 1,
                  ),
                  color: Color(0xff3a3a3a),
                ),
                child: TextButton(
                    onPressed: () {
                      print(minHarga);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => pageCart(),
                      //     ));
                    },
                    child: Text(
                      "Keranjang",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
              Container(
                width: screenWidth * 0.4,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color1,
                ),
                child: TextButton(
                  onPressed: () {
                    submitKeranjang();
                  },
                  child: Text(
                    "Beli",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitKeranjang() async {
    String status = 'Error';
    String msg = '';
    if (selectedFrame == '') {
      // kode tidak boleh kosong
      msg = 'Pilih Kode Frame Terlebih Dahulu';
    } else if (nominal.text == '') {
      msg = 'Masukkan Input Harga Frame Terlebih Dahulu';
    } else if (int.parse(nominal.text.replaceAll('.', '')) <
        int.parse(minHarga)) {
      msg = 'Harga Frame harus lebih dari ${curr.format(int.parse(minHarga))}';
    } else {
      var respone = await http.post(
        Uri.parse('${Env.URL_PREFIX}api/menuFrame.php'),
        body: {
          "type": "insert",
          "apikey": "aoi12j1h7dwgopticalw1dggwuawdki",
          'id_pegawai': _dataProfile[0]['id_pegawai'],
          "kode_frame": selectedFrame,
          "harga": nominal.text.replaceAll('.', ''),
        },
      );
      print(respone.body);
      status = 'Sukses';
      var listD = jsonDecode(respone.body);
      msg = listD['msg'];
    }

    ArtSweetAlert.show(
      barrierDismissible: status == 'Error' ? true : false,
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: status == 'Error'
              ? ArtSweetAlertType.danger
              : ArtSweetAlertType.success,
          title: status,
          onConfirm: () {
            status == 'Sukses'
                ? Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: ((context) => navbar()),
                    ),
                    (route) => false)
                : Navigator.of(context).pop();
          },
          text: msg),
    );
  }

  final curr = NumberFormat("###,###.###", "en_us");
}
