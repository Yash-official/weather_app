import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen(
      {@required this.cityName,
      @required this.temperature,
      @required this.country});

  final cityName;
  final temperature;
  final country;
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: widget.temperature > 0
                ? AssetImage('images/summerscreen.png')
                : AssetImage('images/snowscreen.png'),
            fit: BoxFit.fitWidth,
          )),
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 87.0,
          ),
          Text(
            '${widget.temperature}°C',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xFF4A4A4A),
                fontFamily: 'Red Hat Display',
                fontSize: 77.0,
                fontWeight: FontWeight.w400),
          ),
          Text(
            '${widget.cityName}, ${widget.country}',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
