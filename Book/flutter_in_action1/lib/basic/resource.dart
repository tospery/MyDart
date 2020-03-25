import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ResourceTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadAsset().then((value) {
      print(value);
    });
    return Scaffold(
      appBar: AppBar(title: Text('ResourceTest1')),
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }
}

class ResourceTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/avatar.png'))));
  }
}

class ResourceTest3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/avatar.png');
  }
}
