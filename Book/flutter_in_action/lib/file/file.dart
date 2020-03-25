import 'package:flutter/material.dart';

class MyFile extends StatefulWidget {
  @override
  _MyFileState createState() => _MyFileState();
}

class _MyFileState extends State<MyFile> {
  final _list = [
    {'pattern': 'FileOperationRoute', 'name': '文件操作'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('文件操作')),
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
