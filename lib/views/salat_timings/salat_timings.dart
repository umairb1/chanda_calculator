import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SalatTimings extends StatelessWidget {
  // final SalatData salatTimes;

  // Future<http.Response> fetchAlbum() async {
  //   final response = await http.get('https://api.mka.uk/v1/salat-times');

  //   return json.decode(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    // var x = this.fetchAlbum();

    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Text('Salat Timings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0)),
      ),
      DataTable(
          columnSpacing: 70.0,
          dividerThickness: 2.0,
          dataRowHeight: 70.0,
          columns: [
            DataColumn(label: Text('',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0))),
            DataColumn(label: Text('',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Fajr',style:TextStyle(fontSize: 25.0))),
              DataCell(Text('04:29',style:TextStyle(fontSize: 25.0)))
            ]),
            DataRow(cells: [
              DataCell(Text('Zuhr',style:TextStyle(fontSize: 25.0))),
              DataCell(Text('14:00',style:TextStyle(fontSize: 25.0)))
            ]),
            DataRow(cells: [
              DataCell(Text('Asr',style:TextStyle(fontSize: 25.0))),
              DataCell(Text('17:15',style:TextStyle(fontSize: 25.0)))
            ]),
            DataRow(cells: [
              DataCell(Text('Maghrib',style:TextStyle(fontSize: 25.0))),
              DataCell(Text('20:31',style:TextStyle(fontSize: 25.0)))
            ]),
            DataRow(cells: [
              DataCell(Text('Isha',style:TextStyle(fontSize: 25.0))),
              DataCell(Text('21:30',style:TextStyle(fontSize: 25.0)))
            ]),
          ]),
    ]);
  }
}

class SalatData {
  CustomDate date;
  SalatTimes times;
}

class SalatTimes {
  SalatTime fajr;
  SalatTime zuhr;
  SalatTime asr;
  SalatTime maghr;
  SalatTime isha;
}

class CustomDate {
  DateTime date;
  int timezone_type;
  String timezone;
}

class SalatTime {
  String hour;
  String minutes;
}

// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   Album({this.userId, this.id, this.title});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }
