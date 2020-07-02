import 'package:akarme/Navigation_Bar_Pages/rentPage.dart';
import 'package:flutter/material.dart';
import 'package:akarme/Navigation_Bar_Pages/sellPage.dart';

class TabBarad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 10.0,
          backgroundColor: Theme.of(context).primaryColor,
          title: TabBar(
            tabs: [
              Tab(
                  child: Container(
                child: Text(
                  "Sell Page",
                  style: Theme.of(context).textTheme.button,
                ),
              )),
              Tab(
                child: Container(
                  child: Text(
                    "Rent Page",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            new Sell("Advertisment List", "Sell Page"),
            new Rent("Advertisment List", "Rent Page")
          ],
        ),
      ),
    );
  }
}
