import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_station/categories/ayurvedha.dart';
import 'package:med_station/categories/homeopathy.dart';
import 'package:med_station/searchScreen.dart';
import 'package:med_station/widgets/home.dart';
import 'package:med_station/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar7(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              color: HexColor("#003580", 1),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                              child: Image.asset(
                            'image/2.png',
                            width: 200,
                          )),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                CupertinoIcons.search,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    color: HexColor("#003580", 1),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Center(
                              child: Container(
                            margin: const EdgeInsets.all(15.0),
                            child: Text(
                              "Home",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          )),
                          decoration: BoxDecoration(
                              color: HexColor("#003580", 1),
                              borderRadius: BorderRadius.circular(25),
                              border:
                                  Border.all(color: Colors.white, width: 3)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Ayurvedha()),
                            );
                          },
                          child: Container(
                            child: Center(
                                child: Container(
                              margin: const EdgeInsets.all(15.0),
                              child: Text(
                                "Ayurvedha",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )),
                            decoration: BoxDecoration(
                                color: HexColor("#003580", 1),
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homeopathy()),
                            );
                          },
                          child: Container(
                            child: Center(
                                child: Container(
                              margin: const EdgeInsets.all(15.0),
                              child: Text(
                                "Homeopathy",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )),
                            decoration: BoxDecoration(
                                color: HexColor("#003580", 1),
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Ayurvedha()),
                            );
                          },
                          child: Container(
                            child: Center(
                                child: Container(
                              margin: const EdgeInsets.all(15.0),
                              child: Text(
                                "SkinCare",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )),
                            decoration: BoxDecoration(
                                color: HexColor("#003580", 1),
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new GestureDetector(
                          child: Container(
                            child: Center(
                                child: Container(
                              margin: const EdgeInsets.all(15.0),
                              child: Text(
                                "Nutritinoal Drinks",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )),
                            decoration: BoxDecoration(
                                color: HexColor("#003580", 1),
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // homeItem(context),
            Container(
              child: SingleChildScrollView(
                child: homeItem(context),
              ),
            )
          ],
        ),
      )),
    );
  }
}
