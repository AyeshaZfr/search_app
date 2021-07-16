import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.ctrl, required this.onChanged})
      : super(key: key);

  final Function onChanged;
  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(children: [
        TextField(
          controller: ctrl,
          decoration: InputDecoration(hintText: "Search.."),
          onChanged: (text) {
            onChanged(text);
          },
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: Text("Tap on a country to add it to your visited list.",
                style: Theme.of(context).textTheme.headline2)),
      ]),
    );
  }
}
