import 'package:flutter/material.dart';

class MyNetwork extends StatefulWidget {
  @override
  _MyNetworkState createState() => _MyNetworkState();
}

class _MyNetworkState extends State<MyNetwork> {
  final _list = [
    {'pattern': 'HttpTestRoute', 'name': 'HttpClient'},
    {'pattern': 'FutureBuilderRoute', 'name': 'dio'},
    {'pattern': 'DownloadRoute', 'name': '下载'},
    {'pattern': 'WebSocketRoute', 'name': 'WebSocket'},
    {'pattern': 'SocketAPIRoute', 'name': 'Socket API'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('网络请求')),
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
