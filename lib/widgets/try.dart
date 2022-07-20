import 'package:flutter/material.dart';
import 'package:med_station/widgets/home.dart';

class Try extends StatelessWidget {
  const Try({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: homeItem(context),
          ),
        ),
      ),
    );
  }
}
