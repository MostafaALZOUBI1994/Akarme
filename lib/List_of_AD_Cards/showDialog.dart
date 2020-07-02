import 'package:flutter/material.dart';

class DialogA extends StatefulWidget {
  @override
  _DialogAState createState() => _DialogAState();
}

class Reason {
  const Reason(this.name);
  final String name;
}

class _DialogAState extends State<DialogA> {
  static Reason selectedReason = const Reason('Undefined');
  List<Reason> Reasons = <Reason>[
    const Reason('Undefined'),
    const Reason('Bad Picture'),
    const Reason('Unavailable Property '),
    const Reason('No Answer'),
    const Reason('No Details'),
    const Reason('Wrong Address'),
    const Reason("I haven't been replied by the broker"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      padding: EdgeInsets.all(2.0),
      child: _buildDialog(),
    );
  }

  Widget BuildDrop() {
    final ReasonsD = DropdownButtonHideUnderline(
      child: DropdownButton<Reason>(
        isExpanded: true,
        value: selectedReason,
        isDense: true,
        iconSize: 30.0,
        onChanged: (Reason newValue) {
          setState(() {
            selectedReason = newValue;
          });
        },
        items: Reasons.map((Reason type) {
          return new DropdownMenuItem<Reason>(
            value: type,
            child: new Text(type.name,
                style: Theme.of(context).textTheme.display1),
          );
        }).toList(),
      ),
    );
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      padding: EdgeInsets.all(2.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(25.0),
        border: new Border.all(
          width: 3.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: ReasonsD),
        ],
      ),
    );
  }

  Widget _buildDialog() {
    return new SimpleDialog(
      title: new Text("Report the Prperty"),
      children: <Widget>[
        new Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Divider(),
                _buildTextField("Email", Icons.email),
                _buildTextField("Notes", Icons.note),
                BuildDrop(),
                Divider(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildButton("Send"),
                      SizedBox(width: 10.0),
                      _buildButton("Close")
                    ]),
              ],
            )),
      ],
    );
  }

  Widget _buildTextField(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: new Container(
              height: 50.0,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(25.0),
                border: new Border.all(
                    width: 3.0, color: Theme.of(context).primaryColor),
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      icon,
                      color: Color.fromRGBO(246, 140, 31, 1.0).withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                    labelText: text,
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text) {
    return SizedBox(
      height: 30.0,
      child: new RaisedButton(
          //disabledColor: Colors.orangeAccent,
          color: Theme.of(context).primaryColor,
          splashColor: Theme.of(context).splashColor,
          elevation: 10.0,
          child: new Text(text,
              style: new TextStyle(
                color: Colors.white,
              )),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () {
            if (text == "Close") {
              Navigator.of(context, rootNavigator: true).pop(DialogA);
            }
            ;
          }),
    );
  }
}
