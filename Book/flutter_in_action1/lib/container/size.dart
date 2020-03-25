import 'package:flutter/material.dart';

class ConstrainedBoxTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstrainedBox')),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 50.0,
        ),
        child: Container(
          height: 5.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

class SizedBoxTest extends StatelessWidget {
  final Widget redBox = DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.red,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstrainedBox')),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: 80.0,
            height: 80.0,
            child: redBox,
          ),
          Text(''),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 80.0, height: 80.0),
            child: redBox,
          ),
          Text(''),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
              child: redBox,
            ),
          ),
          Text(''),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
              child: redBox,
            ),
          ),
        ],
      ),
    );
  }
}

class UnconstrainedBoxTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget redBox = DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('UnconstrainedBox'),
        actions: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(Colors.white70),
            ),
          ),
          Text('  '),
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),
            child: UnconstrainedBox(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                child: redBox,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
