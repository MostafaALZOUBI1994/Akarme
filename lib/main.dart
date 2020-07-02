import 'package:akarme/Drawer_items/AddAD.dart';
import 'package:akarme/Drawer_items/calluspage.dart';
import 'package:akarme/FirstPage/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(16, 67, 122, 1.0),
        accentColor: Color.fromRGBO(246, 140, 31, 1.0),
        scaffoldBackgroundColor: Colors.grey[50],
        // Define the default Font Family
        fontFamily: 'Montserrat',
        splashColor: Color.fromRGBO(246, 140, 31, 1.0),
        buttonColor: Color.fromRGBO(16, 67, 122, 1.0),

        bottomAppBarColor: Colors.white,
        backgroundColor: Colors.white,
        primaryColorDark: Colors.black,
        textSelectionColor: Colors.white,
        indicatorColor: Color.fromRGBO(16, 67, 122, 1.0),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentIconTheme: IconThemeData(
          color: Color.fromRGBO(246, 140, 31, 1.0),
        ),
        selectedRowColor: Color.fromRGBO(16, 67, 122, 0.9),
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        materialTapTargetSize: MaterialTapTargetSize.padded,
        textTheme: TextTheme(
          button: TextStyle(fontSize: 16.0, color: Colors.white),
          title: TextStyle(
              color: Colors.white,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
          display1: TextStyle(
              fontSize: 16.0, color: Color.fromRGBO(16, 67, 122, 1.0)),
          display2: TextStyle(
              fontSize: 14.0, color: Color.fromRGBO(16, 67, 122, 1.0)),
          display3: TextStyle(
              fontSize: 12.0, color: Color.fromRGBO(246, 140, 31, 1.0)),
          display4: TextStyle(
              fontSize: 20.0,
              color: Color.fromRGBO(16, 67, 122, 1.0),
              fontWeight: FontWeight.bold,
              fontFamily: 'Arvo'),
          body1: TextStyle(fontSize: 16.0, color: Colors.black),
          body2: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
      title: 'Flutter Demo',
      home: homePage(),
      routes: <String, WidgetBuilder>
    {
    // define the routes
    Call_us_page.routeName: (BuildContext context) => new
    Call_us_page(),
    AddAD.routeName: (BuildContext
    context) => new AddAD(),
    });
  }
}
