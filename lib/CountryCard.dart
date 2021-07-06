// import 'dart:async';

// import 'dart:io';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'country.dart';
import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart' show rootBundle;

class CountryCard extends StatefulWidget {
  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  var _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _color = Colors.yellow;
        });
      },
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
              color: _color,
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text("countries<index><'name'>"),
                  // Text(countriesData[index]),
                ],
              ));
        },
      ),
    );
  }
}
