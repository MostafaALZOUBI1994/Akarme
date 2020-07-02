import 'package:akarme/NavigationBar/navigationpage.dart';
import 'package:flutter/material.dart';
class login2 extends StatefulWidget {
  @override
  _login2State createState() => _login2State();
}

class _login2State extends State<login2> with SingleTickerProviderStateMixin{
  AnimationController _loginButtonController;
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000),
        vsync: this
    );
  }
  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    }
    on TickerCanceled{}
  }
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
        labelText: text,
        labelStyle: Theme.of(context).textTheme.display2,
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Object func) {
    return new Container(
      width: 320.0,
      height: 50.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color:  Theme.of(context).buttonColor,
        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
      ),
      child: new Text(
        "Sign In",
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

