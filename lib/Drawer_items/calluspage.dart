import 'package:akarme/Drawer_items/drawer.dart';
import 'package:flutter/material.dart';


class Call_us_page extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static const String routeName = "/calluspage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new Drawers(),
      appBar: _buildAppBar("Call Us Page", context),
      body: ListView(children: [_buildmap(context), _buildCard(context)]),
    );
  }

  Widget _buildAppBar(String title, BuildContext context) {
    return AppBar(
      elevation: 0.3,
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
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

  Widget _buildmap(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150.0,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(25.0),
          border: new Border.all(
            width: 3.0,
            color: Theme.of(context).primaryColor,
          ),
          color: Theme.of(context).primaryColor,
        ),
        child: FittedBox(
        child: Text(
          "Google map",
          style: TextStyle(color: Colors.white, fontSize: 5.0),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildAddressRow(context),
              _buildInfoRow(context),
              _buildIconRow(context),
              _buildTextField("name", Icons.account_circle, context),
              _buildTextField("Email", Icons.email, context),
              _buildTextField("Location", Icons.location_on, context),
              _buildTextField("Message", Icons.mail, context),
              _buildButton(context),
            ]),
      ),
    );
  }

  Widget _buildAddressRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
        child: new Row(
          children: <Widget>[
            Center(
                child: new Text(
              "Title",
              style: Theme.of(context).textTheme.display4,
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
        child: new Row(
          children: <Widget>[
            Center(
                child: new Text(
              "information",
              style: Theme.of(context).textTheme.body1,
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildIconRow(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(5.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.zoom_out_map, color: Theme.of(context).primaryColor),
          Text(
            "text",
            style: Theme.of(context).textTheme.display2,
          ),
          Icon(Icons.location_on, color: Theme.of(context).primaryColor),
          Text(
            "text",
            style: Theme.of(context).textTheme.display2,
          ),
          Icon(Icons.home, color: Theme.of(context).primaryColor),
          Text(
            "text",
            style: Theme.of(context).textTheme.display2,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String text, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child:  new Container(
                height: 50.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(25.0),
                  border: new Border.all(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: TextField(
                  key: GlobalKey(debugLabel: 'inputText'),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      icon,
                      color: Theme.of(context).accentColor.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    hintText: text,
                    hintStyle: Theme.of(context).textTheme.display2,
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
          height: 50.0,
          child: new RaisedButton(
              //disabledColor: Colors.orangeAccent,
              color: Theme.of(context).primaryColor,
              splashColor: Theme.of(context).accentColor,
              elevation: 10.0,
              child: new Text(
                "Send",
                style: Theme.of(context).textTheme.button,
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () {
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  backgroundColor: Theme.of(context).accentColor.withOpacity(0.8),
                  content: Text(
                    'Your message has been sent successfully',
                    style: Theme.of(context).textTheme.button,
                  ),
                ));
              })),
    );
  }
}

