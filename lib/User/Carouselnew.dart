import 'package:akarme/List_of_AD_Cards/Ad_details.dart';
import 'package:akarme/List_of_AD_Cards/editAD.dart';
import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: _buildCarousel(context),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),
              child:new Text(
                "User's ADs",
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.start,
              ),
        ),
        SizedBox(
          height: 300.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.9),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(16, 67, 122, 1.0),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[Text("text")],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.zoom_out_map),
                          Text(
                            "text",
                            style: Theme.of(context).textTheme.body1,
                          ),
                          Icon(Icons.location_on),
                          Text(
                            "text",
                            style: Theme.of(context).textTheme.body1,
                          ),
                          Icon(Icons.home),
                          Text(
                            "text",
                            style: Theme.of(context).textTheme.body1,
                          )
                        ],
                      ),
                      Divider(),
                      Container(
                        height: 39.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new RaisedButton(
                              colorBrightness: Brightness.dark,
                              color: Theme.of(context).primaryColor,
                              elevation: 8.0,
                              disabledColor: Colors.white,
                              splashColor: Theme.of(context).accentColor,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              child: new Text("Details",
                                  style: new TextStyle(
                                    color: Colors.white,
                                  )),
                              onPressed: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) {
                                  return new CardDetail();
                                }));
                              },
                            ),
                            new SizedBox(width: 20.0),
                            new RaisedButton(
                              colorBrightness: Brightness.dark,
                              color: Theme.of(context).primaryColor,
                              elevation: 8.0,
                              disabledColor: Colors.white,
                              splashColor: Theme.of(context).accentColor,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              child: new Text("Edit",
                                  style: new TextStyle(
                                    color: Colors.white,
                                  )),
                              onPressed: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) {
                                  return new EditAD();
                                }));
                              },
                            ),
                            new SizedBox(width: 20.0),
                            new RaisedButton(
                              colorBrightness: Brightness.dark,
                              disabledColor: Theme.of(context).primaryColor,
                              elevation: 8.0,
                              splashColor: Theme.of(context).accentColor,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              child: new Text("Remove",
                                  style: new TextStyle(
                                    color: Colors.white,
                                  )),
                              onPressed: null,
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
    );
  }
}
