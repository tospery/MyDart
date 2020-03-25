import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyRouteAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由动画'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('内置版本'),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => _PageB()));
              },
            ),
            RaisedButton(
              child: Text('PageRouteBuilder'),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return FadeTransition(
                        opacity: animation,
                        child: _PageB(),
                      );
                    },
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text('自定义路由'),
              onPressed: () {
                Navigator.push(context, FadeRoute(builder: (context) {
                  return _PageB();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('新路由 '),
      ),
      body: null,
    );
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // return FadeTransition(
    //   opacity: animation,
    //   child: builder(context),
    // );

    //当前路由被激活，是打开新路由
    if (isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    }

    //是返回，则不应用过渡动画
    return Padding(padding: EdgeInsets.zero);
  }
}
