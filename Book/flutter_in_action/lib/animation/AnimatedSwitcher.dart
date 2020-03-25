import 'package:flutter/material.dart';

class MyAnimatedSwitcher extends StatefulWidget {
  const MyAnimatedSwitcher({Key key}) : super(key: key);

  @override
  _MyAnimatedSwitcherState createState() => _MyAnimatedSwitcherState();
}

class _MyAnimatedSwitcherState extends State<MyAnimatedSwitcher> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      '$_count',
      key: ValueKey<int>(_count), // 显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
      style: Theme.of(context).textTheme.display1,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                // 执行缩放动画
                return ScaleTransition(child: child, scale: animation);
              },
              child: textWidget,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                var tween =
                    Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                return _SlideTransition(
                  child: child,
                  position: tween.animate(animation),
                );
              },
              child: textWidget,
            ),
            // AnimatedSwitcher(
            //   duration: const Duration(milliseconds: 500),
            //   transitionBuilder: (Widget child, Animation<double> animation) {
            //     return _SlideTransitionX(
            //       child: child,
            //       direction: AxisDirection.down, // 上入下出
            //       position: animation,
            //     );
            //   },
            //   child: textWidget,
            // ),
            RaisedButton(
              child: const Text('+1'),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class _SlideTransition extends AnimatedWidget {
  final bool transformHitTests;
  final Widget child;
  Animation<Offset> get position => listenable;

  _SlideTransition(
      {Key key,
      @required Animation<Offset> position,
      this.transformHitTests = true,
      this.child})
      : assert(position != null),
        super(key: key, listenable: position);

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    // 动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

// class _SlideTransitionX extends AnimatedWidget {
//   _SlideTransitionX({
//     Key key,
//     @required Animation<double> position,
//     this.transformHitTests = true,
//     this.direction = AxisDirection.down,
//     this.child,
//   })  : assert(position != null),
//         super(key: key, listenable: position) {
//     // 偏移在内部处理
//     switch (direction) {
//       case AxisDirection.up:
//         _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
//         break;
//       case AxisDirection.right:
//         _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
//         break;
//       case AxisDirection.down:
//         _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
//         break;
//       case AxisDirection.left:
//         _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
//         break;
//     }
//   }

//   Animation<double> get position => listenable;

//   final bool transformHitTests;

//   final Widget child;

//   // 退场（出）方向
//   final AxisDirection direction;

//   Tween<Offset> _tween;

//   @override
//   Widget build(BuildContext context) {
//     Offset offset = _tween.evaluate(position);
//     if (position.status == AnimationStatus.reverse) {
//       switch (direction) {
//         case AxisDirection.up:
//           offset = Offset(offset.dx, -offset.dy);
//           break;
//         case AxisDirection.right:
//           offset = Offset(-offset.dx, offset.dy);
//           break;
//         case AxisDirection.down:
//           offset = Offset(offset.dx, -offset.dy);
//           break;
//         case AxisDirection.left:
//           offset = Offset(-offset.dx, offset.dy);
//           break;
//       }
//     }
//     return FractionalTranslation(
//       translation: offset,
//       transformHitTests: transformHitTests,
//       child: child,
//     );
//   }
// }
