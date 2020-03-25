import 'package:flutter/material.dart';

class LinearTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('线性布局1')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(' hello world '),
              Text(' I am Jack '),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(' hello world '),
              Text(' I am Jack '),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(' hello world '),
              Text(' I am Jack '),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(' hello world ', style: TextStyle(fontSize: 30.0)),
              Text(' I am Jack '),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Text('hi'), Text('world')],
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[Text('hi'), Text('world')],
            ),
          )
        ],
      ),
    );
  }
}

class LinearTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('线性布局2')),
        body: Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max, // 有效，外层Colum高度为整个屏幕
                children: <Widget>[
                  Container(
                      color: Colors.red,
                      child: Column(
                          mainAxisSize: MainAxisSize.max, // 无效，内层Colum高度为实际高度
                          children: <Widget>[
                            Text('hello world '),
                            Text('I am Jack ')
                          ]))
                ],
              ),
            )));
  }
}

class LinearTest3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('线性布局3')),
        body: Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                        children: <Widget>[
                          Text("hello world "),
                          Text("I am Jack "),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
