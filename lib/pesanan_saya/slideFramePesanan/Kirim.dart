import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../models/kacaMata_item.dart';

class Kirim extends StatefulWidget {
  const Kirim({super.key});

  @override
  State<Kirim> createState() => _KirimState();
}

class _KirimState extends State<Kirim> {
  final List<KacaMataItem> listKacaMata = [
    KacaMataItem(Waktu: 'Riski Doer', title: '#TR7265486', subtitle: '1'),
    KacaMataItem(Waktu: 'Rizal Sakne', title: '#TR7265400', subtitle: '2')
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: screenHeight / 2 + 110,
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
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: GestureDetector(
        child: Container(
          width: 368,
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
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Pesanan",
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
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 340,
                  height: 1,
                  color: Color(0x3f5e5e5e),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  cItem.title!,
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
                  children: [
                    Text(
                      "Dengan nama Customer : ",
                      style: TextStyle(
                        color: Color(0xff5e5e5e),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      cItem.Waktu!,
                      style: TextStyle(
                        color: Color(0xff5e5e5e),
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 340,
                  height: 1,
                  color: Color(0x195e5e5e),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Harga Jual",
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
                    Container(
                      width: 94,
                      height: 26,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xff0065ff),
                      ),
                      child: Center(
                        child: TextButton(
                          child: Text(
                            "Foto Bukti",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(56),
                                    topRight: Radius.circular(56),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                  ),
                                  color: Color(0xffc9cbca),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: 45,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: Color(0xff5e5e5e),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                                  2 -
                                              390,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                                  2 -
                                              100,
                                      width: MediaQuery.of(context).size.width /
                                              2 +
                                          100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                                  2 -
                                              390,
                                    ),
                                    Container(
                                      width: 94,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Color(0xff0065ff),
                                      ),
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Kirim",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                            print('object');
                          },
                        ),
                      ),
                    )
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
