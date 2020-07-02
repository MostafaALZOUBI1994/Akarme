import 'package:akarme/Residental_Area_levels/features.dart';
import 'package:akarme/Residental_Area_levels/Apartement.dart';
import 'package:akarme/Residental_Area_levels/Building.dart';
import 'package:flutter/material.dart';

class res extends StatefulWidget {
  Apartement ar;
  Building b;
  Residentalfeatures fe;

  @override
  _resState createState() => _resState();
}

class _resState extends State<res> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(5.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(25.0),
          color: Color.fromRGBO(16, 67, 122, 0.9),
        ),
        child: Stack(
          children: <Widget>[
            Building("Undefined"),
            Apartement("Undefined"),
            Residentalfeatures(),
          ],
        ));
  }
}
