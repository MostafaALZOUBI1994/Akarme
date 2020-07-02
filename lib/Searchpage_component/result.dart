import 'package:akarme/Drawer_items/drawer.dart';
import 'package:flutter/material.dart';
import 'package:akarme/List_of_AD_Cards/Ad_list.dart';

class Result extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new Drawers(),
      appBar: _buildAppBar("Result Page", context),
      body: new ADList("ADs: ", "Result Page"),
    );
  }

  Widget _buildAppBar(String title, BuildContext context) {
    return AppBar(
      elevation: 0.3,
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      leading: new IconButton(
          icon: new Icon(Icons.settings),
          onPressed: () => _scaffoldKey.currentState.openDrawer()),
      title: new Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      actions: <Widget>[
        new IconButton(
          icon: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
