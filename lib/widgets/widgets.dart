import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Hex color input
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor, int i) : super(_getColorFromHex(hexColor));
}

//AppBar1
class AppBar1 extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBar1({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search, color: Colors.black),
            onPressed: () {},
          ),
        ]);
  }
}

//AppBar2
class AppBar2 extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBar2({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        brightness: Brightness.dark,
        backgroundColor: HexColor("#003580", 1),
        elevation: 1,
        title: Text("Delivery Requests"),
        leading: Icon(
          Icons.ac_unit,
          color: Colors.transparent,
          size: .1,
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
        titleSpacing: 60);
  }
}

//AppBar3
class AppBar3 extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBar3({Key? key})
      : preferredSize = const Size.fromHeight(0.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        brightness: Brightness.dark,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: HexColor("#003580", 1),
        elevation: 0,
        leading: Icon(
          Icons.ac_unit,
          color: Colors.transparent,
          size: .1,
        ),
        titleSpacing: 80,
        title: Text("My Account"),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search, color: Colors.white),
            onPressed: () {},
          ),
        ]);
  }
}

//AppBar4
class AppBar4 extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBar4({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        brightness: Brightness.dark,
        backgroundColor: HexColor("#003580", 1),
        elevation: 0,
        leading: null,
        title: Text("Shop Details"),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search, color: Colors.white),
            onPressed: () {},
          ),
        ]);
  }
}

//AppBar6
class AppBar6 extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBar6({Key? key})
      : preferredSize = const Size.fromHeight(10.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: HexColor("#003580", 1),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_outlined, color: Colors.transparent),
        onPressed: () {},
      ),
    );
  }
}

//AppBar7
class AppBar7 extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBar7({Key? key})
      : preferredSize = const Size.fromHeight(0.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: HexColor("#003580", 1),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_outlined, color: Colors.transparent),
        onPressed: () {},
      ),
    );
  }
}
