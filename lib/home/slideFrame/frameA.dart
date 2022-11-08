import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../models/kacaMata_item.dart';
import '../screens/detailFrame.dart';

class frameA extends StatefulWidget {
  const frameA({super.key});

  @override
  State<frameA> createState() => _frameAState();
}

class _frameAState extends State<frameA> {
  final List<KacaMataItem> listKacaMata = [
    KacaMataItem(
        itemImg: 'img/2.PNG',
        title: 'Nama Frame',
        subtitle: 'asjnfkjnefkajns asnlfkjans snfasndas,mdajs'),
    KacaMataItem(
        itemImg: 'img/3.PNG',
        title: 'Nama Frame',
        subtitle: 'asjnfkjnefkajns asnlfkjans snfasndas,mdajs'),
    KacaMataItem(
        itemImg: 'img/2.PNG',
        title: 'Nama Frame',
        subtitle: 'asjnfkjnefkajns asnlfkjans snfasndas,mdajs'),
    KacaMataItem(
        itemImg: 'img/3.PNG',
        title: 'Nama Frame',
        subtitle: 'asjnfkjnefkajns asnlfkjans snfasndas,mdajs')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: (MediaQuery.of(context).size.height / 2) + 100,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ...listKacaMata.map((e) {
              return _listkacamata(e);
            }).toList()
          ],
        ));
  }

  Widget _listkacamata(KacaMataItem cItem) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 225.0,
        top: 20,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => detailItem(cItem: cItem)));
          print(cItem);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: Colors.white),
          height: 225.0,
          width: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Hero(
                        tag: cItem.itemImg.toString(),
                        child: Container(
                          height: 120.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(cItem.itemImg!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  cItem.title!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Text(
                  cItem.subtitle!,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 10.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 110.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //To Do
                      },
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFD17741),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 11.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
