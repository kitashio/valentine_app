
import 'dart:math';

import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    String _nowword;
    List<String> words = [
      'images/girichocoyade.png',
      'images/honnmeiyade.png',
      'images/taiyakiyade.png',
      'images/tomochocoyade.png',
    ];
    _nowword = words[Random().nextInt(words.length)];

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
            Text('だよ！',
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