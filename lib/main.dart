import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roulette/roulette.dart';
import 'package:valentine_app/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roulette',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late RouletteController _controller;
  bool _clockwise = true;

  @override
  void initState() {
    _controller = RouletteController(
        group: RouletteGroup([
          const RouletteUnit.noText(color: Color.fromRGBO(70, 17, 17, 100)),
          const RouletteUnit.noText(color: Color.fromRGBO(76, 0, 39, 100)),
          const RouletteUnit.noText(color: Color.fromRGBO(227, 183, 160, 100)),
          const RouletteUnit.noText(color: Color.fromRGBO(255, 237, 219, 100)),
        ]),
        vsync: this
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Text('Happy Valentine!'),
      ),
      body:Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: 260,
                    height: 260,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Roulette(
                        controller: _controller,
                        style: const RouletteStyle(
                          dividerThickness: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    await _controller.rollTo(
                      2,
                      clockwise: _clockwise,
                      offset: Random().nextDouble(),
                    );
                     Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return ResultPage();
                      }),
                    );
                  } ,
                  child: Text("受け取ってね"))
            ],
          ),
        ),
      ),
    );
  }
}