import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = 'Kafr Elsheikh';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 2, 2, 7),
      drawer: const Drawer(),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(0, 2, 2, 7),
          centerTitle: true,
          title: SizedBox(
            width: 150,
            child: MaterialButton(
              onPressed: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.blue),
                    Text(
                      city,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    )
                  ]),
            ),
          )),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20, left: 10),
                child: const Text('Today\'s Report',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )),
    );
  }
}
