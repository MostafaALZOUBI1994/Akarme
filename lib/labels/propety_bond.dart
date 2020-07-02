import 'package:flutter/material.dart';

class property_bond {
  const property_bond(this.label);

  final String label;
}

class PropertyBond extends StatefulWidget {
  @override
  _PropertyBondState createState() => _PropertyBondState();
}

class _PropertyBondState extends State<PropertyBond> {
  property_bond selectedbond = const property_bond('Undefined');
  List<property_bond> properties = <property_bond>[
    const property_bond('Undefined'),
    const property_bond('1'),
    const property_bond('2'),
    const property_bond('3'),
    const property_bond('4'),
    const property_bond('5'),
    const property_bond('6')
  ];
  @override
  Widget build(BuildContext context) {
    final property_bondtype = DropdownButton<property_bond>(
      isExpanded: true,
      value: selectedbond,
      isDense: true,
      iconSize: 30.0,
      onChanged: (property_bond newValue) {
        setState(() {
          selectedbond = newValue;
        });
      },
      items: properties.map((property_bond type) {
        return new DropdownMenuItem<property_bond>(
          value: type,
          child:
              new Text(type.label, style: Theme.of(context).textTheme.display1),
        );
      }).toList(),
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
          Expanded(child:
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text("Property Bond",
                style: Theme.of(context).textTheme.display1),
          ),),
          Expanded(child: property_bondtype),
        ],
      ),
    );
  }
}
