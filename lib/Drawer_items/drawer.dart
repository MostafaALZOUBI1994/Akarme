import 'package:akarme/Drawer_items/AddAD.dart';
import 'package:akarme/FirstPage/homepage.dart';
import 'package:akarme/Drawer_items/calluspage.dart';
import 'package:flutter/material.dart';

class Drawers extends StatefulWidget {
  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: new Image.asset("assets/Akarme.png"),
          ),
          _buildListTile("About", Icons.info, context),
          _buildListTile("Privacy Policy", Icons.https, context),
          _buildListTilecall(
            "Call us",
            Icons.phone,
            context,
          ),
          Divider(),
          _buildListTile("Location", Icons.location_on, context),
          _buildListTile("Phone", Icons.phone, context),
          _buildListTile("Email", Icons.email, context),
          _buildListTile("Facebook", Icons.face, context),
          Divider(),
          _buildListTilefreeAD("Add free Ad", Icons.add, context),
          _buildListTile("Pubish", Icons.publish, context),
          _buildListTilelog("Log out", Icons.exit_to_app, context),
        ],
      ),
    );
  }

  Widget _buildListTile(String label, IconData icon, BuildContext context) {
    return new ListTile(
      selected: true,
      onTap: () {
        showDialog(context: context, child: _buildDialog(context));
      },
      leading: new Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: new Text(
        label,
        style: Theme.of(context).textTheme.display2,
      ),
    );
  }

  Widget _buildListTilelog(String label, IconData icon, BuildContext context) {
    return new ListTile(
      selected: true,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => homePage(),
            ));
      },
      leading: new Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: new Text(
        label,
        style: Theme.of(context).textTheme.display2,
      ),
    );
  }

  Widget _buildListTilecall(String label, IconData icon, BuildContext context) {
    return ListTile(
      selected: true,
      onTap: () {
        setState(() {
          // pop closes the drawer
          Navigator.of(context).pop();
          // navigate to the route
          Navigator.of(context).pushNamed(Call_us_page.routeName);
        });
      },
      leading: new Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: new Text(
        label,
        style: Theme.of(context).textTheme.display2,
      ),
    );
  }

  Widget _buildListTilefreeAD(
      String label, IconData icon, BuildContext context) {
    return new ListTile(
      selected: true,
      onTap: () {
        setState(() {
          // pop closes the drawer
          Navigator.of(context).pop();
          // navigate to the route
          Navigator.of(context).pushNamed(AddAD.routeName);
        });
      },
      leading: new Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: new Text(
        label,
        style: Theme.of(context).textTheme.display2,
      ),
    );
  }

  Widget _buildButton(String text, BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: new RaisedButton(
          //disabledColor: Colors.orangeAccent,
          color: Theme.of(context).primaryColor,
          splashColor: Theme.of(context).splashColor,
          elevation: 10.0,
          child: new Text(
            text,
            style: Theme.of(context).textTheme.button,
          ),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(SimpleDialog);
          }),
    );
  }

  Widget _buildDialog(BuildContext context) {
    return new SimpleDialog(
      title: new Text("text"),
      children: <Widget>[
        new Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text("Information"),
                Divider(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_buildButton("Close", context)]),
              ],
            )),
      ],
    );
  }
}
