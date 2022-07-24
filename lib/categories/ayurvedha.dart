import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:med_station/widgets/widgets.dart';

import 'package:med_station/models/productDetails.dart';

import 'package:http/http.dart' as http;

class Ayurvedha extends StatefulWidget {
  const Ayurvedha({Key? key}) : super(key: key);

  @override
  State<Ayurvedha> createState() => _AyurvedhaState();
}

class _AyurvedhaState extends State<Ayurvedha> {
  bool isLoading = false;
  bool isOrderLoading = true;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
    check();
  }

  Future<void> order(
    String productname,
    String qty,
    String price,
    String composition,
    String category,
    String imgUrl,
    String shopname,
    String Saddress,
    String Whatsapp,
  ) async {
    final storage = new FlutterSecureStorage();
    var number = await storage.read(key: 'username');
    var numfinal = number?.substring(1);
    String location = 'Null, Press Button';
    print(productname);
    //var key1 = keyController.text;
    print("cutfufuggigiigiu");
    var map = new Map<String, dynamic>();
    map['username'] = numfinal;
    map['productname'] = productname;
    map['qty'] = qty;
    map['price'] = price;
    map['composition'] = composition;
    map['category'] = category;
    map['imgUrl'] = imgUrl;
    map['sUsername'] = "user";
    map['shopname'] = shopname;
    map['sAddress'] = Saddress;
    map['whatsappNumber'] = Whatsapp;
    map['orderType'] = "normal";
    map['status'] = "pending";
    // map['password'] = 'password';
    var token2 =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MmFmNmI4ZjdiMTk5ODhjM2MwZDdkOGIiLCJpYXQiOjE2NTU2NjM1MDMsImV4cCI6MTY4MTU4MzUwM30.XFCZc-w2pZURhLNiozjjEYq0rVuykttxmoZ9TjO32j8";

    final response = await http.post(
      Uri.parse('https://projectmedico.herokuapp.com/order/createOrder'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token2',
      },
      encoding: Encoding.getByName("utf-8"),
      body: jsonEncode(map),
    );

    print(response.body);
    var body = response.body;
    /*var data = jsonDecode(response.body) as List;
    print(data);*/

    var index = 0;
    // var snumber = data[index].toString();

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Order Placed'),
      ));
      if (mounted)
        setState(() {
          isOrderLoading = true;
        });
    } else {
      setState(() {
        isOrderLoading = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Sorry, Something went wrong'),
      ));
    }
    /* var rb = response.body;
    var list = json.decode(rb) as List;
    plist = list.map((e) => productDetails.fromJson(e)).toList();

    print(list);

    setState(() {
      plist = plist;
    });*/
  }

  List<productDetails> plist = [];
  Future<void> check() async {
    final storage = new FlutterSecureStorage();
    var number = await storage.read(key: 'username');
    var numfinal = number?.substring(1);
    String location = 'Null, Press Button';

    print("cutfufuggigiigiu");
    var map = new Map<String, dynamic>();
    map['key'] = "Ayurvedha";
    // map['password'] = 'password';
    var token2 =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MmFmNmI4ZjdiMTk5ODhjM2MwZDdkOGIiLCJpYXQiOjE2NTU2NjM1MDMsImV4cCI6MTY4MTU4MzUwM30.XFCZc-w2pZURhLNiozjjEYq0rVuykttxmoZ9TjO32j8";

    final response = await http.post(
      Uri.parse('https://projectmedico.herokuapp.com/products/category'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token2',
      },
      encoding: Encoding.getByName("utf-8"),
      body: jsonEncode(map),
    );

    print(response.body);
    var body = response.body;
    var data = jsonDecode(response.body) as List;
    print(data);

    var index = 0;
    //  var snumber = data[index].toString();

    if (response.statusCode == 200) {
      if (mounted)
        setState(() {
          isLoading = true;
        });
    } else {
      setState(() {
        isLoading = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Sorry, Something went wrong'),
      ));
    }
    var rb = response.body;
    var list = json.decode(rb) as List;
    plist = list.map((e) => productDetails.fromJson(e)).toList();

    print(list);

    setState(() {
      plist = plist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar11(),
      body: SingleChildScrollView(
        child: isLoading
            ? Container(
                child: isOrderLoading
                    ? Container(
                        child: Column(
                          children: [
                            Container(
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: plist.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3,
                                                        child: Image.network(
                                                            plist[index]
                                                                .imgUrl!)),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            plist[index]
                                                                .productname!,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                          ),
                                                          Text(
                                                            plist[index].qty!,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 12),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            plist[index].price!,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .grey[800]),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on,
                                                                color: Colors
                                                                    .grey[800],
                                                                size: 18,
                                                              ),
                                                              Text(
                                                                plist[index]
                                                                    .sAddress!,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            plist[index]
                                                                .status!,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                          TextButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(HexColor(
                                                                          "#003580",
                                                                          1))),
                                                              onPressed:
                                                                  () async {
                                                                setState(() {
                                                                  isOrderLoading =
                                                                      false;
                                                                });
                                                                order(
                                                                  plist[index]
                                                                      .productname
                                                                      .toString(),
                                                                  plist[index]
                                                                      .qty
                                                                      .toString(),
                                                                  plist[index]
                                                                      .price
                                                                      .toString(),
                                                                  plist[index]
                                                                      .composition
                                                                      .toString(),
                                                                  plist[index]
                                                                      .category
                                                                      .toString(),
                                                                  plist[index]
                                                                      .imgUrl
                                                                      .toString(),
                                                                  plist[index]
                                                                      .shopname
                                                                      .toString(),
                                                                  plist[index]
                                                                      .sAddress
                                                                      .toString(),
                                                                  plist[index]
                                                                      .whatsappNumber
                                                                      .toString(),
                                                                );
                                                              },
                                                              child: Text(
                                                                "Order",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ))
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: .5,
                                                  color: Colors.black26,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }))
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.transparent,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: HexColor("#003580", 1),
                            ),
                          ),
                        ),
                      ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: HexColor("#003580", 1),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
