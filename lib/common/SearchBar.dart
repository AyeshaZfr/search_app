import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Widget _widget;
  SearchBar(this._widget);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(children: [
        widget._widget,
        Container(
            margin: EdgeInsets.all(10),
            child: Text("Tap on a country to add it to your visited list.",
                style: Theme.of(context).textTheme.headline2)),
      ]),
    );
  }
}
