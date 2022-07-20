import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_station/widgets/widgets.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar4(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 3,
                        child: Container(
                          child: Image.network(
                              "https://content.jdmagicbox.com/comp/ernakulam/g2/0484px484.x484.140204040637.l3g2/catalogue/best-medicals-kalamassery-ernakulam-chemists-1gehaawxtk-250.jpg?clr="),
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
                            "New English Medicals",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Kothamangalam",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "10km away",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey[800]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0,
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
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
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
                                "New English Medicals, Kothamangalam",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
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
                                " +91 9061950370",
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
                                " +91 9061950370",
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                ]))
          ],
        ),
      ),
    );
  }
}
