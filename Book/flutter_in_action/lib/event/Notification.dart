import 'package:flutter/material.dart';

class MyNotification1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationListener'),
      ),
      body: NotificationListener(
        onNotification: (notification) {
          switch (notification.runtimeType) {
            case ScrollStartNotification:
              print('开始滚动');
              break;
            case ScrollUpdateNotification:
              print('正在滚动');
              break;
            case ScrollEndNotification:
              print('滚动停止');
              break;
            case OverscrollNotification:
              print('滚动到边界');
              break;
          }
          return false;
        },
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
            );
          },
        ),
      ),
    );
  }
}

class MyNotification2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationListener'),
      ),
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          print(notification);
          return false;
        },
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
            );
          },
        ),
      ),
    );
  }
}

class MyNotification3 extends StatefulWidget {
  @override
  _MyNotification3State createState() => _MyNotification3State();
}

class _MyNotification3State extends State<MyNotification3> {
  String _msg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义通知'),
      ),
      body: NotificationListener<CustomNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                    onPressed: () => CustomNotification("Hi").dispatch(context),
                    child: Text("Send Notification"),
                  );
                },
              ),
              Text(_msg)
            ],
          ),
        ),
      ),
    );
  }
}

class MyNotification4 extends StatefulWidget {
  @override
  _MyNotification4State createState() => _MyNotification4State();
}

class _MyNotification4State extends State<MyNotification4> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('阻止冒泡'),
      ),
      body: NotificationListener<CustomNotification>(
        onNotification: (notification) {
          print(notification.msg);
          return false;
        },
        child: NotificationListener<CustomNotification>(
          onNotification: (notification) {
            setState(() {
              _msg += notification.msg + "  ";
            });
            return true;
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () =>
                          CustomNotification("Hi").dispatch(context),
                      child: Text("Send Notification"),
                    );
                  },
                ),
                Text(_msg)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNotification extends Notification {
  final String msg;
  CustomNotification(this.msg);
}
