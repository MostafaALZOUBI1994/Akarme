import 'package:flutter/material.dart';

class Floors extends StatefulWidget {
  final String label;
  const Floors(this.label);
  @override
  _FloorsState createState() => _FloorsState();
}

class _FloorsState extends State<Floors> {
  List<Floors> num = <Floors>[
    const Floors('Undefined'),
    const Floors('Basement'),
    const Floors('Ground floor'),
    const Floors('1'),
    const Floors('2'),
    const Floors('3'),
    const Floors('4'),
    const Floors('5'),
    const Floors('6'),
    const Floors('7'),
    const Floors('8'),
    const Floors('9'),
    const Floors('10'),
    const Floors('11'),
    const Floors('12'),
    const Floors('13'),
    const Floors('14'),
    const Floors('15'),
    const Floors('16'),
    const Floors('17'),
    const Floors('18'),
    const Floors('19'),
    const Floors('20'),
    const Floors('21'),
    const Floors('22'),
    const Floors('23'),
    const Floors('24'),
    const Floors('25'),
  ];
  Floors selectedFloor = const Floors("Undefined");
  @override
  Widget build(BuildContext context) {
    final floors = DropdownButtonHideUnderline(
      child: DropdownButton<Floors>(
        isExpanded: true,
        value: selectedFloor,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Floors newValue) {
          setState(() {
            selectedFloor = newValue;
          });
        },
        items: num.map((Floors type) {
          return new DropdownMenuItem<Floors>(
            value: type,
            child:
            new Text(type.label, style: Theme.of(context).textTheme.body1),
          );
        }).toList(),
      ),
    );
    return   Container(
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
            child: Text("Apartement Number",
                style: Theme.of(context).textTheme.body2),
          ),),
          Expanded(child: floors),
        ],
      ),
    );
  }
}
