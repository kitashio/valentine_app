import 'dart:math';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget{
  const ResultPage({Key? key}) : super(key: key);

  get math => null;

  @override
  Widget build(BuildContext context) {

    String _imgURL;
    List<String> imgURLs = [
      //ここに表示したい画像URLを追加
      'images/girichocoyade.png',
      'images/honnmeiyade.png',
      'images/taiyakiyade.png',
      'images/tomochocoyade.png',
    ];
    final ram = Random(DateTime.now().millisecondsSinceEpoch);//乱数の種を時間ごとに変更するためのDataTime
    _imgURL = imgURLs[ram.nextInt(imgURLs.length)];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Happy Valentine!'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(_imgURL,
            height: 300,
            width: 300,),
            const Text('だよ！',
            style: TextStyle(
              fontSize: 50
            ),
            ),
       ],
        ),
      ),
    );
  }
}