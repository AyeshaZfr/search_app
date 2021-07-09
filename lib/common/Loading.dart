import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 400),
        child: Center(
          child: CircularProgressIndicator(),
        ));
  }
}
