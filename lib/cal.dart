import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class Cal extends StatefulWidget {
  const Cal({Key? key}) : super(key: key);

  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Cal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        ),
        SfCalendar(
          view: CalendarView.month,
        ),
      ],
    ));
  }
}
