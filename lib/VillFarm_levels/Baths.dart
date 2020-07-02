import 'package:flutter/material.dart';


class Bath extends StatefulWidget {
  final String label;
  const Bath(this.label);
  @override
  _BathState createState() => _BathState();
}

class _BathState extends State<Bath> {
  List<Bath> num1 = <Bath>[
    const Bath('Undefined'),
    const Bath('1'),
    const Bath('2'),
    const Bath('3'),
    const Bath('4'),
    const Bath('5'),
  ];
  Bath selectedbaths = const Bath("Undefined");
  @override
  Widget build(BuildContext context) {
    final bath = DropdownButtonHideUnderline(
      child: DropdownButton<Bath>(
        isExpanded: true,
        value: selectedbaths,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Bath newValue) {
          setState(() {
            selectedbaths = newValue;
          });
        },
        items: num1.map((Bath type) {
          return new DropdownMenuItem<Bath>(
            value: type,
            child:
            new Text(type.label, style: Theme.of(context).textTheme.body1),
          );
        }).toList(),
      ),
    );
    return  Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Container(
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
                child: Text("Bath Room",
                    style: Theme.of(context).textTheme.body2),
              ),),
              Expanded(child: bath ),
            ],
          ),
        ));
  }
}
