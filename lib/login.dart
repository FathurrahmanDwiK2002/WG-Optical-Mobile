// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, avoid_print, avoid_types_as_parameter_names

import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:wg_optical/home/widget/navbar.dart';
import './env/env.dart';
import 'package:http/http.dart' as http;

class loginPage extends StatelessWidget {
  final _loadHiveProfile = Hive.box('Profile');

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _loadHiveProfile.add(newItem); // update the UI
  }

  void checkAccount({context, email, password}) async {
    EasyLoading.show(status: 'Loading');

    var response = await http.post(
      Uri.parse('${Env.URL_PREFIX}api/loginAPI.php'),
      body: {
        "apikey": "aoi12j1h7dwgopticalw1dggwuawdki",
        "txt_email": email,
        "txt_password": password,
      },
    );

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      String stat;
      if (jsonDecode(response.body)['status'] == 'error') {
        stat = 'Gagal';
      } else {
        stat = 'Berhasil';
        _createItem({
          "id_pegawai": jsonDecode(response.body)['data']['id_pegawai'],
          "nama": jsonDecode(response.body)['data']['nama'],
          "alamat": jsonDecode(response.body)['data']['alamat'],
          "notelepon": jsonDecode(response.body)['data']['notelepon'],
          "urlFoto": jsonDecode(response.body)['data']['urlFoto'],
        });
      }

      ArtSweetAlert.show(
        barrierDismissible: false,
        context: context,
        artDialogArgs: ArtDialogArgs(
            
            type: stat == 'Berhasil'
                ? ArtSweetAlertType.success
                : ArtSweetAlertType.danger,
            title: stat,
            onConfirm: () {
              stat == 'Berhasil'
                  ? Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: ((context) => navbar()),
                      ),
                      (route) => false)
                  : Navigator.of(context).pop();
            },
            text: jsonDecode(response.body)['msg']),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 337,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(129.5),
                        bottomRight: Radius.circular(129.5),
                      ),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "img/logo.png",
                            fit: BoxFit.fill,
                            height: 100,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Login to Wg Optical',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Masukkan Email dan Password ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(11),
                        topRight: Radius.circular(11),
                        bottomLeft: Radius.circular(11),
                        bottomRight: Radius.circular(11),
                      ),
                      color: Color.fromRGBO(162, 162, 162, 0.30000001192092896),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: emailController,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(11),
                        topRight: Radius.circular(11),
                        bottomLeft: Radius.circular(11),
                        bottomRight: Radius.circular(11),
                      ),
                      color: Color.fromRGBO(162, 162, 162, 0.30000001192092896),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          width: double.infinity,
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(6, 6),
                                  blurRadius: 10)
                            ],
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: TextButton(
                            onPressed: () => checkAccount(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Column(
                          children: [
                            Text(
                              'Copyright @2022 Waluyo Group IT Team.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'All Right Reserved',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
