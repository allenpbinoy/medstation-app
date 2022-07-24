import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_station/models/VendorModel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:med_station/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  @override
  void initState() {
    super.initState();
    check();
  }

  List<vendorModel> plist = [];

  uploadImage() async {
    print(uploading);
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile? image;

    await Permission.photos.request();
    var permmissionStatus = await Permission.photos.status;

    if (permmissionStatus.isGranted) {
      print("permission granted");
      var uuid = Uuid();
      //print();
      var imgId = uuid.v1();
      // ignore: deprecated_member_use
      image = (await _picker.getImage(
          source: ImageSource.gallery, imageQuality: 50));
      var file = File(image!.path);
      var snapshot = await _storage.ref().child("$imgId/item").putFile(file);
      final storage = new FlutterSecureStorage();
      var downloadUrl = await snapshot.ref.getDownloadURL();
      await storage.write(key: 'imageUrl', value: downloadUrl);
      var value1 = await storage.read(key: 'imageUrl');
      var value2 = await storage.read(key: 'location');
      print(value2);
      print(value1);
      setState(() {
        imageUrl = downloadUrl;
        uploading = true;
        imageid = imgId;
        //_uploadSuccess = true;
        print(imageUrl);
        print(uploading);
        print(imageid);
      });
    } else {
      print("permission denied");
    }
  }

  Future<void> order(String shopname, String Whatsapp) async {
    final storage = new FlutterSecureStorage();
    var number = await storage.read(key: 'username');
    var numfinal = number?.substring(1);
    String location = 'Null, Press Button';
    // print(productname);
    //  var key1 = keyController.text;
    print("cutfufuggigiigiu");
    var map = new Map<String, dynamic>();
    map['username'] = numfinal;
    map['productname'] = "nil";
    map['qty'] = "nil";
    map['price'] = "nil";
    map['composition'] = "nil";
    map['category'] = 'nil';
    map['imgUrl'] = imageUrl;
    map['sUsername'] = "user";
    map['shopname'] = shopname;
    map['sAddress'] = "Saddress";
    map['whatsappNumber'] = Whatsapp;
    map['orderType'] = "prescription";
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

    final response = await http.get(
      Uri.parse('https://projectmedico.herokuapp.com/vendor/getVendor'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token2',
      },
      /*encoding: Encoding.getByName("utf-8"),
      body: jsonEncode(map),*/
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
    plist = list.map((e) => vendorModel.fromJson(e)).toList();

    print(list);
  }

  var imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/mullonkalhardwares-a8472.appspot.com/o/placeholder%2Fplaceholder-image.png?alt=media&token=e9738ca3-c35e-4343-bf1a-d80790a56f90";
  bool uploading = false;
  var imageid = "aa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar8(),
      body: SingleChildScrollView(
          child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                uploadImage();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(HexColor("#003580", 1))),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: .1),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.upload,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Upload Presciption",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
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
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text("Nearby Shops",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[800])),
          ),
          Container(
              child: Column(
            children: [
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: plist.length,
                  itemBuilder: (context, index) {
                    return Row(children: [
                      Image.network(
                        plist[index].image!,
                        width: 60,
                        height: 60,
                      ),
                      Text(
                        plist[index].shopName!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  HexColor("#003580", 1))),
                          onPressed: () {
                            order(plist[index].shopName!,
                                plist[index].whatsappNumber!);
                          },
                          child: Text("Order")),
                    ]);
                  })
            ],
          )),
        ]),
      )),
    );
  }
}
