import 'package:flutter/material.dart';

class decore {
  const decore(this.label);
  final String label;
}

class Decore extends StatefulWidget {
  @override
  _DecoreState createState() => _DecoreState();
}

class _DecoreState extends State<Decore> {
  decore selectedDecore = const decore('Undefined');
  List<decore> decores = <decore>[
    const decore('Undefined'),
    const decore('Undecorated'),
    const decore('Decorated'),
    const decore('Normal'),
    const decore('Delux'),
    const decore('SperDelux'),
  ];
  @override
  Widget build(BuildContext context) {
    final decoretype = DropdownButtonHideUnderline(
      child: DropdownButton<decore>(
        isExpanded: true,
        value: selectedDecore,
        isDense: true,
        iconSize: 30.0,
        onChanged: (decore newValue) {
          setState(() {
            selectedDecore = newValue;
          });
        },
        items: decores.map((decore type) {
          return new DropdownMenuItem<decore>(
            value: type,
            child: new Text(type.label,
                style: Theme.of(context).textTheme.display1),
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
          color: Theme.of(context).primaryColor,
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
            child: Text("Decoration Type",
                style: Theme.of(context).textTheme.display1),
          ),),
          Expanded(child: decoretype),
        ],
      ),
    );
  }
}
