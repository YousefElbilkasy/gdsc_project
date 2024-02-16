import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 2, 2, 7),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(margin: const EdgeInsets.only(bottom: 25), child: Image.asset('images/cloudy_1146869.png', height: 150,)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text('Discover The Weather in Your City',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: const Text(
                'Get to know your weather maps and radar precipitation forecast',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54)),
          ),
          SizedBox(
            width: 350,
            child: MaterialButton(
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () => Navigator.of(context).pushReplacementNamed('home'),
              color: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.all(15),
                child:
                    Text('Get Started', style: TextStyle(color: Colors.white)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
