import 'package:akarme/List_of_AD_Cards/carousel.dart';
import 'package:akarme/List_of_AD_Cards/showDialog.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'AD.dart';

class Reason {
  const Reason(this.name);
  final String name;
}

class CardDetail extends StatelessWidget {
  Ad newAd = Ad('9898494', 'decoration', 'type', 'Location', 'Area', 'ADType',
      'Furniture', 'price', 'property',1);
  var image_url = "assets/background.jpg";
  List<Reason> cities = <Reason>[
    const Reason('Undefined'),
    const Reason('Bad Picture'),
    const Reason('Unavailable Property '),
    const Reason('No Answer'),
    const Reason('No Details'),
    const Reason('Wrong Address'),
    const Reason("I haven't been replaied by the broker"),
  ];
  Color mainColor = const Color.fromRGBO(16, 67, 122, 1.0);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(fit: StackFit.expand, children: [
        _buildImage(),
        _buildBackDropFilter(),
        _buildSingleChild(context),
      ]),
    );
  }

  Widget _buildImage() {
    return new Image.asset(
      image_url,
      fit: BoxFit.cover,
    );
  }

  Widget _buildBackDropFilter() {
    return BackdropFilter(
      filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: new Container(
        color: Color.fromRGBO(16, 67, 122, 1.0).withOpacity(0.5),
      ),
    );
  }

  Widget _buildTopHeader(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.arrow_back, size: 32.0, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          new Expanded(
            child: new Text("AD Details",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title),
          ),
        ],
      ),
    );
  }

  Widget _buildInkwell(BuildContext context) {
    return new InkWell(
        child: Container(
          alignment: Alignment.center,
          child: new Container(
            width: 400.0,
            height: 400.0,
          ),
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              image: new DecorationImage(
                  image: new AssetImage(image_url), fit: BoxFit.cover),
              boxShadow: [
                new BoxShadow(
                    color: Colors.black,
                    blurRadius: 20.0,
                    offset: new Offset(0.0, 10.0))
              ]),
        ),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => new caro()),
            ));
  }

  Widget _buildAddressRow() {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text(
            newAd.ADType,
            style: new TextStyle(
                color: Colors.white, fontSize: 30.0, fontFamily: 'Arvo'),
          )),
          new Text(
            newAd.Number,
            style: new TextStyle(
                color: Colors.white, fontSize: 20.0, fontFamily: 'Arvo'),
          )
        ],
      ),
    );
  }

  Widget _buildIconRow() {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.zoom_out_map),
          Text(newAd.Area),
          Icon(Icons.location_on),
          Text(newAd.Location),
          Icon(Icons.home),
          Text(newAd.type)
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        new Text("Adtype " + newAd.ADType,
            style: Theme.of(context).textTheme.body2),
        new Text("Ad Number " + newAd.Number,
            style: Theme.of(context).textTheme.body2),
        new Text("Property " + newAd.property,
            style: Theme.of(context).textTheme.body2),
        new Text("text " + newAd.price,
            style: Theme.of(context).textTheme.body2),
        new Text("text " + newAd.Furniture,
            style: Theme.of(context).textTheme.body2),
        new Text("text " + newAd.decoration,
            style: Theme.of(context).textTheme.body2),
        new Text("text " + newAd.Location,
            style: Theme.of(context).textTheme.body2),
        new Text("text " + newAd.price,
            style: Theme.of(context).textTheme.body2),
        new Text("text " + newAd.Area,
            style: Theme.of(context).textTheme.body2),
      ],
    );
  }

  Widget _buildRaisedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new RaisedButton(
            disabledColor: Theme.of(context).primaryColor,
            color: Theme.of(context).accentColor,
            splashColor: Theme.of(context).primaryColor,
            elevation: 100.0,
            child:
                new Text("Report", style: Theme.of(context).textTheme.button),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              showDialog(context: context, child: DialogA());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSingleChild(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        margin: const EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            _buildTopHeader(context),
            _buildInkwell(context),
            _buildAddressRow(),
            _buildIconRow(),
            _buildInfoRow(context),
            _buildRaisedButton(context),
          ],
        ),
      ),
    );
  }

}
