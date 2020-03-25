import 'package:flutter/material.dart';

class StackTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack')),
      body: Center(
          child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: Text('Hello world', style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text('I am Jack'),
            ),
            Positioned(top: 18.0, child: Text('Your friend'))
          ],
        ),
      )),
    );
  }
}

class StackTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack')),
      body: Center(
          child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(left: 18.0, child: Text('I am Jack')),
            Container(
              child: Text('Hello world', style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(top: 18.0, child: Text('Your friend'))
          ],
        ),
      )),
    );
  }
}