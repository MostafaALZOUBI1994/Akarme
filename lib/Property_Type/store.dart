import 'package:akarme/Store_levels/Conditioner.dart';
import 'package:akarme/Store_levels//floors.dart';
import 'package:flutter/material.dart';

class store extends StatefulWidget {
  Conditioner con;
  floor f;
  @override
  _storeState createState() => _storeState();
}
class _storeState extends State<store> {
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
            floor("Undefined"),
            Conditioner("Undefined"),
          ],
        ));
  }
}
