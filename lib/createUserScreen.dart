import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_station/widgets/widgets.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({Key key}) : super(key: key);

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
                      //     controller: emailController,
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
                      //     controller: emailController,
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
                      //     controller: emailController,

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
                  onPressed: () {},
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
