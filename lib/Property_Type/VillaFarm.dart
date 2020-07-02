import 'package:akarme/VillFarm_levels/features.dart';
import 'package:akarme/VillFarm_levels/Baths.dart';
import 'package:akarme/VillFarm_levels/Kitchen.dart';
import 'package:akarme/VillFarm_levels/Rooms.dart';
import 'package:flutter/material.dart';

class villa extends StatefulWidget {
  Bath b;
  Kitchen k;
  Room ro;
  Villafeatures fea;
  @override
  _villaState createState() => _villaState();
}



class _villaState extends State<villa> {
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
          Room('Undefined'),
          Bath('Undefined'),
          Kitchen('Undefined'),
          Villafeatures(true,true,true,true,true,true,true,true,),
        ],
      ),
    );
  }
}
