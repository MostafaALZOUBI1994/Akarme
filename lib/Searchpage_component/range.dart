import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class RangeSliderSample extends StatefulWidget {
  double _lowerValue;
  double _upperValue;
  double _min;
  double _max;
  String label;
  String text;
  RangeSliderSample(this._lowerValue, this._upperValue, this._min, this._max,
      this.label, this.text);
  @override
  _RangeSliderSampleState createState() => _RangeSliderSampleState(
      _lowerValue, _upperValue, _min, _max, label, text);
}

class _RangeSliderSampleState extends State<RangeSliderSample> {
  _RangeSliderSampleState(this._lowerValue, this._upperValue, this._min,
      this._max, this.label, this.text);
  double _lowerValue;
  double _upperValue;
  double _min;
  double _max;
  String label;
  String text;
  String _lowerValueS = '';
  String _upperValueS = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0,left:10.0,right:10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:15.0,bottom:10.0),
              child: Row(
                children: <Widget>[
                        new Text(text, style: Theme.of(context).textTheme.display1,),
                ],
              ),
            ),
            new Row(children: <Widget>[
              Expanded(
                child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Theme.of(context).accentColor,
                      inactiveTrackColor: Colors.white,
                      activeTickMarkColor: Theme.of(context).accentColor,
                      thumbColor: Theme.of(context).accentColor,
                    ),
                    child: new Container(

                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: frs.RangeSlider(
                        touchRadiusExpansionRatio: 1.0,
                        min: _min,
                        max: _max,
                        lowerValue: _lowerValue,
                        upperValue: _upperValue,
                        divisions: 100,
                        showValueIndicator: false,
                        valueIndicatorMaxDecimals: 1,
                        onChanged: (double newLowerValue, double newUpperValue) {
                          setState(() {
                            _lowerValue = newLowerValue;
                            _upperValue = newUpperValue;
                            _lowerValueS = (_lowerValue.round()).toString();
                            _upperValueS = (_upperValue.round()).toString();
                          });
                        },
                      ),
                    )),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(_lowerValueS + " " + label,
                    style: Theme.of(context).textTheme.display3),
                new Text(
                  _upperValueS + " " + label,
                  style: Theme.of(context).textTheme.display3,
                ),
              ],
            )
          ],
      ),
    );
  }
}
