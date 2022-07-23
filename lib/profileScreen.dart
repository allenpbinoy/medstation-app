import 'package:flutter/material.dart';
import 'package:med_station/models/customerDetails.dart';
import 'package:med_station/widgets/widgets.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<customerDetails> plist = [];
  String shopname = "customername";
  String phonenumber = "+91123456789";
  String address = "Address here";

  @override
  void initState() {
    super.initState();
    check();
  }

  Future<void> check() async {
    final storage = new FlutterSecureStorage();
    var number = await storage.read(key: 'username');
    var numfinal = number?.substring(1);

    print(number);
    print(numfinal);
    print("cutfufuggigiigiu");
    var map = new Map<String, dynamic>();
    map['username'] = numfinal;
    // map['password'] = 'password';
    var token2 =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MmFmNmI4ZjdiMTk5ODhjM2MwZDdkOGIiLCJpYXQiOjE2NTU2NjM1MDMsImV4cCI6MTY4MTU4MzUwM30.XFCZc-w2pZURhLNiozjjEYq0rVuykttxmoZ9TjO32j8";
    print(jsonEncode(map));
    final response = await http.post(
      Uri.parse('https://projectmedico.herokuapp.com/customers/getCustomer'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token2',
      },
      encoding: Encoding.getByName("utf-8"),
      body: jsonEncode(map),
    );

    print(response.body);
    var body = response.body;
    //var data = jsonDecode(response.body) as List;
    //print(data);
    /* var sname = "jj";
    sname = data['username']*/

    // ignore: unused_local_variable
    var index = 0;
    //var snumber = data[index].toString();

    /*vendorModel vendormodel = vendorModel.fromJson(data);
    print(vendormodel.shopName);*/

    // Create storage

    // Write value

    var rb = response.body;
    var list = json.decode(rb) as List;
    plist = list.map((e) => customerDetails.fromJson(e)).toList();

    print(list);

    if (mounted)
      setState(() {
        plist = plist;
      });

    var sname = plist[index].customername;
    print(sname);
    var snumber1 = plist[index].phoneNumber;
    var saddress = plist[index].cAddress;
    setState(() {
      shopname = sname!;
      phonenumber = snumber1!;
      address = saddress!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar3(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                color: HexColor("#003580", 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "My Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.amber, width: 2)),
                            child: Icon(
                              Icons.account_circle_rounded,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  shopname,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  phonenumber,
                                  style: TextStyle(
                                      color: Colors.amber, fontSize: 14),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your Address",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.grey[800])),
                            SizedBox(
                              height: 10,
                            ),
                            Text(address,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[800])),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: .2,
                                color: Colors.grey[800]),
                            Row(
                              children: [
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "Change",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    HexColor("#003580", 1),
                                  )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
