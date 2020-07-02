import 'package:akarme/List_of_AD_Cards/AD.dart';
import 'package:akarme/List_of_AD_Cards/Ad_details.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  Color mainColor = const Color.fromRGBO(16, 67, 122, 1.0);
  Color orang = Color.fromRGBO(246, 140, 31, 1.0);
  String title;
  String pagetitle;

  MainPage(this.title, this.pagetitle);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[50],
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
  Ad c = new Ad("Rent house", "240 meter", "Damascus", "House", "text", "text",
      "text", "text", "text",1);

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
                              Text(
                                c.Area,
                                style: Theme.of(context).textTheme.display1,
                              ),
                              Icon(Icons.location_on),
                              Text(
                                c.Location,
                                style: Theme.of(context).textTheme.display1,
                              ),
                              Icon(Icons.home),
                              Text(
                                c.type,
                                style: Theme.of(context).textTheme.display1,
                              )
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
                                  splashColor: Theme.of(context).splashColor,
                                  elevation: 100.0,
                                  child: new Text(
                                    "Details",
                                    style: Theme.of(context).textTheme.button,
                                  ),
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
                                      Color.fromRGBO(16, 67, 122, 1.0),
                                  color: Color.fromRGBO(246, 140, 31, 1.0),
                                  splashColor: Color.fromRGBO(16, 67, 122, 1.0),
                                  elevation: 100.0,
                                  child: new Text(
                                    "Price",
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        child: _buildDialog(context));
                                  },
                                ),
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

  Widget _buildDialog(BuildContext context) {
    return new SimpleDialog(
      title: new Text("text"),
      children: <Widget>[
        new Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text("Price Information"),
              ],
            )),
      ],
    );
  }
}
