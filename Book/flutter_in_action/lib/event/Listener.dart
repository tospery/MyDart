import 'package:flutter/material.dart';

class MyListener1 extends StatefulWidget {
  @override
  _MyListener1State createState() => _MyListener1State();
}

class _MyListener1State extends State<MyListener1> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listener'),
      ),
      body: Center(
        child: Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 300.0,
            height: 150.0,
            child: Text(_event?.toString() ?? "",
                style: TextStyle(color: Colors.white)),
          ),
          onPointerDown: (PointerDownEvent event) =>
              setState(() => _event = event),
          onPointerMove: (PointerMoveEvent event) =>
              setState(() => _event = event),
          onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
        ),
      ),
    );
  }
}

class MyListener2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listener'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 150.0)),
              child: Center(
                  child: Text(
                "Box A",
                style: TextStyle(backgroundColor: Colors.orange),
              )),
            ),
            onPointerDown: (event) => print("down A"),
            behavior: HitTestBehavior.opaque,
          ),
        ),
      ),
    );
  }
}

class MyListener3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listener'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                child:
                    DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
              ),
              onPointerDown: (event) => print("down0"),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                child: Center(
                    child: Text(
                  "左上角200*100范围内非文本区域点击",
                  style: TextStyle(backgroundColor: Colors.white),
                )),
              ),
              onPointerDown: (event) => print("down1"),
              behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
            )
          ],
        ),
      ),
    );
  }
}

class MyListener4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listener'),
      ),
      body: Center(
        child: Listener(
          child: AbsorbPointer(
            child: Listener(
              child: Container(
                color: Colors.red,
                width: 200.0,
                height: 100.0,
              ),
              onPointerDown: (event) => print("in"),
            ),
          ),
          onPointerDown: (event) => print("up"),
        ),
      ),
    );
  }
}

class MyListener5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listener'),
      ),
      body: Center(
        child: Listener(
          child: IgnorePointer(
            child: Listener(
              child: Container(
                color: Colors.red,
                width: 200.0,
                height: 100.0,
              ),
              onPointerDown: (event) => print("in"),
            ),
          ),
          onPointerDown: (event) => print("up"),
        ),
      ),
    );
  }
}
