// import 'package:flutter/material.dart';
// import 'package:search_app/CountriesListData/CountryJsonData.dart';
// import 'package:search_app/CountriesListData/CountriesTab.dart';

// class VisitedCountries extends StatefulWidget {
//   VisitedCountries();

//   @override
//   _VisitedCountriesState createState() => _VisitedCountriesState();
// }

// class _VisitedCountriesState extends State<VisitedCountries> {
//   List<Country> _visited = [];
//   @override
//   void initState() {
//     setState(() {
//       // _visited = CountriesTab._visitedCountries;
//     });

//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           return _listItem(index);
//         },
//         // itemCount: widget._visited.length + 1,
//       ),
//     );
//   }

//   _listItem(index) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Container(
//             height: 70,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
//             child: ListTile(
//               title: Text(
//                 widget._visited[index].name,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//         ]);
//   }

//   @override
//   void didUpdateWidget(CountriesTab oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     print("didUpdateWidget");
//   }
// }
