// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, file_names, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wg_optical/home/screens/pageCart.dart';
import 'package:wg_optical/models/warna.dart';
import 'package:http/http.dart' as http;
import 'package:wg_optical/env/env.dart';


class pageLensa extends StatefulWidget {
  const pageLensa({super.key});

  @override
  State<pageLensa> createState() => _pageLensaState();
}

class _pageLensaState extends State<pageLensa>
    with SingleTickerProviderStateMixin {
  TextEditingController controllerkodelensa = TextEditingController();
  TextEditingController controllernamalensa = TextEditingController();
  TextEditingController controllerjenislensa = TextEditingController();
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

  void adddata() {
    http.post(Uri.parse("${Env.URL_PREFIX}/add_data_transaksi.php"), body: {
      "kodelensa": controllerkodelensa.text,
      "namalensa": controllernamalensa.text,
      "jenislensa": controllerjenislensa.text
    });
  }

  void addkeranjang() {
    http.post(Uri.parse("${Env.URL_PREFIX}/add_keranjang.php"), body: {
      "nama_keranjang": "Lensa",
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

  late TabController tabController;
  List<dynamic> productTypesLensa = [];
  List<dynamic> DP = [];

  String? countryId;
  String? countryDp;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    productTypesLensa = [
      {"id": "1", "label": "Simple"},
      {"id": "2", "label": "Variable"}
    ];

    DP = [
      {"id": "1", "label": "1"},
      {"id": "2", "label": "2"}
    ];
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
          shadowColor: color1,
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
            "Pembayaran Lensa",
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
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              items: ["Progresif", "Single Vision"],
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
                                  showSelectedItems: true,
                                  disabledItemFn: (String s) =>
                                      s.startsWith('I'),
                                ),
                                items: ["Bluecromic", "Bluray", 'Embo Lali'],
                                onChanged: (value) {
                                  setState(() {
                                    controllernamalensa.text = value.toString();
                                  });
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
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: SPHkanan,
                                            decoration: InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: CLYkanan,
                                            decoration: InputDecoration.collapsed(
                                              
                                              hintText: "",
                                            ),
                                            
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: AXISkanan,
                                            decoration: InputDecoration.collapsed(
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
                                            textAlign: TextAlign.center,
                                            controller: ADDkanan,
                                            decoration: InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: PDkanan,
                                            decoration: InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                            cursorColor: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: SEGkanan,
                                            decoration: InputDecoration.collapsed(
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
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: SPH,
                                            decoration: InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: CLY,
                                            decoration: InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: AXIS,
                                            decoration: InputDecoration.collapsed(
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
                                            textAlign: TextAlign.center,
                                            controller: ADD,
                                            decoration: InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: PD,
                                            decoration: InputDecoration.collapsed(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: screenWidth * 0.11,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: SEG,
                                            decoration: InputDecoration.collapsed(
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
              height: 150,
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
                          alignment: Alignment.center,
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
                              
                              // controller: kodeframe,
                              decoration: InputDecoration.collapsed(
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
                      addkeranjang();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pageCart(),
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
