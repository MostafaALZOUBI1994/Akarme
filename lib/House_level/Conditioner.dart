import 'package:flutter/material.dart';
class Conditioner extends StatefulWidget {
  final String label;
  const Conditioner(this.label);
  @override
  _ConditionerState createState() => _ConditionerState();
}

class _ConditionerState extends State<Conditioner> {
  List<Conditioner> conds = <Conditioner>[
    const Conditioner('Undefined'),
    const Conditioner("Doesn't Exist"),
    const Conditioner('Exist'),
  ];
  Conditioner selected = const Conditioner("Undefined");
  @override
  Widget build(BuildContext context) {
    final con = DropdownButtonHideUnderline(
      child: DropdownButton<Conditioner>(
        isExpanded: true,
        value: selected,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Conditioner newValue) {
          setState(() {
            selected = newValue;
          });
        },
        items: conds.map((Conditioner type) {
          return new DropdownMenuItem<Conditioner>(
              value: type,
              child: new Text(
                type.label,
                style: Theme.of(context).textTheme.body1,
              ));
        }).toList(),
      ),
    );
    return Padding(
      padding: EdgeInsets.only(top: 100.0),
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
              child: Text("Conditioner",
                  style: Theme.of(context).textTheme.body2),
            ),),
            Expanded(child: con),
          ],
        ),
      ),
    );
  }
}
