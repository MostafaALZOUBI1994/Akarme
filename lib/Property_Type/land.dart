import 'package:akarme/Land_levels/Land_Type.dart';
import 'package:akarme/Land_levels/Wall.dart';
import 'package:akarme/Land_levels/Well.dart';
import 'package:flutter/material.dart';

class land extends StatefulWidget {
  Well w;
  Wall wa;
  LandType typ;
  @override
  _landState createState() => _landState();
}



class _landState extends State<land> {

  void checkChanged(bool value) {
    if (value == true) {
      value = false;
    } else {
      value = true;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(25.0),
          color: Theme.of(context).selectedRowColor),
      child: Stack(
        children: <Widget>[
          Well("Undefined"),
          Wall("Undefined"),
          LandType("Undefined"),
        ],
      ),
    );
  }
}
