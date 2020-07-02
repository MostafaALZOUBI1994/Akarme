import 'package:akarme/User/userDetail.dart';
import 'package:akarme/User/userPage.dart';
import 'package:akarme/Drawer_items/drawer.dart';
import 'package:flutter/material.dart';

class EditAD extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new Drawers(),
      appBar: _buildAppBar("Edit AD", context),
      body: Container(
        decoration: new BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.9),
        ),
        child: ListView(
            children: <Widget>[
              SizedBox(height:5.0),
              _buildImage("image", "url", context),
              _buildTextField("AD Name", Icons.account_circle, context),
              _buildTextField("Phone Number", Icons.phone, context),
              _buildTextField("Mobile Number", Icons.phone_android, context),
              _buildTextField("Price (SP)", Icons.attach_money, context),
              _buildTextField("Address", Icons.location_on, context),
              _buildTextField("Register", Icons.book, context),
              _buildTextField("Additional Features", Icons.info, context),
              _buildButton(context),
            ],
          ),
      ),
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
      title: new Text(title, style: Theme.of(context).textTheme.title),
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

  Widget _buildImage(String text, String image, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      child: Stack(
        children:[
        new Container(
               height: 200.0,
                  width: 400.0,
                  decoration: new BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/house2.jpg"),fit: BoxFit.fill),
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
        ),
        Positioned(
          bottom: 5.0,
          right: 5.0,
          child: _buildaddButton(context),
        )
      ],
      ),
    );
  }

  Widget _buildTextField(String text, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
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
                child: TextField(
                    decoration: InputDecoration(
                  prefixIcon: Icon(
                    icon,
                    color: Color.fromRGBO(246, 140, 31, 1.0).withOpacity(0.8),
                  ),
                  border: InputBorder.none,
                  hintText: text,
                  hintStyle: TextStyle(color: Colors.white),
                ))),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
        child: SizedBox(
      height: 50.0,
      child: new RaisedButton(
        //disabledColor: Colors.orangeAccent,
        splashColor: Theme.of(context).primaryColor,
        color: Theme.of(context).accentColor.withOpacity(0.9),
        elevation: 10.0,
        child: new Text("Edit",
            style: new TextStyle(
              color: Colors.white,
            )),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => users()),
          );
        },
      ),)
    );
  }
  Widget _buildaddButton(BuildContext context) {
    return new Container(
      width: 45.0,
      height: 45.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
          color: Theme.of(context).accentColor.withOpacity(0.9),
          shape: BoxShape.circle),
      child: new Icon(
        Icons.camera_alt,
        size: 40.0,
        color: Colors.white,
      ),
    );
  }
}
