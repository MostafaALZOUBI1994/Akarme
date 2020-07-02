import 'package:flutter/material.dart';


class Kitchen extends StatefulWidget {
  final String label;
  const Kitchen(this.label);
  @override
  _KitchenState createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  List<Kitchen> num1 = <Kitchen>[
    const Kitchen('Undefined'),
    const Kitchen('1'),
    const Kitchen('2'),
    const Kitchen('3'),
    const Kitchen('4'),
    const Kitchen('5'),
  ];
  Kitchen selectedkit = const Kitchen("Undefined");
  @override
  Widget build(BuildContext context) {
    final kit = DropdownButtonHideUnderline(
      child: DropdownButton<Kitchen>(
        isExpanded: true,
        value: selectedkit,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Kitchen newValue) {
          setState(() {
            selectedkit = newValue;
          });
        },
        items: num1.map((Kitchen type) {
          return new DropdownMenuItem<Kitchen>(
            value: type,
            child:
            new Text(type.label, style: Theme.of(context).textTheme.body1),
          );
        }).toList(),
      ),
    );
    return  Padding(
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
                child: Text("Kitchen",
                    style: Theme.of(context).textTheme.body2),
              ),),
              Expanded(child: kit ),
            ],
          ),
        ));
  }
}
