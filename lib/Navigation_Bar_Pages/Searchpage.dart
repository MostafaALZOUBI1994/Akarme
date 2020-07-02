import 'package:akarme/Drawer_items/drawer.dart';
import 'package:akarme/labels/City.dart';
import 'package:akarme/labels/decore.dart';
import 'package:akarme/labels/estate.dart';
import 'package:akarme/labels/furniture.dart';
import 'package:akarme/labels/propety_bond.dart';
import 'package:akarme/Searchpage_component/range.dart';
import 'package:akarme/Searchpage_component/result.dart';
import 'package:flutter/material.dart';
import 'package:akarme/labels/AdType.dart';
import 'package:flutter/rendering.dart';

class req extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool a = false;

  double _lowerValue = 0.0;
  double _upperValue = 10000000.0;
  double _lowerArea = 0.0;
  double _upperArea = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: new Drawers(),
        body: new Theme(
            data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.grey[50],
                disabledColor: Theme.of(context).accentColor,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light

                splashColor: Colors.orange,
                textTheme: Theme.of(context).textTheme),
            child: ListView(children: <Widget>[
              Type(),
              Cities(),
              EstateType(),
              Decore(),
              Furniture(),
              PropertyBond(),
              RangeSliderSample(
                  _lowerValue, _upperValue, 0.0, 100000000.0, "SP", "Price"),
              RangeSliderSample(
                  _lowerArea, _upperArea, 0.0, 500.0, "m2", "Area"),
              _BuildButton(context),
            ])));
  }

  Widget _BuildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          alignment: Alignment(0.0, 0.0),
          height: 50.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new RaisedButton(
                color: Theme.of(context).primaryColor,
                splashColor: Theme.of(context).accentColor,
                elevation: 10.0,
                child: new Text(
                  "Search",
                  style: Theme.of(context).textTheme.button,
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Result()),
                  );
                },
              ),
            ],
          )),
    );
  }
}
