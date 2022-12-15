// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:wg_optical/models/kacaMata_item.dart';

class detailItem extends StatefulWidget {
  final KacaMataItem cItem;
  const detailItem({super.key, required this.cItem});

  @override
  State<detailItem> createState() => _detailItemState();
}

class _detailItemState extends State<detailItem> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            // color: Colors.amber,
          ),
          Hero(
              tag: widget.cItem.itemImg.toString(),
              child: Container(
                height: (screenHeight / 2) + 70.0,
                width: screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.cItem.itemImg.toString()),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: 35.0,
              left: 10.0,
              child: Container(
                color: Colors.transparent,
                height: 50.0,
                width: screenWidth - 20.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF14181D),
                            border: Border.all(
                                color: Color(0xFF322B2E), width: 1.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Text(
                      "Name Frame",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Icon(
                          Icons.favorite_rounded,
                          color: Colors.transparent,
                          size: 17.0,
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
              top: 130.0,
              left: 10.0,
              child: Container(
                color: Colors.transparent,
                height: 200.0,
                width: screenWidth - 20.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF14181D),
                            border: Border.all(
                                color: Color(0xFF322B2E), width: 1.0),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 17.0,
                        ),
                      ),
                    ),
                    Text(
                      "Name Frame",
                      style: TextStyle(
                        color: Colors.transparent,
                        fontSize: 25,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                                color: Colors.transparent, width: 1.0),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Transform.rotate(
                          angle: -3.1,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 17.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
            top: screenHeight / 2,
            child: Container(
              width: screenWidth,
              height: 528,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(56),
                  topRight: Radius.circular(56),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Color(0xff020202),
              ),
            ),
          ),
          Positioned(
              top: screenHeight / 2 + 50.0,
              child: Container(
                height: screenHeight / 2 - 60.0,
                width: screenWidth,
                child: ListView(
                  padding: EdgeInsets.only(left: 15.0),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deskripsi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          height: 50.0,
                          width: screenWidth - 30.0,
                          child: Text(
                            'menggunakan bahan alami karet serat yang ada di hutan kalimantan dan di cetak menggunakan cetakan yang dipilih langsung oleh dewa Odinson ex Asgardian dengan desain yang minimalis dan tentunya tidak membuang ciri chas kenyaman dari pengguna ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                        SizedBox(height: 17.0),
                        Text(
                          'Warna',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          width: screenWidth - 30.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildSizeButton('Hitam', 0),
                              _buildSizeButton('Merah', 1),
                              _buildSizeButton('Kuning', 2)
                            ],
                          ),
                        ),
                        SizedBox(height: 80.0),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 50.0,
                                  width: (screenWidth / 2) + 50.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Center(
                                    child: Text('Lanjut',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 17.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.0)
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildSizeButton(String title, int index) {
    return AnimatedContainer(
      duration: Duration(seconds: 4),
      curve: Curves.easeIn,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          height: 40.0,
          width: 100.0,
          decoration: BoxDecoration(
              color: index == selectedIndex ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: index == selectedIndex
                  ? Border.all(
                      color: Colors.white, style: BorderStyle.solid, width: 1.0)
                  : Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 0.2)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.black,
                  fontSize: 15.0),
            ),
          ),
        ),
      ),
    );
  }
}
