import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:med_station/models/productDetails.dart';
import 'package:med_station/productScreen.dart';
import 'package:med_station/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    check();
  }

  final storage = new FlutterSecureStorage();

  TextEditingController keyController = new TextEditingController();
  String qAddress = 'search';
  var location = "loc";
  String printLoc = "Get Current Location";
  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    qAddress =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  List<productDetails> plist = [];
  Future<void> check() async {
    final storage = new FlutterSecureStorage();
    var number = await storage.read(key: 'username');
    var numfinal = number?.substring(1);
    String location = 'Null, Press Button';

    var key1 = keyController.text;
    print("cutfufuggigiigiu");
    var map = new Map<String, dynamic>();
    map['username'] = numfinal;
    // map['password'] = 'password';
    var token2 =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MmFmNmI4ZjdiMTk5ODhjM2MwZDdkOGIiLCJpYXQiOjE2NTU2NjM1MDMsImV4cCI6MTY4MTU4MzUwM30.XFCZc-w2pZURhLNiozjjEYq0rVuykttxmoZ9TjO32j8";

    final response = await http.get(
      Uri.parse('https://projectmedico.herokuapp.com/products/getProducts'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token2',
      },
      /* encoding: Encoding.getByName("utf-8"),
      body: jsonEncode(map),*/
    );

    print(response.body);
    var body = response.body;
    var data = jsonDecode(response.body) as List;
    print(data);

    var index = 0;
    var snumber = data[index].toString();

    var rb = response.body;
    var list = json.decode(rb) as List;
    plist = list.map((e) => productDetails.fromJson(e)).toList();

    print(list);

    setState(() {
      plist = plist;
    });
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
    var key1 = keyController.text;
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

    var rb = response.body;
    var list = json.decode(rb) as List;
    plist = list.map((e) => productDetails.fromJson(e)).toList();

    print(list);

    setState(() {
      plist = plist;
    });
  }

  Future<void> search() async {
    final storage = new FlutterSecureStorage();
    var number = await storage.read(key: 'username');
    var numfinal = number?.substring(1);

    print(number);
    print(numfinal);
    print("cutfufuggigiigiu");
    var key1 = keyController.text;
    var map = new Map<String, dynamic>();
    map['key'] = key1;

    // map['password'] = 'password';
    var token2 =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MmFmNmI4ZjdiMTk5ODhjM2MwZDdkOGIiLCJpYXQiOjE2NTU2NjM1MDMsImV4cCI6MTY4MTU4MzUwM30.XFCZc-w2pZURhLNiozjjEYq0rVuykttxmoZ9TjO32j8";

    final response = await http.post(
      Uri.parse('https://projectmedico.herokuapp.com/products/search'),
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
    //var snumber = data[index].toString();

    var rb = response.body;
    var list = json.decode(rb) as List;
    plist = list.map((e) => productDetails.fromJson(e)).toList();

    print(list);

    setState(() {
      plist = plist;
    });
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getloc() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    GetAddressFromLatLong(position);
    print(location);
    await storage.write(key: 'location', value: location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar7(),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 10,
                        right: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: Colors.amber,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Container(
                          height: 50,
                          child: TextField(
                            controller: keyController,
                            decoration: new InputDecoration(
                                isDense: true,
                                prefixIcon: Icon(Icons.search),
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 5.0),
                                // border: InputBorder.none,
                                border: new OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                                filled: true,
                                hintStyle:
                                    new TextStyle(color: Colors.grey[800]),
                                hintText: "search medicine",
                                fillColor: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 5),
                      child: Card(
                        child: ElevatedButton(
                          onPressed: () {
                            getloc();
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: .1),
                                borderRadius: BorderRadius.circular(3)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_searching,
                                    color: Colors.blue[600],
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Get Current Location",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.5),
                      child: ElevatedButton(
                        onPressed: () {
                          search();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                "Search",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                HexColor("#003580", 1))),
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                height: 10,
                color: Colors.grey[200],
              ),
              Container(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: plist.length,
                      itemBuilder: (context, index) {
                        return new GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                  id: plist[index].iId.toString(),
                                ),
                              )),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Image.network(
                                                plist[index].imgUrl!)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                plist[index].productname!,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                plist[index].qty!,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                plist[index].price!,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.grey[800]),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: Colors.grey[800],
                                                    size: 18,
                                                  ),
                                                  Text(
                                                    plist[index].sAddress!,
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                plist[index].status!,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.green),
                                              ),
                                              TextButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(HexColor(
                                                                  "#003580",
                                                                  1))),
                                                  onPressed: () async {
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
                                                        color: Colors.white),
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
                          ),
                        );
                      }))
            ],
          ),
        ),
      )),
    );
  }
}
