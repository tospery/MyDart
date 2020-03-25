import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New route')),
      body: Center(child: Text('This is new route')),
    );
  }
}

class TipRoute extends StatelessWidget {
  final String text;

  TipRoute({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('提示')),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                  child: Text('返回'),
                  onPressed: () => Navigator.pop(context, '我是返回值'))
            ],
          )),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ResourceTest1')),
        body: Center(
          child: RaisedButton(
            child: Text('打开提示页'),
            onPressed: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return TipRoute(text: '我是提示xxxx');
              }));
              print('路由返回值：$result');
            },
          ),
        ));
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print('路由参数值: $args');
    return Scaffold(
      appBar: AppBar(title: Text('New route')),
      body: Center(child: Text('This is new route')),
    );
  }
}
