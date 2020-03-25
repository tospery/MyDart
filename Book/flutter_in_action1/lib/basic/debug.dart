import 'package:flutter/material.dart';

class DebugTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FlatButton(
          child: Text('Dump App'),
          onPressed: (){
            debugDumpApp();
          },
        )
      ),
    );
  }
}