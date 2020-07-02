import 'package:flutter/material.dart';
import 'dart:async';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation(this.buttonController)
      : buttonSqueezeanimation = new Tween(
    begin: 300.0,
    end: 70.0,
  )
      .animate(
    new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ),
  ),
        buttomZoomOut = new Tween(
          begin: 70.0,
          end: 1000.0,
        )
            .animate(
          new CurvedAnimation(
            parent: buttonController,
            curve: new Interval(
              0.550,
              0.999,
              curve: Curves.bounceOut,
            ),
          ),
        ),
        containerCircleAnimation = new EdgeInsetsTween(
          begin: const EdgeInsets.only(top: 400.0),
          end: const EdgeInsets.all(0.0),
        )
            .animate(
          new CurvedAnimation(
            parent: buttonController,
            curve: new Interval(
              0.500,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        super();

  final AnimationController buttonController;
  final Animation<EdgeInsets> containerCircleAnimation;
  final Animation buttonSqueezeanimation;
  final Animation buttomZoomOut;

  Future<Null> _playAnimation() async {
    try {
      await buttonController.forward();
      await buttonController.reverse();
    } on TickerCanceled {}
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return new Padding(
      padding: buttomZoomOut.value == 70
          ? const EdgeInsets.only(top: 400.0)
          : containerCircleAnimation.value,
      child: new InkWell(
          onTap: () {
            _playAnimation();
          },
          child: new Hero(
            tag: "fade",
            child: buttomZoomOut.value <= 300
                ? new Container(
                width: buttomZoomOut.value == 70
                    ? buttonSqueezeanimation.value
                    : buttomZoomOut.value,
                height:
                buttomZoomOut.value == 70 ? 50.0 : buttomZoomOut.value,
                alignment: FractionalOffset.center,
                decoration: new BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: buttomZoomOut.value < 400
                      ? new BorderRadius.all(const Radius.circular(30.0))
                      : new BorderRadius.all(const Radius.circular(0.0)),
                ),
                child: buttonSqueezeanimation.value > 75.0
                    ? new Text(
                  "Sign In",
                  style:
                    Theme.of(context).textTheme.button,
                )
                    : buttomZoomOut.value < 300.0
                    ? new CircularProgressIndicator(
                  value: null,
                  strokeWidth: 1.0,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Theme.of(context).accentColor),
                )
                    : null)
                : new Container(
              width: buttomZoomOut.value,
              height: buttomZoomOut.value,
              decoration: new BoxDecoration(
                shape: buttomZoomOut.value < 500
                    ? BoxShape.circle
                    : BoxShape.rectangle,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    buttonController.addListener(() {
      if (buttonController.isCompleted) {
        Navigator.pushNamed(context, "/Navigationpage");
      }
    });
    return new AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}