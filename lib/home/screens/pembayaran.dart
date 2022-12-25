// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_this, prefer_typing_uninitialized_variables, camel_case_types, prefer_final_fields, unused_local_variable, sized_box_for_whitespace, avoid_print, dead_code

import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:wg_optical/home/widget/navbar.dart';
import 'package:wg_optical/models/warna.dart';
import 'package:http/http.dart' as http;

import '../../env/currency.dart';
import '../../env/env.dart';

class pembayaran extends StatefulWidget {
  const pembayaran(
      {super.key, this.restorationId, this.data, this.total, this.id_pegawai});
  final List? data;
  final String? restorationId;
  final int? total;
  final String? id_pegawai;

  @override
  State<pembayaran> createState() => _pembayaranState();
}

class _pembayaranState extends State<pembayaran> with RestorationMixin {
  var anu;

  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 2),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.year}-${_selectedDate.value.month}-${_selectedDate.value.day}'),
        ));
      });

    }
  }

  var txt_nama = TextEditingController();
  var txt_nohp = TextEditingController();
  var txt_pekerjaan = TextEditingController();
  var txt_instansi = TextEditingController();
  var txt_kecamatan = TextEditingController();
  var txt_desa = TextEditingController();
  var txt_alamat = TextEditingController();
  String txt_pembayaran = '';
  String txt_tgl = '';
  var txt_bayar = TextEditingController();
  final curr = NumberFormat("###,###.###", "en_us");

  bool isCicilan = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
            "Pembayaran Akhir",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Montserrat-Bold",
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
              width: screenWidth,
              color: color3,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 358,
                        height: 77,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.snippet_folder_outlined, size: 34),
                              TextButton(
                                child: Text(
                                  "Detail Pesanan",
                                  style: TextStyle(
                                    color: Color(0xff4e4e4e),
                                    fontSize: 16,
                                    fontFamily: "Montserrat-SemiBold",
                                  ),
                                ),
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 400,
                                        width: screenWidth,
                                        color: color3,
                                        child: Center(
                                          child: ListView.builder(
                                              // the list of items
                                              itemCount: 0,
                                              itemBuilder: (_, index) {
                                                return Container();
                                                // final currentItem =
                                                //     _Data[index];
                                                // return Padding(
                                                //   padding:
                                                //       const EdgeInsets.all(8.0),
                                                //   child: Container(
                                                //     width: 353,
                                                //     height: 72,
                                                //     decoration: BoxDecoration(
                                                //       borderRadius:
                                                //           BorderRadius.circular(
                                                //               8),
                                                //       boxShadow: [
                                                //         BoxShadow(
                                                //           color:
                                                //               Color(0x3f000000),
                                                //           blurRadius: 4,
                                                //           offset: Offset(2, 2),
                                                //         ),
                                                //       ],
                                                //       color: Colors.white,
                                                //     ),
                                                //     child: Padding(
                                                //       padding:
                                                //           const EdgeInsets.all(
                                                //               8.0),
                                                //       child: Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .spaceBetween,
                                                //         children: [
                                                //           Row(
                                                //             children: [
                                                //               Container(
                                                //                 width: 60,
                                                //                 height: 60,
                                                //                 child: Stack(
                                                //                   children: [
                                                //                     Container(
                                                //                       color: Colors
                                                //                           .amber,
                                                //                     ),
                                                //                   ],
                                                //                 ),
                                                //               ),
                                                //               SizedBox(
                                                //                 width: MediaQuery.of(
                                                //                             context)
                                                //                         .size
                                                //                         .width *
                                                //                     0.04,
                                                //               ),
                                                //               Container(
                                                //                 width: MediaQuery.of(
                                                //                             context)
                                                //                         .size
                                                //                         .width *
                                                //                     0.2,
                                                //                 child: Padding(
                                                //                   padding: const EdgeInsets
                                                //                           .only(
                                                //                       top: 10),
                                                //                   child: Column(
                                                //                     mainAxisAlignment:
                                                //                         MainAxisAlignment
                                                //                             .start,
                                                //                     crossAxisAlignment:
                                                //                         CrossAxisAlignment
                                                //                             .start,
                                                //                     children: [
                                                //                       Text(
                                                //                         currentItem['name']
                                                //                             .toString(),
                                                //                         style:
                                                //                             TextStyle(
                                                //                           color:
                                                //                               Color(0xff3a3a3a),
                                                //                           fontSize:
                                                //                               16,
                                                //                           fontFamily:
                                                //                               "Montserrat",
                                                //                           fontWeight:
                                                //                               FontWeight.w600,
                                                //                         ),
                                                //                       ),
                                                //                       Row(
                                                //                         children: [
                                                //                           Text(
                                                //                             'Kode : ',
                                                //                             style:
                                                //                                 TextStyle(
                                                //                               color: Color(0xff3a3a3a),
                                                //                               fontSize: 12,
                                                //                               fontFamily: "Montserrat",
                                                //                               fontWeight: FontWeight.w500,
                                                //                             ),
                                                //                           ),
                                                //                           Text(
                                                //                             currentItem['kode'],
                                                //                             style:
                                                //                                 TextStyle(
                                                //                               color: Color(0xff3a3a3a),
                                                //                               fontSize: 12,
                                                //                               fontFamily: "Montserrat",
                                                //                               fontWeight: FontWeight.w500,
                                                //                             ),
                                                //                           ),
                                                //                         ],
                                                //                       ),
                                                //                     ],
                                                //                   ),
                                                //                 ),
                                                //               ),
                                                //             ],
                                                //           ),
                                                //         ],
                                                //       ),
                                                //     ),
                                                //   ),
                                                // );
                                              }),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                onPressed: () {
                                  print(widget.data);
                                },
                                icon: Icon(
                                  Icons.arrow_circle_right_rounded,
                                  size: 34,
                                ),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Customer",
                          style: TextStyle(
                            color: Color(0xff373f47),
                            fontSize: 16,
                            fontFamily: "Montserrat-Bold",
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Nama",
                          style: TextStyle(
                            color: Color(0xff373f47),
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
                              controller: txt_nama,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No Telepon",
                          style: TextStyle(
                            color: Color(0xff373f47),
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
                              controller: txt_nohp,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pekerjaan",
                          style: TextStyle(
                            color: Color(0xff373f47),
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
                              controller: txt_pekerjaan,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Instansi",
                          style: TextStyle(
                            color: Color(0xff373f47),
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
                              controller: txt_instansi,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Alamat",
                          style: TextStyle(
                            color: Color(0xff373f47),
                            fontSize: 16,
                            fontFamily: "Montserrat-Bold",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Kecamatan",
                          style: TextStyle(
                            color: Color(0xff373f47),
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
                              controller: txt_kecamatan,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Desa",
                          style: TextStyle(
                            color: Color(0xff373f47),
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
                              controller: txt_desa,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Alamat Lengkap",
                          style: TextStyle(
                            color: Color(0xff373f47),
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
                              controller: txt_alamat,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pembayaran",
                          style: TextStyle(
                            color: Color(0xff373f47),
                            fontSize: 16,
                            fontFamily: "Montserrat-Bold",
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Pilih Pembayaran",
                          style: TextStyle(
                            color: Color(0xff373f47),
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
                            child: DropdownSearch<String>(
                              selectedItem: 'Lunas',
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                border: InputBorder.none,
                              )),
                              popupProps: PopupProps.dialog(
                                fit: FlexFit.loose,
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                              ),
                              items: ["Lunas", "Cicilan"],
                              onChanged: (value) {
                                setState(() {
                                  txt_pembayaran = value!;
                                  if (txt_pembayaran == "Cicilan") {
                                    isCicilan = true;
                                  } else {
                                    isCicilan = false;
                                  }
                                });
                                print(isCicilan);
                              },
                            ),
                          ),
                        ),
                        isCicilan
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Tgl Jatuh Tempo",
                                    style: TextStyle(
                                      color: Color(0xff373f47),
                                      fontSize: 15,
                                      fontFamily: "Montserrat-SemiBold",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      height: 50,
                                      width: screenWidth,
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
                                      child: GestureDetector(
                                        child: Container(
                                          height: 50,
                                          width: screenWidth,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 15, bottom: 15),
                                            child: Text(
                                                '${_selectedDate.value.year}-${_selectedDate.value.month}-${_selectedDate.value.day}'),
                                          ),
                                        ),
                                        onTap: () {
                                          _restorableDatePickerRouteFuture
                                              .present();
                                        },
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Total Bayar",
                                    style: TextStyle(
                                      color: Color(0xff373f47),
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
                                        controller: txt_bayar,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Total Bayar",
                                    style: TextStyle(
                                      color: Color(0xff373f47),
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
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          InputFormatCurrency(),
                                        ],
                                        controller: txt_bayar,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
                    color: color3,
                    width: 1,
                  ),
                  color: color3,
                ),
                child: TextButton(
                    onPressed: () {
                      submitTransaksi();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => navbar(),
                      //     ));
                    },
                    child: Text(
                      "Lanjut Proses",
                      style: TextStyle(
                        color: color2,
                        fontSize: 16,
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

  void submitTransaksi() async {
    String status = 'Error';
    String msg = '';
    if (txt_nama.text == '') {
      //
      msg = 'Input Nama Harus Diisi';
    } else if (txt_nohp.text == '') {
      //
      msg = 'Input No Telepon Harus Diisi';
    } else if (txt_pekerjaan.text == '') {
      //
      msg = 'Input Pekerjaan Harus Diisi';
    } else if (txt_instansi.text == '') {
      //
      msg = 'Input Instansi Harus Diisi';
    } else if (txt_kecamatan.text == '') {
      //
      msg = 'Input Kecamatan Harus Diisi';
    } else if (txt_desa.text == '') {
      //
      msg = 'Input Desa Harus Diisi';
    } else if (txt_alamat.text == '') {
      //
      msg = 'Input Alamat Harus Diisi';
    } else if (txt_pembayaran == '') {
      //
      msg = 'Pilih Opsi Pembayaran Terlebih Dahulu';
    } else if (txt_bayar.text == '') {
      // pilih varian lensa
      msg = 'Input Total Bayar Harus Diisi';
    } else if(int.parse(txt_bayar.text.replaceAll('.', '')) < widget.total!){
      msg = 'Total Bayar Harus Lebih Dari ${curr.format(widget.total)}';
    } else {
      int kembalian = 0;
      if(txt_pembayaran == 'Lunas'){
        kembalian = int.parse(txt_bayar.text.replaceAll('.', '')) - widget.total!;
      }
      var respone = await http.post(
        Uri.parse('${Env.URL_PREFIX}api/transaksi.php'),
        body: {
          "type": "insert",
          "apikey": "aoi12j1h7dwgopticalw1dggwuawdki",
          'txt_nama': txt_nama.text,
          'txt_kecamatan': txt_kecamatan.text,
          'txt_desa': txt_desa.text,
          'txt_alamat': txt_alamat.text,
          'txt_pekerjaan': txt_pekerjaan.text,
          'txt_instansi': txt_instansi.text,
          'data': json.encode(widget.data),
          'id_pegawai': widget.id_pegawai,
          'total': widget.total.toString(),
          'total_harga': txt_bayar.text.replaceAll('.', ''),
          'kembalian': kembalian.toString(),
          'proses_pembayaran': txt_pembayaran == 'Lunas' ? '1' : '2',
          'tgljatuhtempo': '${_selectedDate.value.year}-${_selectedDate.value.month}-${_selectedDate.value.day}',
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
}
