import 'package:flutter/material.dart';
class Well extends StatefulWidget {
final String label;
const Well(this.label);
  @override
  _WellState createState() => _WellState();
}

class _WellState extends State<Well> {
  List<Well> Room = <Well>[
    const Well('Undefined'),
    const Well('Exist'),
    const Well('Not Exist'),

  ];

  Well selectedWell = const Well("Undefined");
 // Kitchen selectedBath = const Kitchen("Undefined");
  // Kitchen selectedKit = const Kitchen("Undefined");
  @override
  Widget build(BuildContext context) {
    final KitchenWidget = DropdownButtonHideUnderline(
      child: DropdownButton<Well>(
        isExpanded: true,
        value: selectedWell,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Well newValue) {
          setState(() {
            selectedWell = newValue;
          });
        },
        items: Room.map((Well type) {
          return new DropdownMenuItem<Well>(
            value: type,
            child:
            new Text(type.label, style: Theme.of(context).textTheme.body1),
          );
        }).toList(),
      ),
    );
    return Container(
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
            Text("BedRoom", style: Theme.of(context).textTheme.body2),
          ),),
          Expanded(child: KitchenWidget),
        ],
      ),
    );
  }
}