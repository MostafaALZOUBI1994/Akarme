import 'package:flutter/material.dart';
class Apartement extends StatefulWidget {
  final String label;
  const Apartement(this.label);
  @override
  _ApartementState createState() => _ApartementState();
}

class _ApartementState extends State<Apartement> {
  List<Apartement> num = <Apartement>[
    const Apartement('Undefined'),
    const Apartement('1'),
    const Apartement('2'),
    const Apartement('3'),
    const Apartement('4'),
    const Apartement('5'),
    const Apartement('6'),
    const Apartement('7'),
    const Apartement('8'),
    const Apartement('9'),
    const Apartement('10'),
    const Apartement('11'),
    const Apartement('12'),
    const Apartement('13'),
    const Apartement('14'),
    const Apartement('15'),
    const Apartement('16'),
    const Apartement('17'),
    const Apartement('18'),
    const Apartement('19'),
  ];
  Apartement selectedApa = const Apartement("Undefined");
  @override
  Widget build(BuildContext context) {
    final AparWidget = DropdownButtonHideUnderline(
      child: DropdownButton<Apartement>(
        isExpanded: true,
        value: selectedApa,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Apartement newValue) {
          setState(() {
            selectedApa = newValue;
          });
        },
        items: num.map((Apartement type) {
          return new DropdownMenuItem<Apartement>(
            value: type,
            child:
            new Text(type.label, style: Theme.of(context).textTheme.body1),
          );
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
                child: Text("Building Number",
                    style: Theme.of(context).textTheme.body2),
              ),),
              Expanded(child: AparWidget),
            ],
          ),
        ));
  }
}
