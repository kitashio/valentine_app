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
      title: 'はっぴーばれんたいん',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const RoulettePage(),
    );
  }
}

class RoulettePage extends StatefulWidget {
  const RoulettePage({Key? key}) : super(key: key);

  @override
  State<RoulettePage> createState() => _RoulettePageState();
}

class _RoulettePageState extends State<RoulettePage> with SingleTickerProviderStateMixin {
  late RouletteController _controller;
  final bool _clockwise = true;

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
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset('images/valentine_title.png',
              height: 150,),
              const SizedBox(height: 20),
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
                          centerStickerColor: Colors.brown,
                          dividerThickness: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () async {
                    await _controller.rollTo(
                      2,
                      clockwise: _clockwise,
                      offset: Random().nextDouble(),
                    );
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const ResultPage(),
                         )
                    );
                  } ,
                  child: const Text("受け取ってね！",
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}