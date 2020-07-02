import 'package:akarme/Drawer_items/drawer.dart';
import 'package:akarme/Navigation_Bar_Pages/AdvertismentType.dart';
import 'package:akarme/Navigation_Bar_Pages/Broker.dart';
import 'package:akarme/Navigation_Bar_Pages/MainPage.dart';
import 'package:akarme/User/userPage.dart';
import 'package:flutter/material.dart';
import 'package:akarme/Navigation_Bar_Pages/Searchpage.dart';

class Navigation extends StatefulWidget {
  static const String routeName = "/Navigationpage";
  bool Enter;
  String title;
  String page;
  Navigation(this.Enter);
  @override
  _NavState createState() => _NavState(Enter);
}

class _NavState extends State<Navigation> {
  bool Enter;
  _NavState(this.Enter);
  int index = 0;

  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      drawer: Drawers(),
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: index != 0,
            child: new TickerMode(
              enabled: index == 0,
              child: new Scaffold(
                  appBar: _buildAppBar("Main Page", context),
                  body: new MainPage("Special ADs", "MainPage")),
            ),
          ),
          new Offstage(
            offstage: index != 1,
            child: new TickerMode(
              enabled: index == 1,
              child: Scaffold(
                  appBar: _buildAppBar("Search Page", context),
                  body: Center(child: new req())),
            ),
          ),
          new Offstage(
            offstage: index != 2,
            child: new TickerMode(
              enabled: index == 2,
              child: Scaffold(
                  appBar: _buildAppBar("Broker Page", context),
                  body: Broker(
                    "Brokers List",
                    "Broker Page",
                  )),
            ),
          ),
          new Offstage(
            offstage: index != 3,
            child: new TickerMode(
              enabled: index == 3,
              child: Scaffold(
                  appBar: _buildAppBar("Advertisment Type", context),
                  body: new TabBarad()),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.white,
            disabledColor: Theme.of(context).accentColor,
            buttonColor: Colors.orange,
            bottomAppBarColor: Colors.orangeAccent,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light

            splashColor: Colors.orange,
            textTheme: Theme.of(context).textTheme),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
              title: new Text(
                "Main Page",
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
              title: new Text(
                "Search",
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.account_balance,
                color: Theme.of(context).primaryColor,
              ),
              title: new Text("Broker",
                  style: Theme.of(context).textTheme.display2),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.add_shopping_cart,
                color: Theme.of(context).primaryColor,
              ),
              title: new Text("Advertisement",
                  style: Theme.of(context).textTheme.display2),
            ),
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
            icon: new Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        title: new Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          new Stack(children: <Widget>[
            new Offstage(
              offstage: this.Enter != true,
              child: new TickerMode(
                enabled: this.Enter == true,
                child: new IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => users(),
                        ));
                  },
                ),
              ),
            ),
            new Offstage(
              offstage: this.Enter != false,
              child: new TickerMode(
                  enabled: this.Enter == false,
                  child: new IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
            ),
          ]),
        ]);
  }
}
