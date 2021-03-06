import 'package:flutter/material.dart';

class MyStaggerAnimation extends StatefulWidget {
  @override
  _MyStaggerAnimationState createState() => _MyStaggerAnimationState();
}

class _MyStaggerAnimationState extends State<MyStaggerAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('交织动画'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            // child: _StaggerAnimation(
            //   controller: _controller,
            // ),
          ),
        ),
      ),
    );
  }

  Future<Null> _playAnimation() async {
    try {
      // 先正向执行动画
      await _controller.forward().orCancel;
      // 再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }
}

// class _StaggerAnimation extends StatelessWidget {
//   final Animation<double> controller;
//   Animation<double> height;
//   Animation<EdgeInsets> padding;
//   Animation<Color> color;

//   _StaggerAnimation({Key key, this.controller}) : super(key: key) {
//     // 高度动画
//     height = Tween<double>(begin: 0.0, end: 300.0).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: Interval(0.0, 0.6, curve: Curves.ease),
//       ),
//     );
//     // 颜色动画
//     color = ColorTween(begin: Colors.green, end: Colors.red).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: Interval(0.0, 0.6, curve: Curves.ease),
//       ),
//     );
//     // 距离动画
//     padding = Tween<EdgeInsets>(
//       begin: EdgeInsets.only(left: 0),
//       end: EdgeInsets.only(left: 100),
//     ).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: Interval(0.6, 1.0, curve: Curves.ease),
//       ),
//     );
//   }

//   Widget _buildAnimation(BuildContext context, Widget child) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       padding: padding.value,
//       child: Container(
//         color: color.value,
//         width: 50.0,
//         height: height.value,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       builder: _buildAnimation,
//       animation: controller,
//     );
//   }
// }
