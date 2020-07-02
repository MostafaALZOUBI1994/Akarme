import 'package:flutter/material.dart';

class Country {
  const Country(this.name);
  final String name;
}

class City {
  const City(this.name);
  final String name;
}

class locations {
  const locations(this.label);
  final String label;
}

class Cities extends StatefulWidget {
  @override
  _CitiesState createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
  Country selectedCountry = const Country('Undefined');
  City selectedCity = const City('Undefined');
  City selectedcityinLeb = const City("Undefined");
  locations selectedlocations = const locations("Duwela");
  locations selectedlocationsRural = const locations("Jaramana");
  locations selectedlocationsHoms = const locations("Homs");
  locations selectedlocationsHama = const locations("Hama");
  locations selectedlocationsIdlib = const locations("Maara-Nuaman");
  locations selectedlocationsAleppo = const locations("Aleppo");
  locations selectedlocationsZahla = const locations("Saad-Naiel");
  locations selectedlocationsDara = const locations("Dara");
  List<Country> Countries = <Country>[
    const Country('Undefined'),
    const Country('Syria'),
    const Country('Lebanon'),
  ];

  List<City> cities = <City>[
    const City('Undefined'),
    const City('Damascus'),
    const City('Damascus Rural'),
    const City('Homs'),
    const City('Hama'),
    const City('Idlib'),
    const City('Aleppo'),
    const City('Daraa'),
  ];
  List<City> lebcity = <City>[
    const City('Undefined'),
    const City('Zahla'),
  ];
  List<locations> locationsDamas = <locations>[
    const locations("Duwela"),
    const locations("Zahira"),
    const locations("Hamesh"),
    const locations("Masake Barzeh")
  ];
  List<locations> locationsrural = <locations>[
    const locations("Jaramana"),
    const locations("Qatana"),
    const locations("Sahnaya"),
  ];
  List<locations> locationhoms = <locations>[
    const locations("Homs"),
  ];
  List<locations> locationhama = <locations>[
    const locations("Hama"),
  ];
  List<locations> locationidlib = <locations>[
    const locations("Maara-Nuaman"),
  ];
  List<locations> locationAlepo = <locations>[
    const locations("Aleppo"),
  ];
  List<locations> locationZahleh = <locations>[
    const locations("Saad-Naiel"),
  ];
  List<locations> locationDara = <locations>[
    const locations("Dara"),
  ];

  bool _isCountry(int n) {
    if (selectedCountry == Countries[n]) {
      return true;
    } else {
      return false;
    }
  }

  bool _is(int n) {
    if (selectedCity == cities[n]) {
      return true;
    } else {
      return false;
    }
  }

  bool _isLebanon(int n) {
    if (selectedcityinLeb == lebcity[n]) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Coun = DropdownButton<Country>(
      isExpanded: true,
      value: selectedCountry,
      isDense: true,
      iconSize: 30.0,
      onChanged: (Country newValue) {
        setState(() {
          selectedCountry = newValue;
        });
      },
      items: Countries.map((Country type) {
        return new DropdownMenuItem<Country>(
          value: type,
          child:
              new Text(type.name, style: Theme.of(context).textTheme.display1),
        );
      }).toList(),
    );
    final city = DropdownButton<City>(
      isExpanded: true,
      value: selectedCity,
      isDense: true,
      iconSize: 30.0,
      onChanged: (City newValue) {
        setState(() {
          selectedCity = newValue;
        });
      },
      items: cities.map((City type) {
        return new DropdownMenuItem<City>(
          value: type,
          child:
              new Text(type.name, style: Theme.of(context).textTheme.display1),
        );
      }).toList(),
    );
    final cityinleb = DropdownButton<City>(
      isExpanded: true,
      value: selectedcityinLeb,
      isDense: true,
      iconSize: 30.0,
      onChanged: (City newValue) {
        setState(() {
          selectedcityinLeb = newValue;
        });
      },
      items: lebcity.map((City type) {
        return new DropdownMenuItem<City>(
          value: type,
          child:
              new Text(type.name, style: Theme.of(context).textTheme.display1),
        );
      }).toList(),
    );
    final dama = DropdownButtonHideUnderline(
      child: DropdownButton<locations>(
        isExpanded: true,
        value: selectedlocations,
        isDense: true,
        iconSize: 30.0,
        onChanged: (locations newValue) {
          setState(() {
            selectedlocations = newValue;
          });
        },
        items: locationsDamas.map((locations type) {
          return new DropdownMenuItem<locations>(
            value: type,
            child: new Text(type.label,
                style: Theme.of(context).textTheme.display1),
          );
        }).toList(),
      ),
    );
    final rural = DropdownButtonHideUnderline(
      child: DropdownButton<locations>(
        isExpanded: true,
        value: selectedlocationsRural,
        isDense: true,
        iconSize: 30.0,
        onChanged: (locations newValue) {
          setState(() {
            selectedlocationsRural = newValue;
          });
        },
        items: locationsrural.map((locations type) {
          return new DropdownMenuItem<locations>(
            value: type,
            child: new Text(type.label,
                style: Theme.of(context).textTheme.display1),
          );
        }).toList(),
      ),
    );

    final homsWidget = DropdownButtonHideUnderline(
      child: DropdownButton<locations>(
        isExpanded: true,
        value: selectedlocationsHoms,
        isDense: true,
        iconSize: 30.0,
        onChanged: (locations newValue) {
          setState(() {
            selectedlocationsHoms = newValue;
          });
        },
        items: locationhoms.map((locations type) {
          return new DropdownMenuItem<locations>(
            value: type,
            child: new Text(type.label,
                style: Theme.of(context).textTheme.display1),
          );
        }).toList(),
      ),
    );
    final hamaWidget = DropdownButtonHideUnderline(
      child: DropdownButton<locations>(
        isExpanded: true,
        value: selectedlocationsHama,
        isDense: true,
        iconSize: 30.0,
        onChanged: (locations newValue) {
          setState(() {
            selectedlocationsHama = newValue;
          });
        },
        items: locationhama.map((locations type) {
          return new DropdownMenuItem<locations>(
            value: type,
            child: new Text(type.label,
                style: Theme.of(context).textTheme.display1),
          );
        }).toList(),
      ),
    );
    final idlibWidget = DropdownButtonHideUnderline(
      child: DropdownButton<locations>(
        isExpanded: true,
        value: selectedlocationsIdlib,
        isDense: true,
        iconSize: 30.0,
        onChanged: (locations newValue) {
          setState(() {
            selectedlocationsIdlib = newValue;
          });
        },
        items: locationidlib.map((locations type) {
          return new DropdownMenuItem<locations>(
            value: type,
            child: new Text(type.label,
                style: Theme.of(context).textTheme.display1),
          );
        }).toList(),
      ),
    );
    final aleppoWidget = DropdownButtonHideUnderline(
      child: DropdownButton<locations>(
        isExpanded: true,
        value: selectedlocationsAleppo,
        isDense: true,
        iconSize: 30.0,
        onChanged: (locations newValue) {
          setState(() {
            selectedlocationsAleppo = newValue;
          });
        },
        items: locationAlepo.map((locations type) {
          return new DropdownMenuItem<locations>(
            value: type,
            child: new Text(type.label,
                style: Theme.of(context).textTheme.display1),
          );
        }).toList(),
      ),
    );
    final daraWidget = DropdownButtonHideUnderline(
      child: DropdownButton<locations>(
        isExpanded: true,
        value: selectedlocationsDara,
        isDense: true,
        iconSize: 30.0,
        onChanged: (locations newValue) {
          setState(() {
            selectedlocationsDara = newValue;
          });
        },
        items: locationDara.map((locations type) {
          return new DropdownMenuItem<locations>(
            value: type,
            child: new Text(type.label,
                style: Theme.of(context).textTheme.display1),
          );
        }).toList(),
      ),
    );
    final zahlehWidget = DropdownButtonHideUnderline(
      child: DropdownButton<locations>(
        isExpanded: true,
        value: selectedlocationsZahla,
        isDense: true,
        iconSize: 30.0,
        onChanged: (locations newValue) {
          setState(() {
            selectedlocationsZahla = newValue;
          });
        },
        items: locationZahleh.map((locations type) {
          return new DropdownMenuItem<locations>(
            value: type,
            child: new Text(type.label,
                style: Theme.of(context).textTheme.display1),
          );
        }).toList(),
      ),
    );

    return Column(
      children: <Widget>[
        Container(
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("Country",
                      style: Theme.of(context).textTheme.display1),
                ),
              ),
              Expanded(child: Coun),
            ],
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: _isCountry(1) != true,
            child: new TickerMode(
              enabled: _isCountry(1) == true,
              child: new Container(
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Cities in Syria",
                            style: Theme.of(context).textTheme.display1),
                      ),
                    ),
                    Expanded(child: city),
                  ],
                ),
              ),
            ),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: _isCountry(2) != true,
            child: new TickerMode(
              enabled: _isCountry(2) == true,
              child: new Container(
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Cities in Lebanon",
                            style: Theme.of(context).textTheme.display1),
                      ),
                    ),
                    Expanded(child: cityinleb),
                  ],
                ),
              ),
            ),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: (_is(1) != true || _isCountry(1) != true),
            child: new TickerMode(
              enabled: (_is(1) == true && _isCountry(1) == true),
              child: new Container(
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
                    Expanded(
                      child: Text("Locations in Damascus",
                          style: Theme.of(context).textTheme.display1),
                    ),
                    Expanded(child: dama),
                  ],
                ),
              ),
            ),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: (_is(2) != true || _isCountry(1) != true),
            child: new TickerMode(
                enabled: (_is(2) == true && _isCountry(1) == true),
                child: new Container(
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
                      Expanded(
                        child: Text("Locations in Rural",
                            style: Theme.of(context).textTheme.display1),
                      ),
                      Expanded(child: rural),
                    ],
                  ),
                )),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: (_is(3) != true || _isCountry(1) != true),
            child: new TickerMode(
                enabled: (_is(3) == true && _isCountry(1) == true),
                child: new Container(
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
                      Expanded(
                        child: Text("Locations in Homs",
                            style: Theme.of(context).textTheme.display1),
                      ),
                      Expanded(child: homsWidget),
                    ],
                  ),
                )),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: (_is(4) != true || _isCountry(1) != true),
            child: new TickerMode(
                enabled: (_is(4) == true && _isCountry(1) == true),
                child: new Container(
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
                      Expanded(
                        child: Text("Locations in Hama",
                            style: Theme.of(context).textTheme.display1),
                      ),
                      Expanded(child: hamaWidget),
                    ],
                  ),
                )),
          ),
        ),
        new Container(
          child: new Offstage(
            offstage: (_is(5) != true || _isCountry(1) != true),
            child: new TickerMode(
                enabled: (_is(5) == true && _isCountry(1) == true),
                child: new Container(
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
                      Expanded(
                        child: Text("Locations in Idlib",
                            style: Theme.of(context).textTheme.display1),
                      ),
                      Expanded(child: idlibWidget),
                    ],
                  ),
                )),
          ),
        ),
        new Container(
          child: new Offstage(
              offstage: (_is(6) != true || _isCountry(1) != true),
              child: new TickerMode(
                  enabled: (_is(6) == true && _isCountry(1) == true),
                  child: new Container(
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
                        Expanded(
                          child: Text("Locations in Aleppo",
                              style: Theme.of(context).textTheme.display1),
                        ),
                        Expanded(child: aleppoWidget),
                      ],
                    ),
                  ))),
        ),
        new Container(
          child: new Offstage(
              offstage: (_is(7) != true || _isCountry(1) != true),
              child: new TickerMode(
                  enabled: (_is(7) == true && _isCountry(1) == true),
                  child: new Container(
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
                        Expanded(
                          child: Text("Locations in Dara",
                              style: Theme.of(context).textTheme.display1),
                        ),
                        Expanded(child: daraWidget),
                      ],
                    ),
                  ))),
        ),
        new Container(
          child: new Offstage(
              offstage: (_isLebanon(1) != true || _isCountry(2) != true),
              child: new TickerMode(
                  enabled: (_isLebanon(1) == true && _isCountry(2) != true),
                  child: new Container(
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
                        Expanded(
                          child: Text("Locations in Zahleh",
                              style: Theme.of(context).textTheme.display1),
                        ),
                        Expanded(child: zahlehWidget),
                      ],
                    ),
                  ))),
        ),
      ],
    );
  }
}
