import 'package:flutter/material.dart';

class MyLocalization extends StatefulWidget {
  @override
  _MyLocalizationState createState() => _MyLocalizationState();
}

class _MyLocalizationState extends State<MyLocalization> {
  final _list = [
    {'pattern': 'CameraExampleHome', 'name': '相机示例'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('插件')),
      body: ListView.builder(
        itemCount: _list.length,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_list[index]['name']),
            onTap: () {
              Navigator.pushNamed(context, _list[index]['pattern']);
            },
          );
        },
      ),
    );
  }
}