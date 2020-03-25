import 'package:flutter/material.dart';

class TextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text')),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hello world', textAlign: TextAlign.left),
            Text("Hello world! I'm Jack. " * 4,
                maxLines: 1, overflow: TextOverflow.ellipsis),
            Text('Hello world', textScaleFactor: 1.5)
          ],
        ),
      ),
    );
  }
}

class TextStyleTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextStyle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello world',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: 'Courier',
                    background: Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed))
          ],
        ),
      ),
    );
  }
}

class TextSpanTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextSpan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(TextSpan(children: [
              TextSpan(text: 'Home: '),
              TextSpan(
                text: 'https://flutterchina.club',
                style: TextStyle(color: Colors.blue),
              )
            ])),
          ],
        ),
      ),
    );
  }
}

class DefaultTextStyleTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DefaultTextStyle')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DefaultTextStyle(
              style: TextStyle(color: Colors.red, fontSize: 20.0),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('hello world'),
                  Text('I am Jack'),
                  Text('I am Jack',
                      style: TextStyle(inherit: false, color: Colors.grey))
                ],
              ))
        ],
      )),
    );
  }
}

class FontTest extends StatelessWidget {
  static const textStyle = const TextStyle(fontFamily: 'Raleway');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Font')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Use the font for this text', style: textStyle)
        ],
      )),
    );
  }
}
