import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:med_station/tabScreen.dart';
import 'package:med_station/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController watController = new TextEditingController();
  TextEditingController addrController = new TextEditingController();
  final storage = new FlutterSecureStorage();

  Future<void> send() async {
    var cname = nameController.text;
    var cAddress = addrController.text;
    var wnumber = watController.text;
    //var sLocation = await storage.read(key: 'location');
    // This will be sent as form data in the post requst
    // String number = "+91" + noController.text;
    // print(number);
    var number = await storage.read(key: 'username');
    print("cutfufuggigiigiu");
    var map = new Map<String, dynamic>();
    map['username'] = number;
    map['customername'] = cname;
    map['cAddress'] = cAddress;
    map['phoneNumber'] = number;

    // map['password'] = 'password';
    var token = await storage.read(key: "token");
    var token2 =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MmFmNmI4ZjdiMTk5ODhjM2MwZDdkOGIiLCJpYXQiOjE2NTU2NjM1MDMsImV4cCI6MTY4MTU4MzUwM30.XFCZc-w2pZURhLNiozjjEYq0rVuykttxmoZ9TjO32j8";
    final response = await http.post(
      Uri.parse('https://projectmedico.herokuapp.com/customers/createCustomer'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token2',
      },
      encoding: Encoding.getByName("utf-8"),
      body: jsonEncode(map),
    );

    print(response.body);
    var body = response.body;
    if (body != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#003580", 1),
      appBar: AppBar6(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              color: HexColor("#003580", 1),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 36,
                          color: Colors.white),
                    ),
                    Text(
                      "Enter your details and go forward.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      controller: nameController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          isDense: true,
                          prefixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Icon(
                                  CupertinoIcons.person_alt,
                                  color: HexColor("#003580", 1),
                                ),
                              )),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 5.0),
                          // border: InputBorder.none,

                          border: new OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          hintText: "Full Name",
                          fillColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      controller: watController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          isDense: true,
                          prefixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                '+91 ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: HexColor("#003580", 1),
                                ),
                              )),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 5.0),
                          // border: InputBorder.none,

                          border: new OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          hintText: "Whatsapp Number",
                          fillColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    height: 150,
                    child: TextField(
                      controller: addrController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: new InputDecoration(
                          isDense: true,
                          prefixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Icon(
                                  CupertinoIcons.home,
                                  color: HexColor("#003580", 1),
                                ),
                              )),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 5.0),
                          // border: InputBorder.none,

                          border: new OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          hintText: "Full Address",
                          fillColor: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    send();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: HexColor("#003580", 1),
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
