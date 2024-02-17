import 'package:flutter/material.dart';
import 'package:gdsc_project/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiKey = '15e3b79666554b8687d6b28021057de3';
  late String weatherDescription = '';
  late double temperature = 0.0;
  late int humidity = 0;
  late double windSpeed = 0.0;
  late String city = '';
  late String weatherIcon = '';
  int navIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    String apiUrl = 'https://api.weatherbit.io/v2.0/current?city=$city&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));
    Map<String, dynamic> data = json.decode(response.body);
    setState(() {
      weatherDescription = data['data'][0]['weather']['description'];
      temperature = data['data'][0]['temp'];
      humidity = data['data'][0]['rh'];
      windSpeed = data['data'][0]['wind_spd'];
    });
  }

  String getWeatherIconUrl(String iconCode) {
    return 'https://www.weatherbit.io/static/img/icons/$iconCode.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00504f53),
      drawer: const Drawer(),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0x00504f53),
          centerTitle: true,
          title: SizedBox(
            width: 180,
            child: MaterialButton(
              onPressed: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.blue),
                    Text(
                      city,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  ]),
            ),
          )),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Location(),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20, left: 10),
                child: const Text('Today\'s Report',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              Image.asset(
                'images/cloudy-day.png',
                height: 170,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text('It\'s $weatherDescription',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(temperature.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold)),
                    const Text('°',
                        style: TextStyle(color: Colors.blue, fontSize: 80)),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Image.asset(
                            'images/windy.png',
                            width: 70,
                          ),
                        ),
                        const Text('12 km/h',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal)),
                        const Text('Wind',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Image.asset(
                            'images/clouds-sun.png',
                            width: 70,
                          ),
                        ),
                        const Text('60%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal)),
                        const Text('Humidity',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Image.asset(
                            'images/night-rain.png',
                            width: 70,
                          ),
                        ),
                        const Text('Pressure',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal)),
                        const Text('1013 hPa',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: navIndex,
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
        backgroundColor: const Color(0x00504f53),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
      ),
    );
  }
}
