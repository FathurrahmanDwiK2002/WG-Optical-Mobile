// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_this

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:wg_optical/home/component/dasboard.dart';
import 'package:wg_optical/home/screens/pageCart.dart';
import 'package:wg_optical/home/widget/navbar.dart';
import 'package:wg_optical/models/warna.dart';

import '../../models/kacaMata_item.dart';

class pageSet extends StatefulWidget {
  const pageSet({super.key});

  @override
  State<pageSet> createState() => _pageSetState();
}

class _pageSetState extends State<pageSet> with SingleTickerProviderStateMixin {
  late TabController tabController;
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
        color: Color(0xff5e5e5e),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                // SizedBox(height: 42),
                Container(
                  // height: 50,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Color(0x3f000000),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: TabBar(
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.black,
                          indicatorColor: Colors.white,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: Color(0xff3a3a3a),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          controller: tabController,
                          tabs: [
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                "Pembayaran",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              "Lunas",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Detail Pesanan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2 + 180,
                  child: Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jenis Lensa",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 42,
                                        width: screenWidth * 0.43,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: TextField(
                                            // controller: kodeframe,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Varian Lensa",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 42,
                                        width: screenWidth * 0.43,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x3f000000),
                                              blurRadius: 4,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                          color: Colors.white,
                                        ),
                                        child: FormHelper.dropDownWidget(
                                            context,
                                            "",
                                            this.countryId,
                                            this.productTypesLensa,
                                            (onChangedVal) {
                                          this.countryId = onChangedVal;
                                          print(onChangedVal);
                                        }, (onValidateVal) {
                                          if (onValidateVal == null) {
                                            return 'Please Select Product Type';
                                          }

                                          return null;
                                        },
                                            borderColor: Colors.transparent,
                                            borderFocusColor:
                                                Colors.transparent,
                                            borderRadius: 0,
                                            optionLabel: "label",
                                            optionValue: "id"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Detail Lensa",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                                  // controller: kodeframe,
                                                  decoration: InputDecoration(
                                                    hintText: "",
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: screenWidth * 0.11,
                                                child: TextField(
                                                  // controller: kodeframe,
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
                                                  // controller: kodeframe,
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
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                                  // controller: kodeframe,
                                                  decoration: InputDecoration(
                                                    hintText: "",
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: screenWidth * 0.11,
                                                child: TextField(
                                                  // controller: kodeframe,
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
                                                  // controller: kodeframe,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                                  // controller: kodeframe,
                                                  decoration: InputDecoration(
                                                    hintText: "",
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: screenWidth * 0.11,
                                                child: TextField(
                                                  // controller: kodeframe,
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
                                                  // controller: kodeframe,
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
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                                  // controller: kodeframe,
                                                  decoration: InputDecoration(
                                                    hintText: "",
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: screenWidth * 0.11,
                                                child: TextField(
                                                  // controller: kodeframe,
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
                                                  // controller: kodeframe,
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
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Kode Frame",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 42,
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
                                    decoration: InputDecoration(
                                      hintText: "",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tanggal Jatuh Tempo",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 42,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 +
                                                40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: TextField(
                                            // controller: kodeframe,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "DP",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 42,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x3f000000),
                                              blurRadius: 4,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                          color: Colors.white,
                                        ),
                                        child: FormHelper.dropDownWidget(
                                            context,
                                            "",
                                            this.countryDp,
                                            this.DP, (onChangedVal) {
                                          this.countryDp = onChangedVal;
                                          print(onChangedVal);
                                        }, (onValidateVal) {
                                          if (onValidateVal == null) {
                                            return 'Please Select Product Type';
                                          }

                                          return null;
                                        },
                                            borderColor: Colors.transparent,
                                            borderFocusColor:
                                                Colors.transparent,
                                            borderRadius: 0,
                                            optionLabel: "label",
                                            optionValue: "id"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Nominal",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 42,
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
                                    decoration: InputDecoration(
                                      hintText: "",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      width: 153,
                                      height: 58,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Color(0xff5e5e5e),
                                          width: 1,
                                        ),
                                        color: Color(0xff3a3a3a),
                                      ),
                                      child: TextButton(
                                          onPressed: () {},
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Container(
                                      width: 153,
                                      height: 58,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Color(0xff5e5e5e),
                                          width: 1,
                                        ),
                                        color: Color(0xffc9cbca),
                                      ),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      pageCart(),
                                                ));
                                          },
                                          child: Text(
                                            "Bayar",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jenis Lensa",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 42,
                                        width: screenWidth * 0.43,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: TextField(
                                            // controller: kodeframe,
                                            decoration: InputDecoration(
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Varian Lensa",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 42,
                                        width: screenWidth * 0.43,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x3f000000),
                                              blurRadius: 4,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                          color: Colors.white,
                                        ),
                                        child: FormHelper.dropDownWidget(
                                            context,
                                            "",
                                            this.countryId,
                                            this.productTypesLensa,
                                            (onChangedVal) {
                                          this.countryId = onChangedVal;
                                          print(onChangedVal);
                                        }, (onValidateVal) {
                                          if (onValidateVal == null) {
                                            return 'Please Select Product Type';
                                          }

                                          return null;
                                        },
                                            borderColor: Colors.transparent,
                                            borderFocusColor:
                                                Colors.transparent,
                                            borderRadius: 0,
                                            optionLabel: "label",
                                            optionValue: "id"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Detail Lensa",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                                  // controller: kodeframe,
                                                  decoration: InputDecoration(
                                                    hintText: "",
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: screenWidth * 0.11,
                                                child: TextField(
                                                  // controller: kodeframe,
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
                                                  // controller: kodeframe,
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
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                                  // controller: kodeframe,
                                                  decoration: InputDecoration(
                                                    hintText: "",
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: screenWidth * 0.11,
                                                child: TextField(
                                                  // controller: kodeframe,
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
                                                  // controller: kodeframe,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                                  // controller: kodeframe,
                                                  decoration: InputDecoration(
                                                    hintText: "",
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: screenWidth * 0.11,
                                                child: TextField(
                                                  // controller: kodeframe,
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
                                                  // controller: kodeframe,
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
                                          borderRadius:
                                              BorderRadius.circular(11),
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
                                                  // controller: kodeframe,
                                                  decoration: InputDecoration(
                                                    hintText: "",
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40,
                                                width: screenWidth * 0.11,
                                                child: TextField(
                                                  // controller: kodeframe,
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
                                                  // controller: kodeframe,
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
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Kode Frame",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 42,
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
                                    decoration: InputDecoration(
                                      hintText: "",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Nominal",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 42,
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
                                    decoration: InputDecoration(
                                      hintText: "",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      width: 153,
                                      height: 58,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Color(0xff5e5e5e),
                                          width: 1,
                                        ),
                                        color: Color(0xff3a3a3a),
                                      ),
                                      child: TextButton(
                                          onPressed: () {},
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Container(
                                      width: 153,
                                      height: 58,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Color(0xff5e5e5e),
                                          width: 1,
                                        ),
                                        color: Color(0xffc9cbca),
                                      ),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      pageCart(),
                                                ));
                                          },
                                          child: Text(
                                            "Bayar",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
