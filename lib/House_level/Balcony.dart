import 'package:flutter/material.dart';

class balcony extends StatefulWidget {
  final String label;
  const balcony(this.label);
  @override
  _balconyState createState() => _balconyState();
}

class _balconyState extends State<balcony> {
  List<balcony> balconies = <balcony>[
    const balcony('Undefined'),
    const balcony("Doesn't Exist"),
    const balcony('1 '),
    const balcony('2'),
    const balcony('3'),
    const balcony('4'),
    const balcony('5'),
  ];
  balcony selectedBalacony = const balcony("Undefined");
  @override
  Widget build(BuildContext context) {
    final bal = DropdownButtonHideUnderline(
      child: DropdownButton<balcony>(
        isExpanded: true,
        value: selectedBalacony,
        isDense: true,
        iconSize: 30.0,
        onChanged: (balcony newValue) {
          setState(() {
            selectedBalacony = newValue;
          });
        },
        items: balconies.map((balcony type) {
          return new DropdownMenuItem<balcony>(
              value: type,
              child: new Text(
                type.label,
                style: Theme.of(context).textTheme.body1,
              ));
        }).toList(),
      ),
    );
    return Padding(
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
              child: Text("Balcony",
                  style: Theme.of(context).textTheme.body2),
            ),),
            Expanded(child: bal),
          ],
        ),
      ),
    );
  }
}
