import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidget();
}

class _WeatherWidget extends State<WeatherWidget> {
  var weather = "assets/weather.jpg";
  var temp = 40.0;
  var units = "";

  void getWeather() async
  {
    var latitude = 17.598911, longitude = 78.125885; 
    var url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,relative_humidity_2m,wind_speed_10m&timezone=Asia/Kolkata',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(data["current"]["temperature_2m"]);
      if(data["current"]!=null)
      {
        temp = data["current"]["temperature_2m"];
        units = data["current_units"]["temperature_2m"];
      }
    } else {
      throw Exception('Failed to load weather data');

    }
    setState(() {});
  }
  



  @override
  Widget build(BuildContext context) {
    getWeather();
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 30.0,
          colors: [Colors.black, Colors.blueAccent],
        ),
      ),
      margin: EdgeInsets.all(0.0),
      child: Expanded(
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20.0),
          child: Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Image.asset(
                weather,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 2,
              ),
              Column(
                children: [
                  Text(
                    "$temp $units",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  ),
                  IconButton(onPressed: getWeather, icon: Icon(Icons.refresh))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
