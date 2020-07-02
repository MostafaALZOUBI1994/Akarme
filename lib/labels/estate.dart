import 'package:akarme/Property_Type/residental.dart';
import 'package:akarme/Property_Type/store.dart';
import 'package:flutter/material.dart';
import 'package:akarme/Property_Type/VillaFarm.dart';
import 'package:akarme/Property_Type/house.dart';
import 'package:akarme/Property_Type/land.dart';
import 'package:akarme/Property_Type/office.dart';

class estatetype {
  const estatetype(this.type);
  final String type;
}

class EstateType extends StatefulWidget {
  @override
  _EstateTypeState createState() => _EstateTypeState();
}

class _EstateTypeState extends State<EstateType> {
  estatetype selectedEstate = const estatetype('Undefined');
  List<estatetype> estates = <estatetype>[
    const estatetype('Undefined'),
    const estatetype('House'),
    const estatetype('Villa/Farm'),
    const estatetype('Residental Area'),
    const estatetype('Office'),
    const estatetype('Land'),
    const estatetype('Store')
  ];

  bool _isreal(int n) {
    if (selectedEstate == estates[n]) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final realestate = DropdownButton<estatetype>(
      isExpanded: true,
      value: selectedEstate,
      isDense: true,
      iconSize: 30.0,
      onChanged: (estatetype newValue) {
        setState(() {
          selectedEstate = newValue;
        });
      },
      items: estates.map((estatetype type) {
        return new DropdownMenuItem<estatetype>(
          value: type,
          child:
              new Text(type.type, style: Theme.of(context).textTheme.display1),
        );
      }).toList(),
    );
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          padding: EdgeInsets.all(2.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(25.0),
            border: new Border.all(
              width: 3.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Text("Real Estate Type",
                      style: Theme.of(context).textTheme.display1),
                ),
              ),
              Expanded(child: realestate),
            ],
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: _isreal(1) != true,
            child: new TickerMode(enabled: _isreal(1) == true, child: house()),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: _isreal(2) != true,
            child: new TickerMode(enabled: _isreal(2) == true, child: villa()),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: _isreal(3) != true,
            child: new TickerMode(enabled: _isreal(3) == true, child: res()),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: _isreal(4) != true,
            child: new TickerMode(enabled: _isreal(4) == true, child: office()),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: _isreal(5) != true,
            child: new TickerMode(enabled: _isreal(5) == true, child: land()),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: _isreal(6) != true,
            child: new TickerMode(enabled: _isreal(6) == true, child: store()),
          ),
        ),
      ],
    );
  }
}
