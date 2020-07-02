import 'package:flutter/material.dart';


class Room extends StatefulWidget {
  final String label;
  const Room(this.label);
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  List<Room> num1 = <Room>[
    const Room('Undefined'),
    const Room('1'),
    const Room('2'),
    const Room('3'),
    const Room('4'),
    const Room('5'),
  ];
  Room selectedroom = const Room("Undefined");
  @override
  Widget build(BuildContext context) {
    final room = DropdownButtonHideUnderline(
      child: DropdownButton<Room>(
        isExpanded: true,
        value: selectedroom,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Room newValue) {
          setState(() {
            selectedroom = newValue;
          });
        },
        items: num1.map((Room type) {
          return new DropdownMenuItem<Room>(
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
                width: 3.0, color: Theme.of(context).accentColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
          child:
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Bed Room",
                    style: Theme.of(context).textTheme.body2),
              ),),
              Expanded(child: room ),
            ],
          ),
        );
  }
}
