import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(title: Text('ResourceTest1')),
      body: Padding(
        padding: const EdgeInsets.all(8.0), child: Text(wordPair.toString()))
    );
  }
}
