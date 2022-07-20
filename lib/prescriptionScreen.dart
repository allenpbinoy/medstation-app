import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  var imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/mullonkalhardwares-a8472.appspot.com/o/placeholder%2Fplaceholder-image.png?alt=media&token=e9738ca3-c35e-4343-bf1a-d80790a56f90";
  bool uploading = false;
  var imageid = "aa";

  /* uploadImage() async {
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

      var downloadUrl = await snapshot.ref.getDownloadURL();
      /*await storage.write(key: 'imageUrl', value: downloadUrl);
      var value1 = await storage.read(key: 'imageUrl');
      var value2 = await storage.read(key: 'location');*/
      //print(value2);
      //print(value1);
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
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Image.network(imageUrl),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
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
                        "Upload Presciption",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
