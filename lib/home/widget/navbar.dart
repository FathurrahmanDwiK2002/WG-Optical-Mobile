import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wg_optical/home/component/dasboard.dart';
import 'package:wg_optical/models/warna.dart';
import 'package:wg_optical/page_profile/profile.dart';
import 'package:wg_optical/pesanan_saya/pesananSaya.dart';
import 'package:wg_optical/riwayat/page_riwayat.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> with TickerProviderStateMixin {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    dasboard(),
    pesananSaya(),
    riwayat(),
    profile()
  ];
  var currentIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        child: Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(currentIndex),
      ),
      backgroundColor: color3,
      bottomNavigationBar: Container(
        height: 80,
        width: 100,
        decoration: BoxDecoration(
          color: color2,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(0),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .0765),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                print(index);
                // HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.white,
            highlightColor: Colors.black,
            child: Stack(
              children: [
                SizedBox(
                  width: screenWidth * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? screenWidth * .10 : 0,
                      width: index == currentIndex ? screenWidth * .1500 : 0,
                      decoration: BoxDecoration(
                        color:
                            index == currentIndex ? color3 : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * .2125,
                  alignment: Alignment.center,
                  child: Icon(
                    listOfIcons[index],
                    size: screenWidth * .06,
                    color: index == currentIndex ? color2 : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.percent,
    Icons.receipt_long,
    Icons.person_rounded,
  ];
}
