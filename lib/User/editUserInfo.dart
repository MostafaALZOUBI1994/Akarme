import 'package:akarme/Drawer_items/drawer.dart';
import 'package:akarme/User/userDetail.dart';
import 'package:flutter/material.dart';

class Edit_user_info extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawers(),
      appBar: new AppBar(
        title: Text("Edit User Information"),
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
        decoration: new BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.9),
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            _buildImage(context),
            _buildTextField("Name", Icons.account_circle, context),
            _buildTextField("User Name", Icons.account_box, context),
            _buildTextField("Email", Icons.email, context),
            _buildTextField("Mobile Number", Icons.phone, context),
            _buildTextField("address", Icons.location_on, context),
            _buildTextField("Register", Icons.receipt, context),
            _buildTextField("Facebook Account", Icons.account_box, context),
            _buildTextField("Twitter Account", Icons.account_box, context),
            _buildTextField("LinkedIn Account", Icons.account_box, context),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: InkWell(
        child: Container(
            width: 200.0,
            height: 200.0,
            child: FittedBox(
              child: Stack(children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("assets/user2.jpg"),
                  radius: 30.0,
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: _buildaddButton(context),
                )
              ]),
            )),
        onTap: () {},
      ),
    );
  }

  Widget _buildTextField(String text, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: new Container(
              height: 50.0,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(25.0),
                border: new Border.all(
                  width: 2.0,
                  color: Theme.of(context).accentColor,
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    icon,
                    color: Color.fromRGBO(246, 140, 31, 1.0).withOpacity(0.8),
                  ),
                  border: InputBorder.none,
                  hintText: text,
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: SizedBox(
        height: 50.0,
        child: new RaisedButton(
          //disabledColor: Colors.orangeAccent,
          color: Theme.of(context).accentColor.withOpacity(0.9),
          splashColor: Theme.of(context).primaryColor,
          elevation: 10.0,
          child: new Text("Update", style: Theme.of(context).textTheme.button),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Details()),
            );
          },
        ),
      ),
    );
  }

  Widget _buildaddButton(BuildContext context) {
    return new Container(
      width: 15.0,
      height: 15.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
          color: Theme.of(context).accentColor.withOpacity(0.8),
          shape: BoxShape.circle),
      child: new Icon(
        Icons.camera_alt,
        size: 10.0,
        color: Colors.white,
      ),
    );
  }
}
