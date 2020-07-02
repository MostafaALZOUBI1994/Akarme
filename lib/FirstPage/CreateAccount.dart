import 'package:akarme/User/userPage.dart';
import 'package:akarme/Drawer_items/drawer.dart';
import 'package:flutter/material.dart';

class create extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new Drawers(),
      appBar: _buildAppBar("Create Account Page", context),
      body: ListView(
          children: <Widget>[
            SizedBox(height: 5.0,),
            _buildTextField("Name", Icons.account_circle, context),
            _buildTextField("Mobile Number", Icons.phone, context),
            _buildTextField("Email", Icons.email, context),
            _buildTextField("User Name", Icons.account_box, context),
            _buildTextField("Password", Icons.https, context),
            RadioButton(),
            _buildButton(context),
          ],
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

  Widget _buildTextField(String text, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      child: Row(
        children: [
          Expanded(
             child:new Container(
                height: 50.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(25.0),
                  border: new Border.all(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        icon,
                        color: Theme.of(context).accentColor.withOpacity(0.8),
                      ),
                      border: InputBorder.none,
                      hintText: text,
                      hintStyle: Theme.of(context).textTheme.display1),
                ),
            ),
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
          color: Theme.of(context).primaryColor,
          splashColor: Theme.of(context).accentColor,
          elevation: 10.0,
          child: new Text("Create Account",
              style: Theme.of(context).textTheme.button),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => users()),
            );
          },
        ),
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int _radioValue;
  int _result = 0;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          _result = 0;
          break;
        case 1:
          _result = 1;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
      child: new Container(
          padding: EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(25.0),
            border: new Border.all(
              width: 2.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children:[
                  Icon(
                    Icons.photo_library,
                    color: Theme.of(context).accentColor.withOpacity(0.8),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: new Text(
                    'Account Type  :',
                    style: Theme.of(context).textTheme.display1,
                ),
                  ),]
              ),
              Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: Row(
                  children: [
                    new Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                      activeColor: Theme.of(context).splashColor,
                    ),
                    new Text(
                      'Paid Account',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: Row(
                  children: [
                    new Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                      activeColor: Theme.of(context).splashColor,
                    ),
                    new Text(
                      'Real Estate Account',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
