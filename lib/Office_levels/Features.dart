import 'package:flutter/material.dart';


class OfficeFeatures extends StatefulWidget {
  bool independent_office;
  bool shared_office;
  bool generator;
  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<OfficeFeatures> {
  void checkChanged(bool value) {
    if (value == true) {
      value = false;
    } else {
      value = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Features:",
                  style: Theme.of(context).textTheme.body2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                              value: false),
                          Text("option1",
                              style: Theme.of(context).textTheme.body2),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Checkbox(
                              key: null,
                              onChanged: checkChanged,
                              value: false),
                          Text("option2",
                              style: Theme.of(context).textTheme.body2),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Checkbox(
                              key: null,
                              onChanged: checkChanged,
                              value: false),
                          Text("option1",
                              style: Theme.of(context).textTheme.body2)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
