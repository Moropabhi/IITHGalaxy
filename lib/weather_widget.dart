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
  double temp = 40.0;
  double humidity = 83.0;
  double windSpeed = 8.1;
  String tempUnits = "%";
  String humidityUnits = "%";
  String time = DateTime.now().toString();
  String date = DateTime.now().toString();

  Future<void> getWeather() async
  {
        if(!mounted)return;
    var latitude = 17.598911, longitude = 78.125885; 
    var url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,relative_humidity_2m,wind_speed_10m&timezone=Asia/Kolkata',
    );

    final  response = await http.get(url);
    if (response.statusCode == 200) {
      
    } else {
      throw Exception('Failed to load weather data');

    }
    final data = json.decode(response.body);
      //print(data);
      if(data["current"]!=null)
      {
        if(mounted){
        setState(() {
          
        temp = data["current"]["temperature_2m"];
        tempUnits = data["current_units"]["temperature_2m"];
        humidity = data["current"]["relative_humidity_2m"].toDouble();
        humidityUnits = data["current_units"]["relative_humidity_2m"];
        });
      }}
  }
  @override
  void initState()
  {
    getWeather();
    var t = DateTime.now().toLocal(); 
    date = "${t.day}/${t.month}/${t.year}";
    time = "${t.hour}:${t.minute>=10?t.minute:("0${t.minute}")}";
    Timer.periodic(Duration(seconds: 5),setTime);
    super.initState();
  }
  void setTime(Timer t)
  {
    if(!mounted)return;
    setState(() {
    var t = DateTime.now().toLocal(); 
    date = "${t.day}/${t.month}/${t.year}";
    time = "${t.hour}:${t.minute>=10?t.minute:("0${t.minute}")}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 30.0,
          colors: [Colors.black, Colors.blueAccent],
        ),
      ),
      margin: EdgeInsets.all(0.0),
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
                  date,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  time,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                Text(
                  "T: $temp $tempUnits  H: $humidity $humidityUnits",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(onPressed:getWeather, icon: Icon(Icons.refresh))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
