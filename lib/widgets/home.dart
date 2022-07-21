import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';
import 'package:med_station/categories/ayurvedha.dart';
import 'package:med_station/categories/homeopathy.dart';
import 'package:med_station/categories/nutritional.dart';
import 'package:med_station/categories/skincare.dart';
import 'package:med_station/widgets/widgets.dart';

import '../searchScreen.dart';

final List<String> imageList = [
  "https://onemg.gumlet.io/image/upload/w_480,h_200,,…_auto,f_auto/v1657046725/vjameabdajvmp2sgtp0m.jpgg",
  'https://newassets.apollo247.com/pub/media/magestore/bannerslider/images/b/a/baidyanath_vansaar_offers_web_2.jpg',
  'https://onemg.gumlet.io/image/upload/w_480,h_200,,…_auto,f_auto/v1657046725/vjameabdajvmp2sgtp0m.jpgg',
  'https://onemg.gumlet.io/image/upload/w_480,h_200,,…_auto,f_auto/v1657046725/vjameabdajvmp2sgtp0m.jpgg'
];

Container homeItem(BuildContext context) {
  return Container(
    child: Column(children: [
      SizedBox(
        height: 15,
      ),
      new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 5),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: TextField(
                      //     controller: emailController,

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
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "search medicine",
                          fillColor: Colors.white),
                    ),
                  ),
                  Container(
                    height: 5,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                          color: HexColor("#003580", 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()),
                          );
                        },
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                HexColor("#003580", 1))),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: .1),
              borderRadius: BorderRadius.circular(3)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.brown,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Get the latest Covid-19 shopping guideline "),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 10,
        color: Colors.grey[200],
      ),
      new GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Ayurvedha()));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 120,
            child: Image.network(
                "https://newassets.apollo247.com/pub/media/magestore/bannerslider/images/c/o/cold_n_cough_offers_web.jpg"),
          ),
        ),
      ),
      Container(
        height: .2,
        color: Colors.grey,
        width: MediaQuery.of(context).size.width,
      ),
      Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homeopathy()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(2),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.grey, width: .3)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.network(
                                      "https://onemg.gumlet.io/image/upload/w_150,h_150,c…_auto,f_auto/v1624525320/j7ruar88gacbzksuadjn.png"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  /*Container(
                                height: .5,
                                color: Colors.grey,
                                width: 120,
                              ),*/
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      "Homeopathy",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ayurvedha()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(left: BorderSide(width: .1))),
                      margin: EdgeInsets.all(2),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.grey, width: .3)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.network(
                                      "https://onemg.gumlet.io/image/upload/w_150,h_150,c…_auto,f_auto/v1649141994/x2z8u1osqutmxvx56hlw.png"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      "Ayurvedha",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: .2,
              color: Colors.grey,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SkinCare()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(2),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.grey, width: .3)),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Image.network(
                                        "https://onemg.gumlet.io/image/upload/w_150,h_150,c…_auto,f_auto/v1624525251/bkhusfgfiu9qedowph2i.png"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "Skin Care",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(left: BorderSide(width: .1))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Nutritonal()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.grey, width: .3)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Image.network(
                                      "https://onemg.gumlet.io/image/upload/w_150,h_150,c…_auto,f_auto/v1642586423/uq1gwxslqqrxxwv6zi6j.jpg"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      "Nutritional Drinks",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      Container(
        height: 10,
        color: Colors.grey[200],
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CarouselImages(
            scaleFactor: 0.6,
            listImages: imageList,
            height: 200.0,
            borderRadius: 30.0,
            cachedNetworkImage: true,
            verticalAlignment: Alignment.topCenter,
            onTap: (index) {
              print('Tapped on page $index');
            },
          ),
        ),
      )
    ]),
  );
}
