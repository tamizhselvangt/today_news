import 'package:flutter/material.dart';


class Weather {
  final cityName;
  final temperature;
  final mainCondition;

  Weather({
    required this.cityName,
    required this.mainCondition,
    required this.temperature
  });

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        cityName: json['name'],
        temperature: json['main']['temp'].toDouble(),
    mainCondition: json['weather'][0]['main']
    );
  }

}