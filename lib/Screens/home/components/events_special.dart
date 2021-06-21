import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../../../constants.dart';

void showevents() {
  runApp(
    MaterialApp(home: EventsSpecial()),
  );
}

class EventsSpecial extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsSpecial> {
  Map data;
  List events;

  // getEvents() async {
  //   http.Response response = await http.get('http://localhost:4000/api/events');
  //   data = json.decode(response.body);
  //   setState(() {
  //     events = data['summary'];
  //   });
  // }

  @override
  initState() {
    super.initState();
    //getEvents();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: kDefaultPadding,
                top: kDefaultPadding / 2,
                bottom: kDefaultPadding * 2.5,
              ),
              width: size.width * 0.4,
              child: Text('ما عناش مناسبات توا'),
            )
          ],
        )
        //ListView.builder(
        //itemCount: events == null ? 0 : events.length,
        //itemBuilder: (BuildContext context, int index) {
        //return Card(
        //child: Row(
        //children: [Text("${events[index]}")],
        //),
        //);
        //},
        //),
        );
  }
}
