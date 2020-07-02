import 'package:flutter/material.dart';

class Garden extends StatefulWidget {
  final String label;
  const  Garden(this.label);
  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  Garden selectedgarden = const Garden("Undefined");
  List<Garden> gardens = <Garden>[
    const Garden('Undefined'),
    const Garden("Doesn't Exist"),
    const Garden('Exist'),
  ];
  @override
  Widget build(BuildContext context) {
    final gar = DropdownButtonHideUnderline(
      child: DropdownButton<Garden>(
        isExpanded: true,
        value: selectedgarden,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Garden newValue) {
          setState(() {
            selectedgarden = newValue;
          });
        },
        items: gardens.map((Garden type) {
          return new DropdownMenuItem<Garden>(
            value: type,
            child:
            new Text(type.label, style: Theme.of(context).textTheme.body1),
          );
        }).toList(),
      ),
    );
    return  Padding(
      padding: EdgeInsets.only(top: 150.0),
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
              child: Text("Garden",
                  style: Theme.of(context).textTheme.body2),
            ),),
            Expanded(child: gar),
          ],
        ),
      ),
    );
  }
}
