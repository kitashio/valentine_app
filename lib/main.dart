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

  @override
  void initState() {
    //ルーレットコントローラ
    _controller = RouletteController(
        group: RouletteGroup([
          //ここに項目追加
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
      body:
      SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset('images/valentine_title.png', height: 150,),
              const SizedBox(height: 20),
              SizedBox(
                width: 260,
                height: 260,
                //ルーレットウィジェット
                child: Roulette(
                  controller: _controller,
                  style: const RouletteStyle(
                    centerStickerColor: Colors.brown,//中心の丸の色
                    dividerThickness: 4,//仕切りの厚さ
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () async {
                    //コントローラ動かす
                    await _controller.rollTo( 1,
                      clockwise: true,//時計回り
                      offset: Random().nextDouble(),//最終位置の設定
                      );
                    //結果（チョコ）画面へ遷移
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const ResultPage(),
                         ));
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