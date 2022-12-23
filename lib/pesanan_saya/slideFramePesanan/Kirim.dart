// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wg_optical/pesanan_saya/screen/detailPesanan.dart';

import '../../models/kacaMata_item.dart';

class Kirim extends StatefulWidget {
  const Kirim({super.key});

  @override
  State<Kirim> createState() => _KirimState();
}

class _KirimState extends State<Kirim> {
  File? image;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePick =
        await _picker.pickImage(source: ImageSource.camera);
    image = File(imagePick!.path);
  }

  final List<KacaMataItem> listKacaMata = [
    KacaMataItem(
        Waktu: 'Riski Doer',
        title: '#TR7265486',
        subtitle:
            'Jl. Mastrip, Krajan Timur, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur 68121'),
    KacaMataItem(
        Waktu: 'Rizal Sakne',
        title: '#TR7265400',
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
                      width: screenWidth * 0.028,
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
                            fontFamily: "Montserrat-Bold",
                            
                          ),
                        ),
                        Text(
                          "5 Nov 1987 13:52",
                          style: TextStyle(
                            fontFamily: 'Montserrat-SemiBold',
                            color: Color(0xff5e5e5e),
                            fontSize: 12,
                          ),
                        ),
                      ],
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
                    fontFamily: "Montserrat-Bold",
                    
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
                      fontFamily: 'Montserrat',
                      color: Color(0xff5e5e5e),
                      fontSize: 12,
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
                            fontFamily: 'Montserrat',
                            color: Color(0xff5e5e5e),
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          "Rp.560.000",
                          style: TextStyle(
                            color: Color(0xff5e5e5e),
                            fontSize: 12,
                            fontFamily: "Montserrat-SemiBold",
                          ),
                        ),
                      ],
                    ),
                    Container(
                      
                      height: 26,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xff0065ff),
                      ),
                      child: TextButton(
                        child: Text(
                          "Foto Bukti",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontFamily: "Montserrat-SemiBold",
                          ),
                        ),
                        onPressed: () async {
                          await getImage();
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
                                    child: Center(
                                        child: Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    )),
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
                                            fontFamily: "Montserrat-SemiBold",
                                        
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
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
  }
}
