import 'package:akarme/Office_levels/Baths.dart';
import 'package:akarme/Office_levels/Features.dart';
import 'package:akarme/Office_levels/floors.dart';
import 'package:flutter/material.dart';

class office extends StatefulWidget {
  Floors f;
  Bath b;
  OfficeFeatures o;
  @override
  _officeState createState() => _officeState();
}


class _officeState extends State<office> {
  Bath bath;
  Floors floor;
  OfficeFeatures feat;
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
          color: Color.fromRGBO(16, 67, 122, 0.9),
        ),
        child: Stack(
          children: <Widget>[
            Floors('Undefined'),
            Bath('Undefined'),
            OfficeFeatures(),
          ],
        ));
  }
}
