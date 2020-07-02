import 'package:akarme/Drawer_items/drawer.dart';
import 'package:akarme/List_of_AD_Cards/AD.dart';
import 'package:akarme/User/userPage.dart';
import 'package:flutter/material.dart';

class Broker extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Color mainColor = const Color.fromRGBO(16, 67, 122, 1.0);
  Color orangColor = const Color.fromRGBO(246, 140, 31, 1.0);
  String title;
  String pagetitle;
  Broker(this.title, this.pagetitle);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new Drawers(),
      body: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new CardTitle(mainColor, title),
            new Expanded(
              child: new ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return new Container(
                      child: new CardCell(i),
                      padding: const EdgeInsets.all(0.0),
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  final Color mainColor;
  String title;

  CardTitle(this.mainColor, this.title);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        title,
        style: Theme.of(context).textTheme.display4,
        textAlign: TextAlign.left,
      ),
    );
  }
}

class CardCell extends StatelessWidget {

  final i;
  Color mainColor = const Color.fromRGBO(16, 67, 122, 1.0);
  CardCell(this.i);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          border: new Border.all(
            color: Theme.of(context).primaryColor,
            width: 5.0,
          ),
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Image.asset(
                      'assets/user2.jpg',
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Theme.of(context).backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 6.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text(
                          "Name",
                          style: TextStyle(color: mainColor, fontSize: 20.0),
                        ),
                        Divider(),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Icon(Icons.phone,
                                color: Color.fromRGBO(246, 140, 31, 0.8)),
                            SizedBox(width:5.0),
                            new Text(
                              "Phone Number",
                              style:
                                  TextStyle(color: mainColor, fontSize: 15.0),
                            ),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Icon(
                              Icons.mail,
                              color: const Color.fromRGBO(246, 140, 31, 0.8),
                            ),
                            SizedBox(width:5.0),
                            new Text(
                              "ghoran@gmail.com",
                              style:
                                  TextStyle(color: mainColor, fontSize: 15.0),
                            ),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Icon(
                              Icons.location_on,
                              color: const Color.fromRGBO(246, 140, 31, 0.8),
                            ),
                            SizedBox(width:5.0),
                            new Text(
                              "Damascus",
                              style:
                                  TextStyle(color: mainColor, fontSize: 15.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        new RaisedButton(
                          disabledColor: Colors.orangeAccent,
                          color: Theme.of(context).accentColor.withOpacity(0.8),
                          splashColor: Theme.of(context).primaryColor,
                          elevation: 100.0,
                          child: new Text("Details",
                              style: new TextStyle(
                                color: Colors.white,
                              )),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) {
                              return new users();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
