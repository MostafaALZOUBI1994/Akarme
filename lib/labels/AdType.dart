import 'package:flutter/material.dart';

class AdType {
  const AdType(this.label);
  final String label;
}

class ADduration {
  const ADduration(this.label);
  final String label;
}

class Type extends StatefulWidget {
  @override
  _TypeState createState() => _TypeState();
}

class _TypeState extends State<Type> {
  AdType selectedAdType = const AdType('Undefined');
  ADduration selectedduration = const ADduration('Undefined');
  List<AdType> users = <AdType>[
    const AdType('Undefined'),
    const AdType('Sell'),
    const AdType('Rent')
  ];
  List<ADduration> durations = <ADduration>[
    const ADduration("Undefined"),
    const ADduration("Daily"),
    const ADduration("Monthly"),
    const ADduration("Six-Month"),
    const ADduration("Yearly"),
  ];

  bool _isad(int n) {
    if (selectedAdType == users[n]) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildType(),
        _buildDuration(),
      ],
    );
  }

  Widget _buildType() {
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("Ad Type", style: Theme.of(context).textTheme.display1),
            ),
          ),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<AdType>(
                isExpanded: true,
                value: selectedAdType,
                style: Theme.of(context).textTheme.display1,
                isDense: true,
                iconSize: 30.0,
                onChanged: (AdType newValue) {
                  setState(() {
                    selectedAdType = newValue;
                  });
                },
                items: users.map((AdType type) {
                  return new DropdownMenuItem<AdType>(
                    value: type,
                    child: new Text(type.label,
                        style: Theme.of(context).textTheme.display1),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDuration() {
    return new Container(
      child: new Offstage(
          offstage: _isad(2) != true,
          child: new TickerMode(
              enabled: _isad(2) == true,
              child: new Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                padding: EdgeInsets.all(2.0),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(25.0),
                  border: new Border.all(
                      width: 3.0, color: Theme.of(context).primaryColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Ad Duration",
                            style: Theme.of(context).textTheme.display1),
                      ),
                    ),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<ADduration>(
                          isExpanded: true,
                          value: selectedduration,
                          style: Theme.of(context).textTheme.display1,
                          isDense: true,
                          iconSize: 30.0,
                          onChanged: (ADduration newValue) {
                            setState(() {
                              selectedduration = newValue;
                            });
                          },
                          items: durations.map((ADduration type) {
                            return new DropdownMenuItem<ADduration>(
                              value: type,
                              child: new Text(type.label,
                                  style: Theme.of(context).textTheme.display1),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
