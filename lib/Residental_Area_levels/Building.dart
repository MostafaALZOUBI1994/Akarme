import 'package:flutter/material.dart';
class Building extends StatefulWidget {
  final String label;
  const Building(this.label);
  @override
  _BuildingState createState() => _BuildingState();
}

class _BuildingState extends State<Building> {
  List<Building> num = <Building>[
    const Building('Undefined'),
    const Building('1'),
    const Building('2'),
    const Building('3'),
    const Building('4'),
    const Building('5'),
    const Building('6'),
    const Building('7'),
    const Building('8'),
    const Building('9'),
    const Building('10'),
    const Building('11'),
    const Building('12'),
    const Building('13'),
    const Building('14'),
    const Building('15'),
    const Building('16'),
    const Building('17'),
    const Building('18'),
    const Building('19'),
  ];
  Building selectedBuild = const Building("Undefined");
  @override
  Widget build(BuildContext context) {
    final ResWidget = DropdownButtonHideUnderline(
      child: DropdownButton<Building>(
        isExpanded: true,
        value: selectedBuild,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Building newValue) {
          setState(() {
            selectedBuild = newValue;
          });
        },
        items: num.map((Building type) {
          return new DropdownMenuItem<Building>(
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
            child: Text("Apartement Number",
                style: Theme.of(context).textTheme.body2),
          ),),
          Expanded(child: ResWidget),
        ],
      ),
    );
  }
}
