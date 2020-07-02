import 'package:akarme/House_level/features.dart';
import 'package:akarme/House_level/garden.dart';
import 'package:flutter/material.dart';
import 'package:akarme/House_level/Balcony.dart';
import 'package:akarme/House_level/Conditioner.dart';
import 'package:akarme/House_level/floors.dart';

class house extends StatefulWidget {
  floor floors;
  balcony Balcony;
  Garden Gardens;
  Conditioner con;
  housefeatures housefeature;
  @override
  _houseState createState() => _houseState();
}
class _houseState extends State<house> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(25.0),
        color: Theme.of(context).selectedRowColor,
      ),
      child: Stack(
        children: <Widget>[
          floor("Undefined"),
          balcony("Undefined"),
          Conditioner("Undefined"),
          Garden('Undefined'),
          housefeatures(true,true,true,true,true,true,),
        ],
      ),
    );
  }
}
