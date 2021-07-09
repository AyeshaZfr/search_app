import 'package:flutter/material.dart';

class ListTileDisplay extends StatelessWidget {
  Widget _widget;
  ListTileDisplay(this._widget);
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: _widget,
          ),
        ]);
  }
}
