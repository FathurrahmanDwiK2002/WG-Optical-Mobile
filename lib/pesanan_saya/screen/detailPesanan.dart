import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wg_optical/home/component/dasboard.dart';
import 'package:wg_optical/home/widget/navbar.dart';
import 'package:wg_optical/models/kacaMata_item.dart';
import 'package:wg_optical/models/warna.dart';

import '../../models/kacaMata_item.dart';

class detailPesanan extends StatefulWidget {
  final KacaMataItem anu;
  const detailPesanan({super.key, required this.anu});

  @override
  State<detailPesanan> createState() => _detailPesananState();
}

class _detailPesananState extends State<detailPesanan> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 10,
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
              "Rincian Pesanan",
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenWidth,
                    height: 104,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Color(0xffc9cbca),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Telah Selesai",
                            style: TextStyle(
                              color: Color(0xff5e5e5e),
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Pesanan masih dengan kode pesanan #TR29102902 masih dalam pemrosesan ",
                            style: TextStyle(
                              color: Color(0xff5e5e5e),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenWidth,
                    height: 176,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Color(0xffc9cbca),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alamat Penerima",
                            style: TextStyle(
                              color: Color(0xff5e5e5e),
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.anu.Waktu.toString(),
                            style: TextStyle(
                              color: Color(0xff5e5e5e),
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "089734839994",
                            style: TextStyle(
                              color: Color(0xff5e5e5e),
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Jl. Mastrip, Krajan Timur, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur 68121\n",
                            style: TextStyle(
                              color: Color(0xff5e5e5e),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenWidth,
                    height: 166,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Color(0xffc9cbca),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Informasi Pembayaran",
                            style: TextStyle(
                              color: Color(0xff5e5e5e),
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Pesanan ",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "3 barang",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "DP",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "Rp150.00",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kurang Bayar",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "Rp410.00",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Harga Jual",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Rp560.000",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenWidth,
                    height: 323,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Color(0xffc9cbca),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama User",
                            style: TextStyle(
                              color: Color(0xff5e5e5e),
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Frame Naga Barong",
                                    style: TextStyle(
                                      color: Color(0xff5e5e5e),
                                      fontSize: 14,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Jenis Barang ",
                                    style: TextStyle(
                                      color: Color(0xff5e5e5e),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "x1",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Frame Naga Barong",
                                    style: TextStyle(
                                      color: Color(0xff5e5e5e),
                                      fontSize: 14,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Jenis Barang ",
                                    style: TextStyle(
                                      color: Color(0xff5e5e5e),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "x1",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kode Pesanan",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                widget.anu.title.toString(),
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Waktu Pembayaran 1",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "5 Nov 1987 13:52",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Waktu Pemesanan",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "5 Nov 1987 13:52",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Waktu Pengiriman",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "5 Nov 1987 13:52",
                                style: TextStyle(
                                  color: Color(0xff5e5e5e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
