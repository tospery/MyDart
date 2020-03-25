import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Echo extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const Echo({Key key, @required this.text, this.backgroundColor: Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: backgroundColor, child: Text(text)),
    );
  }
}

class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Context测试')),
      body: Container(
        child: Builder(builder: (context) {
          // 在Widget树中向上查找最近的父级`Scaffold` widget
          Scaffold scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
          // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  final int initValue;

  const CounterWidget({Key key, this.initValue = 0}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    // 初始化状态
    _counter = widget.initValue;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
          child: FlatButton(
        child: Text('$_counter'),
        // 点击后计数器自增
        onPressed: () => setState(() => ++_counter),
      )),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}

class AncestorStateWidget extends StatefulWidget {
  AncestorStateWidget({Key key}) : super(key: key);

  @override
  _AncestorState createState() => _AncestorState();
}

class _AncestorState extends State<AncestorStateWidget> {
  // 定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(title: Text('子树中获取State对象')),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
              onPressed: () {
                // 1. 查找父级最近的Scaffold对应的ScaffoldState对象
                // ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();

                // 2. 直接通过of静态方法来获取ScaffoldState
                // ScaffoldState _state = Scaffold.of(context);

                // 3. 通过GlobalKey来获取
                ScaffoldState _state = _globalKey.currentState;

                // 调用ScaffoldState的showSnackBar来弹出SnackBar
                _state.showSnackBar(SnackBar(content: Text('我是SnackBar')));
              },
              child: Text("显示SnackBar"));
        }),
      ),
    );
  }
}

class CupertinoTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Cupertino Demo')),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text("Press"),
            onPressed: () {}
        ),
      ),
    );
  }
}
