import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:weather_app/utilities/location.dart';
import 'dart:convert';
import 'package:weather_app/utilities/constants.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var cityName;
  var temperature;

  void weatherdata() async {
    Location location = Location();
    await location.getlocation();
    http.Response response = await http.get(Uri.parse(
        '$kopenWeatherMapURL?lat=${location.lattitude}&lon=${location.longitude}&appid=$kapiKey&units=metric'));
    if (response.statusCode == 200) {
      String data = response.body;
      cityName = jsonDecode(data)['name'];
      double temp = jsonDecode(data)['main']['temp'];
      temperature = temp.toInt();
    } else {
      print(response.statusCode);
    }
  }

  void getLocationData() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        cityName: cityName,
        temperature: temperature,
      );
    }));
  }

  @override
  void initState() {
    weatherdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Image(
                image: AssetImage('images/introscreen.png'),
                height: (MediaQuery.of(context).size.height) / 2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 41),
            child: Column(
              children: [
                Text('Duis aute irure dolor',
                    style: Theme.of(context).textTheme.headline5),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 60,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 285.0,
                    height: 56.0,
                    color: Color(0xFF837CFC),
                    child: TextButton(
                      onPressed: () {
                        getLocationData();
                      },
                      child: Text(
                        'GET STARTED',
                        style: TextStyle(fontSize: 19.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
