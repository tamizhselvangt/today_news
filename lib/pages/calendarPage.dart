import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:day_today/utilities/googleApi.dart';


class CalenderPage extends StatelessWidget {

  CalenderPage({super.key});

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFEBF0),
      appBar: AppBar(
        backgroundColor: Color(0xffFFD1DC),
        title: Text('DayToday Calendar'),
      ),
      body: Column(
        children: [
          CalendarCarousel(
            height: 400,
          ),
          Text("${_selectedDate}")
        ],
      ),
    );
  }
}