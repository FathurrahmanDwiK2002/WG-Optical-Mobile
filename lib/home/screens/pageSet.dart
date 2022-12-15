// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_this, camel_case_types, file_names, prefer_is_empty, avoid_types_as_parameter_names, avoid_print, sized_box_for_whitespace

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wg_optical/home/widget/navbar.dart';
import 'package:wg_optical/models/warna.dart';
import 'package:http/http.dart' as http;
import 'package:wg_optical/env/env.dart';


class pageSet extends StatefulWidget {
  const pageSet({super.key});

  @override
  State<pageSet> createState() => _pageSetState();
}

class _pageSetState extends State<pageSet> with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> _Data = [];
  final _account = Hive.box('Data');
  final anu = TextEditingController();
  final kodeframe = TextEditingController();
  late TabController tabController;
  Future<void> _addData(Map<String, dynamic> newData) async {
    await _account.add(newData);
  }

  String autoId() {
    var id = "";
    if (_Data.length == 0) {
      id = "BR01";
    } else {
      var id1 = _Data[1]["kode_barang"].toString();
      var idTok = id1.substring(0, 2);
      var nomorTok = int.parse(id1.substring(2, 3)) + 1;

      id = "$idTok$nomorTok";
    }
    return id;
  }

  void load_data() {
    final data = _account.keys.map((Key) {
      final value = _account.get(Key);
      return {
        "key": Key,
        "name": value["name"],
        "kode": value["kode"],
      };
    }).toList();

    setState(() {
      _Data = data.reversed.toList();
    });
  }

  List<dynamic> productTypesLensa = [];
  List<dynamic> DP = [];

  String? countryId;
  String? countryDp;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    this.productTypesLensa = [
      {"id": "1", "label": "Simple"},
      {"id": "2", "label": "Variable"}
    ];

    this.DP = [
      {"id": "1", "label": "1"},
      {"id": "2", "label": "2"}
    ];
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void adddata() {
    http.post(Uri.parse("${Env.URL_PREFIX}/add_barang.php"), body: {
      "id": id.text,
      "namalensa": controllernamalensa.text,
      "jenislensa": controllerjenislensa.text,
    });
  }

  void adddata2() {
    http.post(Uri.parse("${Env.URL_PREFIX}/add_barang2.php"), body: {
      "knsph": SPHkanan.text,
      "kncyl": CLYkanan.text,
      "knaxis": AXISkanan.text,
      "knadd": ADDkanan.text,
      "knpd": PDkanan.text,
      "knseg": SEGkanan.text,
      "sph": SPH.text,
      "cyl": CLY.text,
      "axis": AXIS.text,
      "add": ADD.text,
      "pd": PD.text,
      "seg": SEG.text
    });
  }

  void adddatakeranjang() {
    http.post(Uri.parse("${Env.URL_PREFIX}/add_dataKeranjang.php"), body: {
      "nama_keranjang": "Frame dan Lensa",
    });
  }

  void addkeranjang() {
    http.post(Uri.parse("${Env.URL_PREFIX}/add_keranjang.php"), body: {
      "nama_keranjang": "Frame dan Lensa",
      "knsph": SPHkanan.text,
      "kncyl": CLYkanan.text,
      "knaxis": AXISkanan.text,
      "knadd": ADDkanan.text,
      "knpd": PDkanan.text,
      "knseg": SEGkanan.text,
      "sph": SPH.text,
      "cyl": CLY.text,
      "axis": AXIS.text,
      "add": ADD.text,
      "pd": PD.text,
      "seg": SEG.text,
      "namalensa": controllernamalensa.text,
      "jenislensa": controllerjenislensa.text,
    });
  }

  TextEditingController qty = TextEditingController(text: "0");
  TextEditingController nama_barang =
      TextEditingController(text: "Frame dan Lensa");
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
  TextEditingController nominal = TextEditingController();

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
        color: color2,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 245,
              width: screenWidth,
              color: color3,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                            child: DropdownSearch<String>(
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                      dropdownSearchDecoration:
                                          InputDecoration()),
                              popupProps: PopupProps.menu(
                                fit: FlexFit.loose,
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              items: ["progresive", "single vision"],
                              onChanged: (value) {
                                setState(() {
                                  controllerjenislensa.text = value.toString();
                                });
                                print(controllerjenislensa.text);
                              },
                            ),
                          ),
                        ),
                      ],
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
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: DropdownSearch<String>(
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration()),
                                popupProps: PopupProps.menu(
                                  fit: FlexFit.loose,
                                  showSelectedItems: true,
                                  disabledItemFn: (String s) =>
                                      s.startsWith('I'),
                                ),
                                items: ["Bluecromic", "Bluray", 'Embo Lali'],
                                onChanged: (value) {
                                  setState(() {
                                    controllernamalensa.text = value.toString();
                                  });
                                  print(controllernamalensa.text);
                                },
                              ),
                            )),
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
              height: 480,
              width: screenWidth,
              color: color3,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
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
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: SPHkanan,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: CLYkanan,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                            cursorColor: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: AXISkanan,
                                            decoration: InputDecoration(
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
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: ADDkanan,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: PDkanan,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                            cursorColor: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: SEGkanan,
                                            decoration: InputDecoration(
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
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: SPH,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: CLY,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                            cursorColor: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: AXIS,
                                            decoration: InputDecoration(
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
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: ADD,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: PD,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                            cursorColor: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            controller: SEG,
                                            decoration: InputDecoration(
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
              color: color3,
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
                              controller: kodeframe,
                              decoration: InputDecoration(
                                hintText: "",
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
                              // controller: id,
                              decoration: InputDecoration(
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
                      _addData({
                        "kode_barang": autoId().toString(),
                        "nama_barang": nama_barang.text,
                        "qty": qty.text,
                        "value": "0"
                      });
                      print(nama_barang.text);
                      addkeranjang();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => navbar(),
                          ));
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
}
