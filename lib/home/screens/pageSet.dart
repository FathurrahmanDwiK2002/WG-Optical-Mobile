// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_this, camel_case_types, file_names, prefer_is_empty, avoid_types_as_parameter_names, avoid_print, sized_box_for_whitespace

import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:wg_optical/home/widget/navbar.dart';
import 'package:wg_optical/models/warna.dart';
import 'package:http/http.dart' as http;
import 'package:wg_optical/env/env.dart';

import '../../env/currency.dart';

class pageSet extends StatefulWidget {
  const pageSet({super.key});

  @override
  State<pageSet> createState() => _pageSetState();
}

class _pageSetState extends State<pageSet> with SingleTickerProviderStateMixin {
  final kodeframe = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    EasyLoading.show(status: 'Loading');
    _refreshItems();
    _getFrame();
    getVarianLensa();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TextEditingController id = TextEditingController();
  TextEditingController controllerjenislensa = TextEditingController();
  TextEditingController controllernamalensa = TextEditingController();
  TextEditingController SPHkanan = TextEditingController();
  TextEditingController CLYkanan = TextEditingController();
  TextEditingController AXISkanan = TextEditingController();
  TextEditingController ADDkanan = TextEditingController();
  TextEditingController PDkanan = TextEditingController();
  TextEditingController SEGkanan = TextEditingController();
  TextEditingController SPH = TextEditingController();
  TextEditingController CLY = TextEditingController();
  TextEditingController AXIS = TextEditingController();
  TextEditingController ADD = TextEditingController();
  TextEditingController PD = TextEditingController();
  TextEditingController SEG = TextEditingController();
  TextEditingController nominalFrame = TextEditingController();
  TextEditingController nominalLensa = TextEditingController();

  String selectedJenisLensa = '';
  List<dynamic> jenisLensa = ['Progressive', 'Single Vision'];

  List<dynamic> varianLensa = [];

  final _loadHiveProfile = Hive.box('Profile');
  List<Map<String, dynamic>> _dataProfile = [];
  List<dynamic> _dataFrame = [];
  String selectedFrame = '';
  String minHarga = '';

  List<dynamic> _selectedItems = [];

  int convertIDJenisLensa(String lens) {
    switch (lens) {
      case 'Progressive':
        return 1;
      case 'Single Vision':
        return 2;
      default:
        return 0;
    }
  }

  void submitKeranjang() async {
    String status = 'Error';
    String msg = '';
    if (selectedFrame == '') {
      // kode tidak boleh kosong
      msg = 'Pilih Kode Frame Terlebih Dahulu';
    } else if (selectedJenisLensa == '') {
      // jenis lensa tidak boleh kosong
      msg = 'Pilih Jenis Lensa Terlebih Dahulu';
    } else if (_selectedItems.length == 0) {
      // pilih varian lensa
      msg = 'Pilih Varian Lensa Terlebih Dahulu';
    } else if (SPHkanan.text == '' ||
        CLYkanan.text == '' ||
        AXISkanan.text == '' ||
        ADDkanan.text == '' ||
        PDkanan.text == '' ||
        SEGkanan.text == '') {
      // lengkapi field resep kanan
      msg = 'Masukkan Input Detail Lensa Kanan Terlebih Dahulu';
    } else if (SPH.text == '' ||
        CLY.text == '' ||
        AXIS.text == '' ||
        ADD.text == '' ||
        PD.text == '' ||
        SEG.text == '') {
      // lengkapi field resep kiri
      msg = 'Masukkan Input Detail Lensa Kiri Terlebih Dahulu';
    } else if (nominalFrame.text == '') {
      msg = 'Masukkan Input Harga Frame Terlebih Dahulu';
    } else if (nominalLensa.text == '') {
      msg = 'Masukkan Input Harga Lensa Terlebih Dahulu';
    } else if (int.parse(nominalFrame.text.replaceAll('.', '')) <
        int.parse(minHarga)) {
      msg = 'Harga Frame harus lebih dari ${curr.format(int.parse(minHarga))}';
    } else {
      var respone = await http.post(
        Uri.parse('${Env.URL_PREFIX}api/menuFullset.php'),
        body: {
          "type": "insert",
          "apikey": "aoi12j1h7dwgopticalw1dggwuawdki",
          'id_pegawai': _dataProfile[0]['id_pegawai'],
          "kodef": selectedFrame,
          'knsph': SPHkanan.text,
          'kncyl': CLYkanan.text,
          'knaxis': AXISkanan.text,
          'krsph': SPH.text,
          'krcyl': CLY.text,
          'kraxis': AXIS.text,
          'knadd': ADDkanan.text,
          'knpd': PDkanan.text,
          'knseg': SEGkanan.text,
          'kradd': ADD.text,
          'krpd': PD.text,
          'krseg': SEG.text,
          'hargalensa': nominalLensa.text.replaceAll('.', ''),
          'hargaframe': nominalFrame.text.replaceAll('.', ''),
          'total': (int.parse(nominalLensa.text.replaceAll('.', '')) +
                  int.parse(nominalFrame.text.replaceAll('.', '')))
              .toString(),
          'jenislensa': convertIDJenisLensa(selectedJenisLensa).toString(),
          'selectedVarian': jsonEncode(_selectedItems).toString(),
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

  void getVarianLensa() async {
    final respone = await http.post(
      Uri.parse('${Env.URL_PREFIX}api/menuLensa.php'),
      body: {
        "type": "getLensa",
        "apikey": "aoi12j1h7dwgopticalw1dggwuawdki",
        'id_pegawai': _dataProfile[0]['id_pegawai'],
      },
    );

    setState(() {
      varianLensa = jsonDecode(respone.body);
    });

    if (respone.statusCode == 200) {
      EasyLoading.dismiss();
    }
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

    if (respone.statusCode == 200) {}
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
            "Pembayaran Kaca Mata",
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
        color: color1,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: screenWidth,
              color: color1,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kode Frame",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
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
                                if (_dataFrame[i]['data']['Id_Bawa'] == value) {
                                  minHarga =
                                      '${_dataFrame[i]['data']['harga_jual']}';
                                }
                              }
                            });
                          },
                          popupProps: PopupProps.dialog(
                              title: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  'Pilih Kode Frame',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              searchFieldProps: TextFieldProps(
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
                            dropdownSearchDecoration: InputDecoration.collapsed(
                                hintText: selectedFrame),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jenis Lensa",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
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
                                  selectedJenisLensa = value;
                                });
                              },
                              popupProps: PopupProps.dialog(
                                  title: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    child: Text(
                                      'Pilih Jenis Lensa',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  searchFieldProps: TextFieldProps(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.search),
                                          hintText: 'Cari Jenis Lensa')),
                                  fit: FlexFit.loose,
                                  searchDelay: Duration(seconds: 0),
                                  showSearchBox: false),
                              items: jenisLensa,
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlignVertical: TextAlignVertical.center,
                                dropdownSearchDecoration:
                                    InputDecoration.collapsed(
                                        hintText: selectedJenisLensa),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Varian Lensa",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
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
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            child: MultiSelectDialogField(
                                decoration: BoxDecoration(),
                                dialogHeight: heightPhone * 0.3,
                                barrierColor: Colors.black.withOpacity(0.5),
                                isDismissible: false,
                                chipDisplay: MultiSelectChipDisplay(
                                  scroll: true,
                                  scrollBar:
                                      HorizontalScrollBar(isAlwaysShown: false),
                                  chipColor: Colors.grey,
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                                searchable: true,
                                title: Text('Pilih Varian Lensa'),
                                listType: MultiSelectListType.LIST,
                                items: varianLensa
                                    .map((e) => MultiSelectItem(
                                        e['data']['kode_lensa'],
                                        e['data']['nama_lensa']))
                                    .toList(),
                                onConfirm: (items) {
                                  setState(() {
                                    _selectedItems = items;
                                  });
                                  print(jsonEncode(_selectedItems));
                                }),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              width: screenWidth,
              color: color1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Lensa",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 183,
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
                            padding: const EdgeInsets.only(
                                left: 20, top: 10, bottom: 10, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kanan",
                                  style: TextStyle(
                                    color: Color(0xff343948),
                                    fontSize: 13,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "SPH",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "CYL",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "AXIS",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
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
                                  width: screenWidth,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: Color(0x4ca2a2a2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: SPHkanan,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: CLYkanan,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: AXISkanan,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: heightPhone * 0.015),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ADD+",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "PD.",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "SEG.",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
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
                                  width: screenWidth,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: Color(0x4ca2a2a2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: ADDkanan,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: PDkanan,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: SEGkanan,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 183,
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
                            padding: const EdgeInsets.only(
                                left: 20, top: 10, bottom: 10, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kiri",
                                  style: TextStyle(
                                    color: Color(0xff343948),
                                    fontSize: 13,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "SPH",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "CYL",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "AXIS",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
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
                                  width: screenWidth,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: Color(0x4ca2a2a2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: SPH,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: CLY,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                              
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: AXIS,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: heightPhone * 0.015),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ADD+",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "PD.",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "SEG.",
                                        style: TextStyle(
                                          color: Color(0xff343948),
                                          fontSize: 13,
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
                                  width: screenWidth,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: Color(0x4ca2a2a2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: ADD,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: PD,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9,]")),
                                            ],
                                            textAlign: TextAlign.center,
                                            controller: SEG,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 246,
              color: color1,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Harga Frame",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
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
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                InputFormatCurrency(),
                              ],
                              controller: nominalFrame,
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
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Harga Lensa",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
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
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                InputFormatCurrency(),
                              ],
                              controller: nominalLensa,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                      // adddata();
                      // adddata2();
                      // adddatakeranjang();

                      submitKeranjang();
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
            ],
          ),
        ),
      ),
    );
  }

  final curr = NumberFormat("###,###.###", "en_us");
}
