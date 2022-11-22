import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    KacaMataItem(Waktu: 'Riski Doer', title: '#TR7268909', subtitle: '1'),
    KacaMataItem(Waktu: 'Rizal Sakne', title: '#TR7265009', subtitle: '2'),
    KacaMataItem(Waktu: 'Agung Doer', title: '#TR7265486', subtitle: '3'),
    KacaMataItem(Waktu: 'Najib Sakne', title: '#TR7265675', subtitle: '4')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: (MediaQuery.of(context).size.height / 2) - (-70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                width: 65,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Kode Pesanan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                width: 150,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Nama Customer",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                width: 145,
              )
            ],
          ),
          Container(
              height: (MediaQuery.of(context).size.height / 2) - 50.0,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                padding: EdgeInsets.only(top: 25.0),
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 10.0,
                      height: 500.0,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          ...listKacaMata.map((e) {
                            return _listkacamata(e);
                          }).toList()
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _listkacamata(KacaMataItem cItem) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => detailPesanan(anu: cItem)));
          // print(cItem.title.toString());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          height: 30.0,
          width: 150.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  cItem.subtitle!,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black,
                      fontSize: 15.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  cItem.title!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 80.0),
                child: Text(
                  cItem.Waktu!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
