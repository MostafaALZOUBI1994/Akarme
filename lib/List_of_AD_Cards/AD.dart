import 'package:flutter/material.dart';

class Ad {
  int id;
  String ADType;
  String Number;
  String Area;
  String Location;
  String type;
  String price;
  String property;
  String decoration;
  String Furniture;
  Ad(this.ADType, this.Area, this.Location, this.type, this.decoration,
      this.Number, this.Furniture, this.price, this.property,this.id);
}
class RentAD extends Ad {
  String duration;
  RentAD(this.duration) : super('', '', '', '', '', '', '', '', '', 0);
}
