// ignore_for_file: prefer_const_constructors

import 'package:api_app/model/model.dart';
import 'package:api_app/pages/service/service.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  //api key
  final _weatherService = WeatherService('41d6c844e7f5311423511fb9ffaae87b');
  Weather? _weather;

  //fetch Weather

  _fetchWeather() async {
    //get current city
    String cityName = await _weatherService.getCurrentCity();
   
    //get weather for the city
    try {
      final weather = await _weatherService.getWeather('New York');
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 174, 220, 81),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //searchBAR
            Container(
                // padding: EdgeInsets.only(top: 50),

                ),
            
            //cityname
            Text(
              "${_weather?.city.name.toString() ?? " No city name......"}",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),

            //DAY and time
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 150)),
                Text(
                  '${_weather?.list[7].dtTxt.day.toString() ?? "No time"}-',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${_weather?.list[7].dtTxt.month.toString() ?? "No time"}-',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${_weather?.list[7].dtTxt.year.toString() ?? "No time"}',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 181, 58, 58),
                  ),
                ),
                Text(
                  '  ${_weather?.list[7].sys.pod.name.toString() ?? "No time"}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            //Image icon of weather
            Container(
              
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(101, 255, 255, 255),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://openweathermap.org/img/wn/${_weather?.list[2].oeather[0].icon}@4x.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text('${_weather?.list[1].main.temp.toInt()} °C',
            style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 220, 167, 55),
              ),),
          ],
        ));
  }
}

//Search bar
