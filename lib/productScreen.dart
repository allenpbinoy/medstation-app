import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_station/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key key}) : super(key: key);

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
                        "Dolo 650 Tablet",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Strip of 15 pcs",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "MRP ₹30.0",
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
                        "Composition",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Paracetamol (650mg)",
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
                        "Available",
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
                            "New English Medicals, Kothamangalam",
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
