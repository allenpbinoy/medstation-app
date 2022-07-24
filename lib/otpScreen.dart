import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:med_station/createUserScreen.dart';
import 'package:med_station/tabScreen.dart';
import 'package:med_station/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = new TextEditingController();
  bool isLoading = true;
  Future<void> send() async {
    // This will be sent as form data in the post requst
    String otp = otpController.text;
    print(otp);
    print("cutfufuggigiigiu");
    var map = new Map<String, dynamic>();
    map['phoneNumber'] = '+917994918838';
    map['code'] = otp;

    final response = await http.post(
      Uri.parse('https://projectmedico.herokuapp.com/users/verify'),
      body: map,
    );

    print(response.body);
    var data = jsonDecode(response.body);
    var token = data["token"];
    var username = data["username"];
    // print(token);
    //print(username);

// Create storage
    final storage = new FlutterSecureStorage();

// Write value
    await storage.write(key: 'jwt', value: token);
    await storage.write(key: 'username', value: username);

    var value = await storage.read(key: 'username');

    print(value);
    /*  final storage = new FlutterSecureStorage();
    await storage.write(key: "token", value: "hbgyhgvyhg");
    String value = await storage.read(key: "token");
    print(value);*/

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('OTP verification successfull'),
      ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CreateUserScreen()),
      );
      setState(() {
        isLoading = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Sorry, Something went wrong.'),
      ));
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#003580", 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: Container(
                            width: 200,
                            height: 300,
                            child: Image.asset(
                              "image/3.png",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Confirm OTP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Code is send to +919061950370",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              child: TextField(
                                maxLength: 6,
                                controller: otpController,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                    counterText: '',
                                    isDense: true,
                                    prefixIcon: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Icon(
                                          Icons.message,
                                          color: HexColor("#003580", 1),
                                        )),
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 3.0, horizontal: 5.0),
                                    // border: InputBorder.none,
                                    border: new OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        new TextStyle(color: Colors.grey[600]),
                                    hintText: "xxxxxx",
                                    fillColor: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 130,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "By signing up you accept our terms of service and",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              " policy.",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            isLoading
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 45,
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        send();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "Verify",
                                          style: TextStyle(
                                            color: HexColor("#003580", 1),
                                          ),
                                        ),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white)),
                                    ),
                                  )
                                : CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
