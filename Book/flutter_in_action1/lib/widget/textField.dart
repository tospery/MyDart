import 'package:flutter/material.dart';

class TextFieldAndFormTest extends StatefulWidget {
  @override
  _TextFieldAndFormState createState() => _TextFieldAndFormState();
}

class _TextFieldAndFormState extends State<TextFieldAndFormTest> {
  final TextEditingController _unameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _unameController.text = 'hello world!';
    _unameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _unameController.text.length);
    _unameController.addListener(() {
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField/Form')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
            autofocus: true,
            controller: _unameController,
            decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名或邮箱',
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            onChanged: (v) {
              print('onChanged: $v');
            },
            decoration: InputDecoration(
                labelText: '密码',
                hintText: '您的登录密码',
                prefixIcon: Icon(Icons.lock)),
            obscureText: true,
          )
        ],
      )),
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    focusNode2.addListener(() {
      print(focusNode2.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Focus')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          TextField(
              autofocus: true,
              focusNode: focusNode1,
              decoration: InputDecoration(labelText: 'input1')),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(labelText: "input2"),
          ),
          Builder(builder: (ctx) {
            return Column(children: <Widget>[
              RaisedButton(
                  child: Text('移动焦点'),
                  onPressed: () {
                    // 将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    if (null == focusScopeNode) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusNode1.unfocus();
                    focusScopeNode.requestFocus(focusNode2);
                  }),
              RaisedButton(
                child: Text("隐藏键盘"),
                onPressed: () {
                  // 当所有编辑框都失去焦点时键盘就会收起
                  focusNode1.unfocus();
                  focusNode2.unfocus();
                },
              ),
            ]);
          })
        ]),
      ),
    );
  }
}

class InputDecorationTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InputDecoration')),
      body: Center(
          child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(
              labelText: '请输入用户名',
              prefixIcon: Icon(Icons.person),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue))),
        ),
        Theme(
          data: Theme.of(context).copyWith(
              hintColor: Colors.grey[200],
              inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0))),
          child: Column(
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(
                      labelText: '用户名',
                      hintText: '用户名或邮箱',
                      prefixIcon: Icon(Icons.person))),
              TextField(
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '您的登录密码',
                    prefixIcon: Icon(Icons.lock),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 8.0)),
                obscureText: true,
              )
            ],
          ),
        ),
        Container(
          child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: '电子邮件地址',
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none)),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[200], width: 1.0))),
        )
      ])),
    );
  }
}
