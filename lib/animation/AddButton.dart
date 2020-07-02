import 'package:akarme/animation/LoginAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  var animationStatus = 0;
  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(seconds: 5), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: new Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Theme.of(context).primaryColorDark.withOpacity(0.2),
                      BlendMode.dstATop),
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: new Container(child:new ListView(
                padding: const EdgeInsets.all(0.0),
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                            ],
                          ),
                          new SizedBox(height: 100.0,),
                          animationStatus == 0
                              ? new Padding(
                            padding: const EdgeInsets.only(top: 400.0),
                            child: _buildButton(context, "Login"),
                          )
                              : new StaggerAnimation(
                              _loginButtonController.view),
                        ],
                      ),
                    ],
                  ))
          ));
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
        labelText: text,
        labelStyle: Theme.of(context).textTheme.display2,
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text) {
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
          setState(() {
            animationStatus = 1;
          });
          _playAnimation();
        },
      ),
    );
  }
}