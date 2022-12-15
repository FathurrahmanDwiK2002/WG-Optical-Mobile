// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wg_optical/pesanan_saya/screen/detailPesanan.dart';

import '../../models/kacaMata_item.dart';

class Produksi extends StatefulWidget {
  const Produksi({super.key});

  @override
  State<Produksi> createState() => _ProduksiState();
}

class _ProduksiState extends State<Produksi> {
  final List<KacaMataItem> listKacaMata = [
    KacaMataItem(
        Waktu: 'Riski Doer',
        title: '#TR7268909',
        subtitle:
            'Jl. Mastrip, Krajan Timur, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur 68121'),
    KacaMataItem(
        Waktu: 'Rizal Sakne',
        title: '#TR7265009',
        subtitle:
            'Jl. Mastrip, Krajan Timur, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur 68121'),
    KacaMataItem(
        Waktu: 'Agung Doer',
        title: '#TR7265486',
        subtitle:
            'Jl. Mastrip, Krajan Timur, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur 68121'),
    KacaMataItem(
        Waktu: 'Najib Sakne',
        title: '#TR7265675',
        subtitle:
            'Jl. Mastrip, Krajan Timur, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur 68121')
  ];

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
    return Container(
      width: screenWidth,
      height: heightPhone * 0.62,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...listKacaMata.map((e) {
            return _listkacamata(e);
          }).toList()
        ],
      ),
    );
// Container(
//         // color: Colors.blue,
//         height: (MediaQuery.of(context).size.height / 2) - 10.0,
//         width: MediaQuery.of(context).size.width,
//         child: ListView(
//           padding: EdgeInsets.only(top: 25.0),
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                 left: 15.0,
//                 right: 15.0,
//               ),
//               child: Container(
//                 // color: Colors.amber,
//                 width: MediaQuery.of(context).size.width - 10.0,
//                 height: 500.0,
//                 child: ListView(
//                   scrollDirection: Axis.vertical,
//                   children: [
//                     ...listKacaMata.map((e) {
//                       return _listkacamata(e);
//                     }).toList()
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ));
  }

  Widget _listkacamata(KacaMataItem cItem) {
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
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => detailPesanan(anu: cItem)));
          // print(cItem.title.toString());
        },
        child: Container(
          width: 200,
          height: 188,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
            color: Colors.white,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          cItem.title!,
                          style: TextStyle(
                            color: Color(0xff5e5e5e),
                            fontSize: 13,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "5 Nov 1987 13:52",
                          style: TextStyle(
                            color: Color(0xff5e5e5e),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth * 0.17,
                    ),
                    Container(
                      width: screenWidth * 0.26,
                      height: 26,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: Color(0xff5e5e5e),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Diproses",
                          style: TextStyle(
                            color: Color(0xff5e5e5e),
                            fontSize: 11,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: heightPhone * 0.018,
                ),
                Container(
                  width: screenWidth * 0.9,
                  height: 1,
                  color: Color(0x3f5e5e5e),
                ),
                SizedBox(
                  height: heightPhone * 0.018,
                ),
                Text(
                  cItem.Waktu!,
                  style: TextStyle(
                    color: Color(0xff5e5e5e),
                    fontSize: 15,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: heightPhone * 0.007,
                ),
                Container(
                  width: screenWidth * 0.7,
                  child: Text(
                    cItem.subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff5e5e5e),
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: heightPhone * 0.018,
                ),
                Container(
                  width: screenWidth * 0.9,
                  height: 1,
                  color: Color(0x195e5e5e),
                ),
                SizedBox(
                  height: heightPhone * 0.018,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Color(0xff5e5e5e),
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          "Rp.560.000",
                          style: TextStyle(
                            color: Color(0xff5e5e5e),
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
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
      ),
    );
    // return Padding(
    //   padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5),
    //   child: GestureDetector(
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(15.0),
    //       ),
    //       height: 30.0,
    //       width: 150.0,
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.only(left: 10.0),
    //             child: Text(
    //               cItem.subtitle!,
    //               style: TextStyle(
    //                   fontFamily: "Montserrat",
    //                   color: Colors.black,
    //                   fontSize: 15.0),
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(left: 40.0),
    //             child: Text(
    //               cItem.title!,
    //               style: TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 15.0,
    //                 fontFamily: "Montserrat",
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(left: 80.0),
    //             child: Text(
    //               cItem.Waktu!,
    //               style: TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 15.0,
    //                 fontFamily: "Montserrat",
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
