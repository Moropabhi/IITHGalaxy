import 'package:flutter/material.dart';
import 'calendar_widget.dart';
import 'iithspecials_widget.dart';
import 'weather_widget.dart';
import 'jotdown_widget.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBody();
}

class _HomeBody extends State<HomeBody>
{


  var icon = "assets/bitmap.png";

  @override
  Widget build(BuildContext context) {
      return

Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          //image:DecorationImage(fit: BoxFit.fill,image:  AssetImage(weather)) ,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WeatherWidget(),
                    JotDownWidget(),
                  ],
                ),
                Flexible(fit: FlexFit.tight,flex: 3,child: CalenderSmallWidget()),
              ],
            ),
            IITHSpecialWidget()
          ],
        ),
      );
  }
}