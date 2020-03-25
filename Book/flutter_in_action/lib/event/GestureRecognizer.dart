import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyGestureRecognizer extends StatefulWidget {
  @override
  _MyGestureRecognizerState createState() => _MyGestureRecognizerState();
}

class _MyGestureRecognizerState extends State<MyGestureRecognizer> {
  bool _toggle = false;
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureRecognizer'),
      ),
      body: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: '你好世界'),
          TextSpan(
            text: '点我变色',
            style: TextStyle(
                fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
            recognizer: _tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              },
          ),
          TextSpan(text: '你好世界'),
        ])),
      ),
    );
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
}
