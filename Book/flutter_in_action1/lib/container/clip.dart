import 'package:flutter/material.dart';

class MyClip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset('images/avatar.png', width: 60.0);
    return Scaffold(
      appBar: AppBar(title: Text('Clip')),
      body: Center(
          child: Column(children: <Widget>[
        avatar,
        ClipOval(child: avatar),
        ClipRRect(borderRadius: BorderRadius.circular(5.0), child: avatar),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Align(alignment: Alignment.topLeft, widthFactor: 0.5, child: avatar),
          Text('你好世界', style: TextStyle(color: Colors.green))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ClipRect(
            child: Align(
                alignment: Alignment.topLeft, widthFactor: 0.5, child: avatar),
          ),
          Text('你好世界', style: TextStyle(color: Colors.green))
        ]),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: ClipRect(
              clipper: MyClipper(), //使用自定义的clipper
              child: avatar),
        )
      ])),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
