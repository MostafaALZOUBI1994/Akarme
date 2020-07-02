import 'package:akarme/Drawer_items/AddAD.dart';
import 'package:akarme/User/Carouselnew.dart';
import 'package:akarme/User/DialogClipper.dart';
import 'package:akarme/NavigationBar/navigationpage.dart';
import 'package:akarme/User/editUserInfo.dart';
import 'package:akarme/User/userDetail.dart';
import 'package:akarme/Drawer_items/drawer.dart';
import 'package:flutter/material.dart';

import 'package:akarme/User/user.dart';

class users extends StatelessWidget {
  bool val;
  users.Named(this.val);
  users();
  User u = new User("assets/user2.jpg", "text", "text", "text", "text", "text",
      "text", "text", "text", "text");
  double _imageHeight = 260.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawers(),
        body: Container(
          decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.srcOver,
            color: Theme.of(context).primaryColor.withOpacity(0.9),
          ),
          child: new ListView(
            children: [
              new Stack(
                children: <Widget>[
                  _buildIamge(),
                  _buildTopHeader(context),
                  _buildProfileRow(context),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              _buildContainer(context),
              SizedBox(
                height: 10.0,
              ),
              new Lista(),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ));
  }

  Widget _buildIamge() {
    return new ClipPath(
      clipper: DialogonalClipper(),
      child: new Image.asset(
        'assets/background.jpg',
        fit: BoxFit.fitHeight,
        height: _imageHeight,
        colorBlendMode: BlendMode.srcOver,
        color: new Color.fromARGB(150, 16, 67, 122),
      ),
    );
  }

  Widget _buildTopHeader(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: Icon(Icons.arrow_back, size: 32.0, color: Colors.white),
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Text("User Page",
                  style: Theme.of(context).textTheme.body2),
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).accentColor.withOpacity(0.7),
            ),
            child: new IconButton(
                icon: Icon(Icons.add),
                tooltip: "Add AD",
                color: Colors.white,
                splashColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new AddAD()));
                }),
          ),
          new IconButton(
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new Navigation(true)));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            minRadius: 35.0,
            maxRadius: 35.0,
            backgroundImage: new AssetImage(u.image),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(u.username, style: Theme.of(context).textTheme.title),
                new Text(u.address, style: Theme.of(context).textTheme.button),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return Expanded(
      flex:1,
      child: SizedBox(
          height: 50.0,
          child: new RaisedButton(
            //disabledColor: Colors.orangeAccent,
            color: Theme.of(context).accentColor,
            splashColor: Theme.of(context).primaryColor,
            elevation: 10.0,
            child: new Text("Details", style: Theme.of(context).textTheme.button),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Details()),
              );
            }),
          ),
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return Expanded(
      flex:1,
      child: SizedBox(
          height: 50.0,
          child: new RaisedButton(
            //disabledColor: Colors.orangeAccent,
            color: Theme.of(context).accentColor,
            splashColor: Theme.of(context).primaryColor,
            elevation: 10.0,
            child: new Text("Edit", style: Theme.of(context).textTheme.button),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Edit_user_info()),
              );
            }),
          ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          makecard("Name", u.name, Icons.person, context),
          makecard("User Name", u.username, Icons.account_circle, context),
          makecard("Email", u.email, Icons.mail, context),
          makecard("Mobile", u.mobile, Icons.phone_android, context),
          makecard("Address", u.address, Icons.location_on, context),
          makecard("Register", u.register, Icons.store, context),
          makecard(
              "Facebook Account", u.faceaccount, Icons.account_box, context),
          makecard(
              "Twitter Account", u.twitteraccount, Icons.account_box, context),
          makecard(
              "LinkedIn Account", u.linkedaccount, Icons.account_box, context),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailButton(context),
                SizedBox(width:10.0),
                _buildEditButton(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget makecard(
      String label, String info, IconData icon, BuildContext context) {
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
          ),
          child: makeListTile(label, info, icon),
        ));
  }

  Widget makeListTile(String label, String info, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(
            width: 1.0,
            color: Color.fromRGBO(246, 140, 31, 1.0).withOpacity(0.8),
          )),
        ),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        label,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      subtitle: Row(
        children: <Widget>[Text(info, style: TextStyle(color: Colors.white))],
      ),
    );
  }
}
