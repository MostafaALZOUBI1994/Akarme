import 'package:akarme/FirstPage/CreateAccount.dart';
import 'package:akarme/NavigationBar/navigationpage.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
          body: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Theme.of(context).primaryColorDark.withOpacity(0.2),
                      BlendMode.dstATop),
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Image.asset(
                      "assets/Akarme.png",
                      width: 200.0,
                      height: 200.0,
                    ),
                    _buildColumn(context),
                  ]))),
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

  Widget _buildFlatButton(BuildContext context) {
    return new FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Navigation(false)),
          );
        },
        splashColor: Theme.of(context).splashColor,
        child: new Text(
          "LOGIN AS A GUEST",
          style: Theme.of(context).textTheme.display1,
        ));
  }

  Widget _buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildButton(context, "SIGN UP", create()),
        SizedBox(
          height: 20.0,
        ),
        _buildButton(context, "LOGIN", login()),
        SizedBox(
          height: 20.0,
        ),
        _buildFlatButton(context),
      ],
    );
  }
}
