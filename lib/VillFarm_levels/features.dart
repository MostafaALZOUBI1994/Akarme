import 'package:flutter/material.dart';
class Villafeatures extends StatefulWidget {
  bool Swimming_pool;
  bool Gym;
  bool Well;
  bool generator;
  bool garage;
  bool Porter_Room;
  bool Cildren_Toy;
  bool Servent_Room;

  Villafeatures(this.Swimming_pool,this.Gym,this.Well,this.generator,this.garage,this.Porter_Room,this.Cildren_Toy,this.Servent_Room);

  @override
  _featuresState createState() => _featuresState();
}

class _featuresState extends State<Villafeatures> {
  bool value1 = false;
  void value1Changed(bool value) => setState(() => value1 = value);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 150.0,bottom:15.0),
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        padding: EdgeInsets.all(2.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(25.0),
          border: new Border.all(
              width: 3.0, color: Theme.of(context).accentColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Building Services:",
              style: Theme.of(context).textTheme.body2,
            ),
            Row(
              children: <Widget>[
                new Checkbox(
                  onChanged: value1Changed,
                  value: value1,
                  activeColor: Theme.of(context).accentColor,
                ),
                Text(
                  "option1",
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Checkbox(
                    onChanged: value1Changed,
                    value: value1,
                    activeColor: Theme.of(context).accentColor),
                Text("option2", style: Theme.of(context).textTheme.body2),
              ],
            ),
            Row(
              children: <Widget>[
                new Checkbox(
                    onChanged: value1Changed,
                    value: value1,
                    activeColor: Theme.of(context).accentColor),
                Text("option3", style: Theme.of(context).textTheme.body2),
              ],
            ),
            Row(
              children: <Widget>[
                new Checkbox(
                    onChanged: value1Changed,
                    value: value1,
                    activeColor: Theme.of(context).accentColor),
                Text("option4", style: Theme.of(context).textTheme.body2),
              ],
            ),
            Row(
              children: <Widget>[
                new Checkbox(
                    onChanged: value1Changed,
                    value: value1,
                    activeColor: Theme.of(context).accentColor),
                Text("option5", style: Theme.of(context).textTheme.body2),
              ],
            ),
            Row(
              children: <Widget>[
                new Checkbox(
                    onChanged: value1Changed,
                    value: value1,
                    activeColor: Theme.of(context).accentColor),
                Text("option6", style: Theme.of(context).textTheme.body2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
