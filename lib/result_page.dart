import 'dart:math';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget{
  const ResultPage({Key? key}) : super(key: key);

  get math => null;

  @override
  Widget build(BuildContext context) {

    String _nowword;
    List<String> words = [
      'images/girichocoyade.png',
      'images/honnmeiyade.png',
      'images/taiyakiyade.png',
      'images/tomochocoyade.png',
    ];
    var r = Random(DateTime.now().millisecondsSinceEpoch);
    _nowword = words[r.nextInt(words.length)];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Happy Valentine!'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(_nowword,
            height: 300,
            width: 300,),
            const Text('だよ！',
            style: TextStyle(
              fontSize: 50,
            ),
            ),
          ],
        ),
      ),
    );
  }
}