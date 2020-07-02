import 'package:flutter/material.dart';

class floor extends StatefulWidget {
  final String label;
  const floor(this.label, {TextStyle style});
  @override
  _floorState createState() => _floorState();
}

class _floorState extends State<floor> {
  List<floor> floors = <floor>[
    const floor('Undefined'),
    const floor('Basement'),
    const floor('Ground floor '),
    const floor('1'),
    const floor('2'),
    const floor('3'),
    const floor('4'),
    const floor('5'),
    const floor('6'),
    const floor('7'),
    const floor('8'),
    const floor('9'),
    const floor('10'),
    const floor('11'),
    const floor('12'),
    const floor('13'),
    const floor('14'),
    const floor('15'),
    const floor('16'),
    const floor('17'),
    const floor('18'),
    const floor('19'),
    const floor('20'),
  ];
  floor selectedFloor = const floor("Undefined");
  @override
  Widget build(BuildContext context) {
    final Floornumber = DropdownButtonHideUnderline(
      child:DropdownButton<floor>(
        value: selectedFloor,
        isDense: true,
        iconSize: 30.0,
        onChanged: (floor newValue) {
          setState(() {
            selectedFloor = newValue;
          });
        },
        items: floors.map((floor type) {
          return new DropdownMenuItem<floor>(
            value: type,
            child:
            new Text(type.label, style: Theme.of(context).textTheme.body1),
          );
        }).toList(),
      )
    );
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      padding: EdgeInsets.all(2.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(25.0),
        border: new Border.all(
          width: 3.0,
          color: Color.fromRGBO(246, 140, 31, 1.0),
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
              child: Text("Floors", style: Theme.of(context).textTheme.body2),
            ),
          ),
          Expanded(child: Floornumber),
        ],
      ),
    );
  }
}