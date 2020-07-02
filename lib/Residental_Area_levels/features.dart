import 'package:flutter/material.dart';
class Residentalfeatures extends StatefulWidget {
  bool garden;
  bool elevator;
  bool solar;
  bool generator;
  bool garage;
  bool doorkeeper;
  bool hypocaust;

  @override
  _featuresState createState() => _featuresState();
}

class _featuresState extends State<Residentalfeatures> {
  void checkChanged(bool value) {
    if (value == true) {
      value = false;
    } else {
      value = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 100.0,bottom:15.0),
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          padding: EdgeInsets.all(2.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(25.0),
            border: new Border.all(
                width: 3.0, color: Theme.of(context).accentColor),
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Features:",
                style: Theme.of(context).textTheme.body2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Checkbox(
                            key: null,
                            onChanged: checkChanged,
                            value: false,
                            activeColor:
                            Color.fromRGBO(246, 140, 31, 1.0),
                          ),
                          Text("option1",
                              style: Theme.of(context).textTheme.body2),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Checkbox(
                              key: null,
                              onChanged: checkChanged,
                              value: false,
                              activeColor:
                              Color.fromRGBO(246, 140, 31, 1.0)),
                          Text("option2",
                              style: Theme.of(context).textTheme.body2),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Checkbox(
                              key: null,
                              onChanged: checkChanged,
                              value: false,
                              activeColor:
                              Color.fromRGBO(246, 140, 31, 1.0)),
                          Text("option1",
                              style: Theme.of(context).textTheme.body2),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Checkbox(
                              key: null,
                              onChanged: checkChanged,
                              value: false,
                              activeColor:
                              Color.fromRGBO(246, 140, 31, 1.0)),
                          Text("option1",
                              style: Theme.of(context).textTheme.body2),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Checkbox(
                            key: null,
                            onChanged: checkChanged,
                            value: false,
                            activeColor:
                            Color.fromRGBO(246, 140, 31, 1.0),
                          ),
                          Text("option1",
                              style: Theme.of(context).textTheme.body2),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Checkbox(
                              key: null,
                              onChanged: checkChanged,
                              value: false,
                              activeColor:
                              Color.fromRGBO(246, 140, 31, 1.0)),
                          Text("option2",
                              style: Theme.of(context).textTheme.body2)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Checkbox(
                              key: null,
                              onChanged: checkChanged,
                              value: false,
                              activeColor:
                              Color.fromRGBO(246, 140, 31, 1.0)),
                          Text("option1",
                              style: Theme.of(context).textTheme.body2)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Checkbox(
                              key: null,
                              onChanged: checkChanged,
                              value: false,
                              activeColor:
                              Color.fromRGBO(246, 140, 31, 1.0)),
                          Text("option1",
                              style: Theme.of(context).textTheme.body2)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
