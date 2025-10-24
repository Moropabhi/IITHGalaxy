import 'package:flutter/material.dart';
import 'calendar_widget.dart';
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
            Flexible(
              fit: FlexFit.tight,
              flex: 6,
              child: Container(
                //padding: EdgeInsets.all(100),
                //color: const Color.fromARGB(255, 7, 73, 255),
                child: Image.network("https://imgs.search.brave.com/qolZCSaVxzhn2SeKeUwL8zS9qY6kXbOyLTgOmmCmXPk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/aWNvbmZpbmRlci5j/b20vZGF0YS9mYW1p/bHkvcHJldmlld3Mv/cHJldmlldy90ZWVu/eWljb25zLXNvbGlk/LnBuZz9pbmRleGVk/PTE3NDM1MjEyMjk"),
              ),
            ),
          ],
        ),
      );
  }
}