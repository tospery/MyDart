import 'package:flutter/material.dart';

class SocketAPIRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Socket API'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('实现HTTP'),
          onPressed: () {
            _request();
          },
        ),
      ),
    );
  }

  _request() async {
    // //建立连接
    // var socket = await Socket.connect("baidu.com", 80);
    // //根据http协议，发送请求头
    // socket.writeln("GET / HTTP/1.1");
    // socket.writeln("Host:baidu.com");
    // socket.writeln("Connection:close");
    // socket.writeln();
    // await socket.flush(); //发送
    // //读取返回内容
    // _response = await socket.transform(utf8.decoder).join();
    // await socket.close();
  }
}
