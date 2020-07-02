import 'package:flutter/material.dart';
class Wall extends StatefulWidget {
  final String label;
  const Wall(this.label);
  @override
  _WallState createState() => _WallState();
}

class _WallState extends State<Wall> {
  List<Wall> Room = <Wall>[
    const Wall('Undefined'),
    const Wall('Exist'),
    const Wall('Not Exist'),

  ];

  Wall selectedWall = const Wall("Undefined");
  @override
  Widget build(BuildContext context) {

    final WallWidget = DropdownButtonHideUnderline(
      child: DropdownButton<Wall>(
        isExpanded: true,
        value: selectedWall,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Wall newValue) {
          setState(() {
            selectedWall = newValue;
          });
        },
        items: Room.map((Wall type) {
          return new DropdownMenuItem<Wall>(
            value: type,
            child:
            new Text(type.label, style: Theme.of(context).textTheme.body1),
          );
        }).toList(),
      ),
    );
    return Padding(
        padding: const EdgeInsets.only(top: 50.0),
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
            Text("Wall :", style: Theme.of(context).textTheme.body2),
          ),),
          Expanded(child: WallWidget),
        ],
      )),
    );
  }
}