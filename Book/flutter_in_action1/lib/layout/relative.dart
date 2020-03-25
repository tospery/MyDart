import 'package:flutter/material.dart';

class RelativeTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('相对布局')),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
              width: 120.0,
              height: 120.0,
              color: Colors.blue[50],
              child: Align(
                  alignment: Alignment.topRight, child: FlutterLogo(size: 60)),
            ),
            Container(
              color: Colors.blue[50],
              child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment.topRight,
                  child: FlutterLogo(size: 60)),
            ),
            Container(
              color: Colors.blue[50],
              child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment(2, 0),
                  child: FlutterLogo(size: 60)),
            ),
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: Align(
                alignment: FractionalOffset(0.2, 0.6),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            )
          ])),
    );
  }
}

class RelativeTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('相对布局')),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                child: Text("xxx"),
              ),
            ),
            Text(''),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                widthFactor: 1,
                heightFactor: 1,
                child: Text("xxx"),
              ),
            )
          ])),
    );
  }
}
