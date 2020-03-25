import 'package:flutter/material.dart';

class LocalImageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('AssetImage'),
          Image(image: AssetImage('images/avatar.png'), width: 100.0),
          Text('Image.asset'),
          Image.asset('images/avatar.png', width: 100.0),
        ],
      )),
    );
  }
}

class NetworkImageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('NetworkImage'),
          Image(
              image: NetworkImage(
                  'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
              width: 100.0),
          Text('Image.network'),
          Image.network(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
              width: 100.0),
        ],
      )),
    );
  }
}

class BoxFitTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Image')),
        body: ListView(
          itemExtent: 50.0,
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/avatar.png",
                    width: 100.0,
                    fit: BoxFit.contain,
                  ),
                  Text('contain')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/avatar.png",
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  Text('cover')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/avatar.png",
                    width: 100.0,
                    fit: BoxFit.fill,
                  ),
                  Text('fill')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/avatar.png",
                    width: 100.0,
                    fit: BoxFit.fitHeight,
                  ),
                  Text('fitHeight')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/avatar.png",
                    width: 100.0,
                    fit: BoxFit.fitWidth,
                  ),
                  Text('fitWidth')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/avatar.png",
                    width: 100.0,
                    fit: BoxFit.none,
                  ),
                  Text('none')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/avatar.png",
                    width: 100.0,
                    fit: BoxFit.scaleDown,
                  ),
                  Text('scaleDown')
                ],
              ),
            ),
          ],
        ));
  }
}

class BlendModeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image')),
      body: Center(
          child: Image(
              image: AssetImage('images/avatar.png'),
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference)),
    );
  }
}

class ImageRepeatTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image')),
      body: Center(
          child: Image(
        image: AssetImage('images/avatar.png'),
        width: 100.0,
        height: 200.0,
        repeat: ImageRepeat.repeatY,
      )),
    );
  }
}

class ImageAndIconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/avatar.png");
    return SingleChildScrollView(
      child: Column(
          children: <Image>[
        Image(
          image: img,
          height: 50.0,
          width: 100.0,
          fit: BoxFit.fill,
        ),
        Image(
          image: img,
          height: 50,
          width: 50.0,
          fit: BoxFit.contain,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.fitWidth,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.fitHeight,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.scaleDown,
        ),
        Image(
          image: img,
          height: 50.0,
          width: 100.0,
          fit: BoxFit.none,
        ),
        Image(
          image: img,
          width: 100.0,
          color: Colors.blue,
          colorBlendMode: BlendMode.difference,
          fit: BoxFit.fill,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 200.0,
          repeat: ImageRepeat.repeatY,
        )
      ].map((e) {
        return Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 100,
                child: e,
              ),
            ),
            Text(e.fit.toString())
          ],
        );
      }).toList()),
    );
  }
}

class IconfontTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
    return Scaffold(
      appBar: AppBar(title: Text('Iconfont')),
      body: Center(
          child: Text(icons,
              style: TextStyle(
                  fontFamily: 'MaterialIcons',
                  fontSize: 24.0,
                  color: Colors.green))),
    );
  }
}

class IconfontTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iconfont')),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.accessible, color: Colors.green),
          Icon(Icons.error, color: Colors.green),
          Icon(Icons.fingerprint, color: Colors.green),
        ],
      )),
    );
  }
}

class MyIcons {
  // book图标
  static const IconData book =
      const IconData(0xe614, fontFamily: 'myIcon', matchTextDirection: true);
  // 微信图标
  static const IconData wechat =
      const IconData(0xec7d, fontFamily: 'myIcon', matchTextDirection: true);
}

class IconfontTest3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iconfont')),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(MyIcons.book, color: Colors.green),
          Icon(MyIcons.wechat, color: Colors.green)
        ],
      )),
    );
  }
}
