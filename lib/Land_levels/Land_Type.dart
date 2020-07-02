import 'package:flutter/material.dart';
class LandType extends StatefulWidget {
  final String label;
  const LandType(this.label);
  @override
  _WallState createState() => _WallState();
}

class _WallState extends State<LandType> {
  List<LandType> Room = <LandType>[
    const LandType('Undefined'),
    const LandType('Architecture'),
    const LandType('Agriclulture'),
  ];

  LandType selectedtype = const LandType("Undefined");
  @override
  Widget build(BuildContext context) {
    final LandTypeWidget = DropdownButtonHideUnderline(
      child: DropdownButton<LandType>(
        isExpanded: true,
        value: selectedtype,
        isDense: true,
        iconSize: 30.0,
        onChanged: (LandType newValue) {
          setState(() {
            selectedtype = newValue;
          });
        },
        items: Room.map((LandType type) {
          return new DropdownMenuItem<LandType>(
            value: type,
            child:
            new Text(type.label, style: Theme.of(context).textTheme.body1),
          );
        }).toList(),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 100.0,bottom:15.0),
      child:Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          padding: EdgeInsets.all(2.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(25.0),
            border: new Border.all(
              width: 3.0,
              color: Theme.of(context).accentColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
          child:
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child:
                Text("Land Type:", style: Theme.of(context).textTheme.body2),
              ),),
              Expanded(child: LandTypeWidget),
            ],
          )),
    );
  }
}