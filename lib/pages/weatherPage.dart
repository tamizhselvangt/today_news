import 'package:day_today/Model/weather_model.dart';
import 'package:day_today/utilities/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';


class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  var apiKey = 'cf3ef34cf3fa6292e5fe9c21222cb428';
  final _weatherService = Weatherservice();

  Weather? _weather;

  _fetchWeather() async{
    String cityName = await _weatherService.getCurrentCity();
    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }catch(e){
      print(e);
    }
  }

  String getWeatherAnimation (String? mainCondition) {
    if (mainCondition == null) return 'assets/animations/weather_animations/sunny.json'; // default to sunny
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/animations/weather_animations/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/animations/weather_animations/rain.json';
      case 'thunderstorm':
        return 'assets/animations/weather_animations/thunder.json';
      case 'clear':
        return 'assets/animations/weather_animations/sunny.json';
      default:
        return 'assets/animations/weather_animations/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0FFFF),
      appBar: AppBar(
        backgroundColor: Color(0xffE0FFFF),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(Icons.location_on_rounded,
                  color: Colors.black54,
                  size: 35,),
                Text(_weather?.cityName ?? "loading City",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "PolySans",
                      fontWeight: FontWeight.w600,
                      color: Colors.black54
                  ),),
              ],
            ),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition),),
            Column(
              children: [
                Text('${_weather?.temperature.round()}°C',
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: "PolySans",
                      fontWeight: FontWeight.w600,
                      color: Colors.black54

                  ),),
                Text('${_weather?.mainCondition}',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "PolySans",
                      fontWeight: FontWeight.w600,
                      color: Colors.black38,
                    )),
              ],
            ),
            Gap(30)
          ],
        ),
      ),
    );
  }
}
