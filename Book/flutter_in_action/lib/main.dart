import 'package:flutter/material.dart';
// 功能性组件
import 'feature/WillPopScope.dart';
import 'feature/InheritedWidget.dart';
import 'feature/Provider.dart';
import 'feature/Color.dart';
import 'feature/Theme.dart';
import 'feature/FutureBuilder.dart';
import 'feature/StreamBuilder.dart';
import 'feature/Dialog.dart';
// 事件处理与通知
import 'event/Listener.dart';
import 'event/GestureDetector.dart';
import 'event/GestureRecognizer.dart';
import 'event/Notification.dart';
// 动画
import 'animation/SimpleAnimation.dart';
import 'animation/RouteAnimation.dart';
import 'animation/HeroAnimation.dart';
import 'animation/StaggerAnimation.dart';
import 'animation/AnimatedSwitcher.dart';
import 'animation/TransitionAnimation.dart';
// 自定义组件
import 'custom/GradientButton.dart';
import 'custom/TurnBox.dart';
import 'custom/CustomPaint.dart';
// 文件操作
import 'file/file.dart';
import 'file/FileOperationRoute.dart';
// 网络请求
import 'network/network.dart';
import 'network/HttpTestRoute.dart';
import 'network/FutureBuilderRoute.dart';
import 'network/DownloadRoute.dart';
import 'network/WebSocketRoute.dart';
import 'network/SocketAPIRoute.dart';
// 插件
import 'plugin/plugin.dart';
import 'plugin/CameraExampleHome.dart';
// 本地化
import 'localization/localization.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'MyFeature': (context) => MyFeature(),
        'MyWillPopScope': (context) => MyWillPopScope(),
        'MyInheritedWidget': (context) => MyInheritedWidget(),
        'MyProvider': (context) => MyProvider(),
        'MyColor': (context) => MyColor(),
        'MyTheme': (context) => MyTheme(),
        'MyFutureBuilder': (context) => MyFutureBuilder(),
        'MyStreamBuilder': (context) => MyStreamBuilder(),
        'MyDialog': (context) => MyDialog(),
        'MyEvent': (context) => MyEvent(),
        'MyListener1': (context) => MyListener1(),
        'MyListener2': (context) => MyListener2(),
        'MyListener3': (context) => MyListener3(),
        'MyListener4': (context) => MyListener4(),
        'MyListener5': (context) => MyListener5(),
        'MyGestureDetector1': (context) => MyGestureDetector1(),
        'MyGestureDetector2': (context) => MyGestureDetector2(),
        'MyGestureDetector3': (context) => MyGestureDetector3(),
        'MyGestureDetector4': (context) => MyGestureDetector4(),
        'MyGestureDetector5': (context) => MyGestureDetector5(),
        'MyGestureDetector6': (context) => MyGestureDetector6(),
        'MyGestureRecognizer': (context) => MyGestureRecognizer(),
        'MyNotification1': (context) => MyNotification1(),
        'MyNotification2': (context) => MyNotification2(),
        'MyNotification3': (context) => MyNotification3(),
        'MyNotification4': (context) => MyNotification4(),
        'MyAnimation': (context) => MyAnimation(),
        'MySimpleAnimation1': (context) => MySimpleAnimation1(),
        'MySimpleAnimation2': (context) => MySimpleAnimation2(),
        'MySimpleAnimation3': (context) => MySimpleAnimation3(),
        'MySimpleAnimation4': (context) => MySimpleAnimation4(),
        'MySimpleAnimation5': (context) => MySimpleAnimation5(),
        'MySimpleAnimation6': (context) => MySimpleAnimation6(),
        'MyRouteAnimation': (context) => MyRouteAnimation(),
        'MyHeroAnimation': (context) => MyHeroAnimation(),
        'MyStaggerAnimation': (context) => MyStaggerAnimation(),
        'MyAnimatedSwitcher': (context) => MyAnimatedSwitcher(),
        'MyTransitionAnimation1': (context) => MyTransitionAnimation1(),
        'MyTransitionAnimation2': (context) => MyTransitionAnimation2(),
        'MyCustom': (context) => MyCustom(),
        'GradientButtonRoute': (context) => GradientButtonRoute(),
        'TurnBoxRoute': (context) => TurnBoxRoute(),
        'CustomPaintRoute': (context) => CustomPaintRoute(),
        'GradientCircularProgressRoute': (context) => GradientCircularProgressRoute(),
        'MyFile': (context) => MyFile(),
        'FileOperationRoute': (context) => FileOperationRoute(),
        'MyNetwork': (context) => MyNetwork(),
        'HttpTestRoute': (context) => HttpTestRoute(),
        'FutureBuilderRoute': (context) => FutureBuilderRoute(),
        'DownloadRoute': (context) => DownloadRoute(),
        'WebSocketRoute': (context) => WebSocketRoute(),
        'SocketAPIRoute': (context) => SocketAPIRoute(),
        'MyPlugin': (context) => MyPlugin(),
        'CameraExampleHome': (context) => CameraExampleHome(),
        'MyLocalization': (context) => MyLocalization(),
      },
      home: MyHomePage(title: 'Flutter In Action'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _list = [
    {'pattern': 'MyFeature', 'name': '功能性部件'},
    {'pattern': 'MyEvent', 'name': '事件处理与通知'},
    {'pattern': 'MyAnimation', 'name': '动画'},
    {'pattern': 'MyCustom', 'name': '自定义组件'},
    {'pattern': 'MyFile', 'name': '文件操作'},
    {'pattern': 'MyNetwork', 'name': '网络请求'},
    {'pattern': 'MyPlugin', 'name': '插件'},
    {'pattern': 'MyLocalization', 'name': '本地化'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_list[index]['name']),
            onTap: () {
              switch (index) {
                // case 0:
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     return MyCounter(title: 'My Counter');
                //   }));
                //   break;
                default:
                  Navigator.pushNamed(context, _list[index]['pattern']);
                  break;
              }
            },
          );
        },
      ),
    );
  }
}

class MyFeature extends StatefulWidget {
  @override
  _MyFeatureState createState() => _MyFeatureState();
}

class _MyFeatureState extends State<MyFeature> {
  final _list = [
    {'pattern': 'MyWillPopScope', 'name': '导航返回拦截-WillPopScope'},
    {'pattern': 'MyInheritedWidget', 'name': '数据共享-InheritedWidget'},
    {'pattern': 'MyProvider', 'name': '跨部件状态共享-Provider'},
    {'pattern': 'MyColor', 'name': '颜色-亮度'},
    {'pattern': 'MyTheme', 'name': '主题-切换'},
    {'pattern': 'MyFutureBuilder', 'name': 'FutureBuilder'},
    {'pattern': 'MyStreamBuilder', 'name': 'StreamBuilder'},
    {'pattern': 'MyDialog', 'name': '对话框'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('功能性组件')),
      body: ListView.builder(
        itemCount: _list.length,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_list[index]['name']),
            onTap: () {
              Navigator.pushNamed(context, _list[index]['pattern']);
            },
          );
        },
      ),
    );
  }
}

class MyEvent extends StatefulWidget {
  @override
  _MyEventState createState() => _MyEventState();
}

class _MyEventState extends State<MyEvent> {
  final _list = [
    {'pattern': 'MyListener1', 'name': '事件监听器-HitTestBehavior.deferToChild'},
    {'pattern': 'MyListener2', 'name': '事件监听器-HitTestBehavior.opaque'},
    {'pattern': 'MyListener3', 'name': '事件监听器-HitTestBehavior.translucent'},
    {'pattern': 'MyListener4', 'name': '事件监听器-AbsorbPointer'},
    {'pattern': 'MyListener5', 'name': '事件监听器-IgnorePointer'},
    {'pattern': 'MyGestureDetector1', 'name': 'GestureDetector-点击/双击/长按'},
    {'pattern': 'MyGestureDetector2', 'name': 'GestureDetector-拖动/滑动'},
    {'pattern': 'MyGestureDetector3', 'name': 'GestureDetector-单一方向拖动'},
    {'pattern': 'MyGestureDetector4', 'name': 'GestureDetector-缩放'},
    {'pattern': 'MyGestureDetector5', 'name': 'GestureDetector-竞争'},
    {'pattern': 'MyGestureDetector6', 'name': 'GestureDetector-冲突'},
    {'pattern': 'MyGestureRecognizer', 'name': 'GestureRecognizer'},
    {'pattern': 'MyNotification1', 'name': 'NotificationListener-组通知'},
    {'pattern': 'MyNotification2', 'name': 'NotificationListener-单通知'},
    {'pattern': 'MyNotification3', 'name': 'Notification-自定义通知'},
    {'pattern': 'MyNotification4', 'name': 'Notification-阻止冒泡'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('事件处理与通知')),
      body: ListView.builder(
        itemCount: _list.length,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_list[index]['name']),
            onTap: () {
              Navigator.pushNamed(context, _list[index]['pattern']);
            },
          );
        },
      ),
    );
  }
}

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  final _list = [
    {'pattern': 'MySimpleAnimation1', 'name': '动画结构-匀速效果'},
    {'pattern': 'MySimpleAnimation2', 'name': '动画结构-弹簧效果'},
    {'pattern': 'MySimpleAnimation3', 'name': '动画结构-动画组件'},
    {'pattern': 'MySimpleAnimation4', 'name': '动画结构-动画构建1'},
    {'pattern': 'MySimpleAnimation5', 'name': '动画结构-动画构建2'},
    {'pattern': 'MySimpleAnimation6', 'name': '动画结构-动画构建3'},
    {'pattern': 'MyRouteAnimation', 'name': '路由动画'},
    {'pattern': 'MyHeroAnimation', 'name': '英雄动画'},
    {'pattern': 'MyStaggerAnimation', 'name': '交织动画'},
    {'pattern': 'MyAnimatedSwitcher', 'name': '切换动画'},
    {'pattern': 'MyTransitionAnimation1', 'name': '过渡动画1'},
    {'pattern': 'MyTransitionAnimation2', 'name': '过渡动画2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('动画')),
      body: ListView.builder(
        itemCount: _list.length,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_list[index]['name']),
            onTap: () {
              Navigator.pushNamed(context, _list[index]['pattern']);
            },
          );
        },
      ),
    );
  }
}

class MyCustom extends StatefulWidget {
  @override
  _MyCustomState createState() => _MyCustomState();
}

class _MyCustomState extends State<MyCustom> {
  final _list = [
    {'pattern': 'GradientButtonRoute', 'name': '渐变按钮'},
    {'pattern': 'TurnBoxRoute', 'name': '旋转盒子'},
    {'pattern': 'CustomPaintRoute', 'name': 'CustomPaint（棋盘）'},
    {'pattern': 'GradientCircularProgressRoute', 'name': 'CustomPaint（圆形背景渐变进度条）'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自定义组件')),
      body: ListView.builder(
        itemCount: _list.length,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_list[index]['name']),
            onTap: () {
              Navigator.pushNamed(context, _list[index]['pattern']);
            },
          );
        },
      ),
    );
  }
}
