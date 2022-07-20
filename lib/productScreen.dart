import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:med_station/models/productDetails.dart';
import 'package:med_station/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  final String id;

  ProductScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    check();
  }

  var productname = "productname";
  var qty = "qty";
  var price = "price";
  var status = "status";
  var shopname = "shopname";
  var shopaddress = "shoppaddress";
  var phonenumber = "phonenumber";
  var composition = "comp";
  var img =
      " https://firebasestorage.googleapis.com/v0/b/mullonkalhardwares-a8472.appspot.com/o/placeholder%2Fplaceholder-image.png?alt=media&token=e9738ca3-c35e-4343-bf1a-d80790a56f90";
  List<productDetails> plist = [];
  Future<void> check() async {
    final storage = new FlutterSecureStorage();
    var number = await storage.read(key: 'username');
    var numfinal = number?.substring(1);

    print(number);
    print(numfinal);
    print("cutfufuggigiigiu");
    var map = new Map<String, dynamic>();
    map['id'] = widget.id;
    print(widget.id);
    // map['password'] = 'password';
    var token2 =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MmFmNmI4ZjdiMTk5ODhjM2MwZDdkOGIiLCJpYXQiOjE2NTU2NjM1MDMsImV4cCI6MTY4MTU4MzUwM30.XFCZc-w2pZURhLNiozjjEYq0rVuykttxmoZ9TjO32j8";

    final response = await http.post(
      Uri.parse('https://projectmedico.herokuapp.com/products/getProduct'),
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
    /* var sname = "jj";
    sname = data['username']*/

    // ignore: unused_local_variable
    var index = 0;
    var snumber = data[index].toString();

    /*vendorModel vendormodel = vendorModel.fromJson(data);
    print(vendormodel.shopName);*/

    // Create storage

    // Write value

    var rb = response.body;
    var list = json.decode(rb) as List;
    plist = list.map((e) => productDetails.fromJson(e)).toList();

    print(list);

    setState(() {
      plist = plist;
    });

    var pname = plist[index].productname;
    //print(sname);
    var qty1 = plist[index].qty;
    var price1 = plist[index].price;
    var composition = plist[index].composition;
    var saddress = plist[index].sAddress;
    var shopname1 = plist[index].shopname;
    var composit = plist[index].composition;
    var status1 = plist[index].status;
    var pn = plist[index].whatsappNumber;
    var im = plist[index].imgUrl;
    setState(() {
      productname = pname!;
      qty = qty1!;
      price = price1!;
      status = status1!;
      shopname = shopname1!;
      shopaddress = saddress!;
      phonenumber = pn!;
      composition = composit!;
      img = im!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Container(
                      child: Image.network(
                          "https://onemg.gumlet.io/image/upload/a_ignore,w_380,h_380,c_fit,q_auto,f_auto/v1600085129/cropped/mu5bahqxfrp28cut6que.jpg"),
                      height: 400,
                      width: 600,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        img,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        qty,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey[800]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        composition,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        composition,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 10,
                color: Colors.grey[200],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        status,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.green),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey[800],
                            size: 18,
                          ),
                          Text(
                            shopname + " ," + shopaddress,
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Contact",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_android,
                            color: Colors.grey[800],
                            size: 18,
                          ),
                          Text(
                            phonenumber,
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.message,
                            color: Colors.grey[800],
                            size: 18,
                          ),
                          Text(
                            phonenumber,
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: HexColor("#003580", 1),
                              border: Border.all(
                                width: 4,
                                color: HexColor("#003580", 1),
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90,
                                ),
                                Icon(
                                  CupertinoIcons.shopping_cart,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Center(
                                    child: Text("REQUEST DELIVERY",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white)))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 10,
                color: Colors.grey[200],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
