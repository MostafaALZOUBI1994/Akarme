import 'package:akarme/List_of_AD_Cards/AD.dart';
import 'package:akarme/List_of_AD_Cards/Ad_details.dart';
import 'package:akarme/Drawer_items/drawer.dart';
import 'package:flutter/material.dart';

class ADList extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Color mainColor = const Color.fromRGBO(16, 67, 122, 1.0);
  Color orang = Color.fromRGBO(246, 140, 31, 1.0);
  String title;
  String pagetitle;
  ADList(this.title, this.pagetitle);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[50],
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
  Ad c = new Ad("AD Type", "text", "Area", "Location", "Type", "text", "text",
      "text", "text",1);

  final i;
  Color mainColor = const Color.fromRGBO(16, 67, 122, 1.0);
  CardCell(this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 18.0 / 8.0,
                      child: Image.asset(
                        'assets/background.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 12.0, 6.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[Text(c.ADType)],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.zoom_out_map),
                              Text(c.Area),
                              Icon(Icons.location_on),
                              Text(c.Location),
                              Icon(Icons.home),
                              Text(c.type)
                            ],
                          ),
                          Divider(),
                          Container(
                            height: 20.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new RaisedButton(
                                  disabledColor: Colors.orangeAccent,
                                  color: Theme.of(context).primaryColor,
                                  splashColor: Theme.of(context).accentColor,
                                  elevation: 100.0,
                                  child: new Text("Details",
                                      style: new TextStyle(
                                        color: Colors.white,
                                      )),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  onPressed: () {
                                    Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (context) {
                                      return new CardDetail();
                                    }));
                                  },
                                ),
                                new RaisedButton(
                                    disabledColor:
                                        Theme.of(context).primaryColor,
                                    color: Theme.of(context).accentColor,
                                    splashColor: Theme.of(context).primaryColor,
                                    elevation: 100.0,
                                    child: new Text("Price",
                                        style: new TextStyle(
                                          color: Colors.white,
                                        )),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      print("bla");
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.only(top: 16.0),
        )
      ],
    );
  }
}
