import 'package:akarme/Drawer_items/drawer.dart';
import 'package:akarme/User/DialogClipper.dart';
import 'package:flutter/material.dart';
import 'package:akarme/User/user.dart';

class Details extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  User u = new User("assets/user2.jpg", "text", "text", "text", "text", "text",
      "text", "text", "text", "text");
  double _imageHeight = 260.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawers(),
        appBar: new AppBar(
          title: Text("User Detail"),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.arrow_forward),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.srcOver,
              color: new Color.fromARGB(150, 16, 67, 122).withOpacity(0.9),
            ),
            child: new ListView(
              children: [
                new Stack(
                  children: <Widget>[
                    _buildIamge(),
                    _buildProfileRow(),
                  ],
                ),
                makecard("Name", u.name, Icons.person),
                makecard("User Name", u.username, Icons.account_circle),
                makecard("Email", u.email, Icons.mail),
                makecard("Mobile", u.mobile, Icons.phone_android),
                makecard("Address", u.address, Icons.location_on),
                makecard("Register", u.register, Icons.store),
                makecard("Facebook Account", u.faceaccount, Icons.account_box),
                makecard(
                    "Twitter Account", u.twitteraccount, Icons.account_box),
                makecard(
                    "LinkedIn Account", u.linkedaccount, Icons.account_box),
              ],
            )));
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
          new Icon(Icons.menu, size: 32.0, color: Colors.white),
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Text(
                "User Detail",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          new IconButton(
            icon: Icon(Icons.arrow_forward),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
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
                new Text(
                  u.username,
                  style: new TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                new Text(
                  u.address,
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget makecard(String label, String info, IconData icon) {
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(16, 67, 122, 0.7),
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
