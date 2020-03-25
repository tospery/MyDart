import 'package:flutter/material.dart';

class MyGestureDetector1 extends StatefulWidget {
  @override
  _MyGestureDetector1State createState() => _MyGestureDetector1State();
}

class _MyGestureDetector1State extends State<MyGestureDetector1> {
  String _operation = 'No Gesture detected!';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => updateText('Tap'),
          onDoubleTap: () => updateText('DoubleTap'),
          onLongPress: () => updateText('LongPress'),
        ),
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}

class MyGestureDetector2 extends StatefulWidget {
  @override
  _MyGestureDetector2State createState() => _MyGestureDetector2State();
}

class _MyGestureDetector2State extends State<MyGestureDetector2>
    with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text('A')),
              onPanDown: (DragDownDetails e) {
                print('用户手指按下: ${e.globalPosition}');
              },
              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }
}

class MyGestureDetector3 extends StatefulWidget {
  @override
  _MyGestureDetector3State createState() => _MyGestureDetector3State();
}

class _MyGestureDetector3State extends State<MyGestureDetector3> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            child: GestureDetector(
              child: CircleAvatar(child: Text('A')),
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class MyGestureDetector4 extends StatefulWidget {
  @override
  _MyGestureDetector4State createState() => _MyGestureDetector4State();
}

class _MyGestureDetector4State extends State<MyGestureDetector4> {
  double _width = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Center(
        child: GestureDetector(
          child: Image.asset('images/sea.png', width: _width),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _width = 200 * details.scale.clamp(0.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}

class MyGestureDetector5 extends StatefulWidget {
  @override
  _MyGestureDetector5State createState() => _MyGestureDetector5State();
}

class _MyGestureDetector5State extends State<MyGestureDetector5> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text('A')),
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class MyGestureDetector6 extends StatefulWidget {
  @override
  _MyGestureDetector6State createState() => _MyGestureDetector6State();
}

class _MyGestureDetector6State extends State<MyGestureDetector6> {
  double _left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势冲突'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 80.0,
            left: _left,
            child: Listener(
              onPointerUp: (details) {
                print('up');
              },
              onPointerDown: (details) {
                print('down');
              },
              child: GestureDetector(
                child: CircleAvatar(child: Text('B')),
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details) {
                  print('onHorizontalDragEnd');
                },
                onTapDown: (details) {
                  print("onTapDown");
                },
                onTapUp: (details) {
                  print("onTapUp");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
