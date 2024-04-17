// import 'package:flutter/material.dart';
// import 'package:google_api_calendar/google_api_calendar.dart';
// import 'package:http/http.dart' as http;
// import 'package:google_auth/google_auth.dart';
//
// Future<List<googleAPI.Event>> getPublicEventsData() async {
//   final String apiUrl =
//       'https://www.googleapis.com/calendar/v3/calendars/en.usa%23holiday@group.v.calendar.google.com/events?singleEvents=true&key=$kGoogleApiKey';
//   final http.Response response = await http.get(Uri.parse(apiUrl));
//   if (response.statusCode == 200) {
//     final String responseBody = response.body;
//     final googleAPI.Events events = googleAPI.Events.fromJson(jsonDecode(responseBody));
//     return events.items;
//   } else {
//     print('Failed to fetch events: ${response.reasonPhrase}');
//     return [];
//   }
// }