import 'package:akarme/List_of_AD_Cards/Ad_list.dart';
import 'package:flutter/material.dart';

class Sell extends StatelessWidget {
  String title;
  String pagetitle;
  Sell(this.title, this.pagetitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ADList(title, pagetitle),
    );
  }
}
