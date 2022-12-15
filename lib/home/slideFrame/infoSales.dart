// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, implementation_imports, camel_case_types, non_constant_identifier_names, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:wg_optical/models/warna.dart';

import '../../models/kacaMata_item.dart';

class infoSales extends StatefulWidget {
  const infoSales({super.key});

  @override
  State<infoSales> createState() => _infoSalesState();
}

class _infoSalesState extends State<infoSales> {
  final List<KacaMataItem> penghasilan = [
    KacaMataItem(
        itemImg: 'Rp. 1.000.000',
        title: 'Penghasilan',
        subtitle: 'Perhitingan penghasilan untuk periode 1 pada bulan ini'),
  ];
  final List<KacaMataItem> Target = [
    KacaMataItem(
        itemImg: 'Target Sales',
        title: 'Pesanan dalam pengiriman',
        subtitle: '30',
        title2: 'Pesanan selesai',
        subtitle2: '15'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: screenHeight * 0.29,
        width: screenWidth * 1,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...penghasilan.map((e) {
              return _penghasilan(e);
            }).toList(),
            ...Target.map((e) {
              return _target(e);
            }).toList(),
          ],
        ));
  }

  Widget _penghasilan(KacaMataItem cItem) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              color: color3),
          height: 225.0,
          width: (MediaQuery.of(context).size.width / 2) + 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 40),
                child: Text(
                  cItem.title!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 20, right: 100),
                child: Text(
                  cItem.subtitle!,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 12.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, bottom: 5.0),
                child: Text(
                  cItem.itemImg!,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 30.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _target(KacaMataItem cItem) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0, top: 20, right: 23, bottom: 10),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              color: color3),
          height: 225.0,
          width: (MediaQuery.of(context).size.width / 2) + 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 40),
                child: Text(
                  cItem.itemImg!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 + 10,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pesanan dalam pengiriman",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "30",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Transform.rotate(
                      angle: 1.57,
                      child: Container(
                        width: 41,
                        height: 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pesanan selesai ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "15",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
