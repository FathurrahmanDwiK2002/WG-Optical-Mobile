// ignore_for_file: unnecessary_import, implementation_imports, duplicate_import, camel_case_types, unused_field, file_names, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:wg_optical/models/warna.dart';
import 'package:wg_optical/pesanan_saya/slideFramePesanan/Kirim.dart';
import 'package:wg_optical/pesanan_saya/slideFramePesanan/Produksi.dart';
import 'package:wg_optical/pesanan_saya/slideFramePesanan/Selesai.dart';

class pesananSaya extends StatefulWidget {
  const pesananSaya({super.key});

  @override
  State<pesananSaya> createState() => _pesananSayaState();
}

class _pesananSayaState extends State<pesananSaya>
    with TickerProviderStateMixin {
  int counter = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    Produksi(),
    Kirim(),
    Selesai()
  ];
  var anu = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
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
      backgroundColor: color1,
      elevation: 0,
      toolbarHeight: 0,
    );

    final heightPhone = screenHeight -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: color1,
      appBar: appbar,
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: 80,
                  width: screenWidth,
                  // color: Colors.amber,
                ),
                Positioned(
                    top: 10.0,
                    left: 10.0,
                    child: Container(
                      color: Colors.transparent,
                      // height: 50.0,
                      width: screenWidth - 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              "Pesanan Saya",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: "Montserrat-Bold",
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    )),
              ],
            ),
          ),
          // Container(
          //   width: screenWidth / 3,
          //   height: 44,
          //   child: TabBar(controller: tabController, tabs: [
          //     Container(
          //       child: Row(
          //         children: [
          //           Center(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   "Diproses",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 15.0,
          //                     fontWeight: FontWeight.w600,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 Container(
          //                   width: 27,
          //                   height: 15,
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(7),
          //                     color: Color(0xffff0000),
          //                   ),
          //                   child: Center(
          //                     child: Text(
          //                       "10",
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 11,
          //                         fontFamily: "Montserrat",
          //                         fontWeight: FontWeight.w600,
          //                       ),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     )
          //   ]),
          // ),
          Container(
        
            width: screenWidth - 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSizeButton('Diproses', 0),
                _buildSizeButton('Dikirim', 1),
                _buildSizeButton('Konfirmasi', 2)
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                ),
              ],
            ),
          ),
          SizedBox(
            height: heightPhone * 0.02,
          ),
          Container(
            child: _widgetOptions.elementAt(counter),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeButton(String title, int index) {
    return AnimatedContainer(
      duration: Duration(seconds: 10),
      curve: Curves.easeIn,
      child: GestureDetector(
        onTap: () {
          setState(() {
            counter = index;
          });
          print(index);
        },
        child: Container(
          height: 60.0,
            
          // color: Colors.amber,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'MontSerrat',
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 27,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xffff0000),
                        ),
                        child: Center(
                          child: Text(
                            "10",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(flex: 3, child: Container()),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: index == counter
                            ? Colors.white
                            : Colors.transparent),
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
