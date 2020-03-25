import 'package:flutter/material.dart';

class MySimpleAnimation1 extends StatefulWidget {
  @override
  _MySimpleAnimation1State createState() => _MySimpleAnimation1State();
}

class _MySimpleAnimation1State extends State<MySimpleAnimation1>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('匀速效果'),
      ),
      body: Center(
          child: Image.asset('images/avatar.png',
              width: animation.value, height: animation.value)),
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() => {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MySimpleAnimation2 extends StatefulWidget {
  @override
  _MySimpleAnimation2State createState() => _MySimpleAnimation2State();
}

class _MySimpleAnimation2State extends State<MySimpleAnimation2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹性效果'),
      ),
      body: Center(
          child: Image.asset('images/avatar.png',
              width: animation.value, height: animation.value)),
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MySimpleAnimation3 extends StatefulWidget {
  @override
  _MySimpleAnimation3State createState() => _MySimpleAnimation3State();
}

class _MySimpleAnimation3State extends State<MySimpleAnimation3>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画组件'),
      ),
      body: Center(
        child: AnimatedImage(animation: animation),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MySimpleAnimation4 extends StatefulWidget {
  @override
  _MySimpleAnimation4State createState() => _MySimpleAnimation4State();
}

class _MySimpleAnimation4State extends State<MySimpleAnimation4>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画构建1'),
      ),
      body: AnimatedBuilder(
        animation: animation,
        child: Image.asset("images/avatar.png"),
        builder: (BuildContext ctx, Widget child) {
          return Center(
            child: Container(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MySimpleAnimation5 extends StatefulWidget {
  @override
  _MySimpleAnimation5State createState() => _MySimpleAnimation5State();
}

class _MySimpleAnimation5State extends State<MySimpleAnimation5>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画构建2'),
        ),
        body: GrowTransition(
            child: Image.asset('images/avatar.png'), animation: animation));
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MySimpleAnimation6 extends StatefulWidget {
  @override
  _MySimpleAnimation6State createState() => _MySimpleAnimation6State();
}

class _MySimpleAnimation6State extends State<MySimpleAnimation6>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画构建3'),
        ),
        body: GrowTransition(
            child: Image.asset('images/avatar.png'), animation: animation));
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
        child: Image.asset(
      'images/avatar.png',
      width: animation.value,
      height: animation.value,
    ));
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}
