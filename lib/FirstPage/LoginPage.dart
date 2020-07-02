import 'package:akarme/NavigationBar/navigationpage.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Theme.of(context).primaryColorDark.withOpacity(0.2),
                BlendMode.dstATop),
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              "assets/Akarme.png",
              width: 200.0,
              height: 200.0,
            ),
            _buildTextField("User Name", context),
            SizedBox(
              height: 20.0,
            ),
            _buildTextField("Password", context),
            SizedBox(
              height: 20.0,
            ),
            _buildButton(context, "Login", Navigation(true)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String text, BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.display1,
      decoration: new InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        enabledBorder: new OutlineInputBorder(
          borderSide:
              BorderSide(width: 2.0, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide:
              BorderSide(width: 2.0, color: Theme.of(context).splashColor),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        border: new OutlineInputBorder(
          borderSide:
              BorderSide(width: 2.0, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        hintText: text,

        hintStyle: Theme.of(context).textTheme.display2,
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Object func) {
    return new SizedBox(
      width: 300.0,
      height: 50.0,
      child: new RaisedButton(
        disabledColor: Theme.of(context).disabledColor,
        color: Theme.of(context).buttonColor,
        splashColor: Theme.of(context).splashColor,
        elevation: 100.0,
        child: new Text(text, style: Theme.of(context).textTheme.button),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => func),
          );
        },
      ),
    );
  }
}
