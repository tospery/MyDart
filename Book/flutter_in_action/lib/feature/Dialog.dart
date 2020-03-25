import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('对话框1'),
              onPressed: () async {
                bool delete = await showDeleteConfirmDialog1(context);
                if (delete == null) {
                  print('取消');
                } else {
                  print('确认');
                }
              },
            ),
            RaisedButton(
              child: Text('对话框2'),
              onPressed: () async {
                await changeLanguage(context);
              },
            ),
            RaisedButton(
              child: Text('对话框3'),
              onPressed: () async {
                await showListDialog(context);
              },
            ),
            RaisedButton(
              child: Text('对话框4'),
              onPressed: () async {
                bool result = await showCustomDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('提示'),
                      content: Text('您确定要删除当前文件吗?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('取消'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        FlatButton(
                          child: Text('删除'),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        )
                      ],
                    );
                  },
                );
                print('result = $result');
              },
            ),
            RaisedButton(
              child: Text('对话框（复选框可点击）'),
              onPressed: () async {
                // 弹出删除确认对话框，等待用户确认
                bool deleteTree = await showDeleteConfirmDialog3(context);
                if (deleteTree == null) {
                  print('取消删除');
                } else {
                  print('同时删除子目录: $deleteTree');
                }
              },
            ),
            RaisedButton(
              child: Text('显示底部菜单列表'),
              onPressed: () async {
                int type = await _showModalBottomSheet(context);
                print(type);
              },
            ),
            RaisedButton(
              child: Text('全屏对话框'),
              onPressed: () {
                _showBottomSheet(context);
              },
            ),
            RaisedButton(
              child: Text('Loading'),
              onPressed: () {
                showLoadingDialog(context);
              },
            ),
            RaisedButton(
              child: Text('日历（Material风格）'),
              onPressed: () {
                _showDatePicker1(context);
              },
            ),
            RaisedButton(
              child: Text('日历（iOS风格）'),
              onPressed: () {
                _showDatePicker2(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> changeLanguage(BuildContext context) async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              )
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog(BuildContext context) async {
    int index = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          var child = Column(
            children: <Widget>[
              ListTile(
                title: Text('请选择'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('$index'),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                ),
              )
            ],
          );
          // 1. 不能使用AlertDialog，会报错
          // return Dialog(child: child);

          // 2. 实现2
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 280),
              child: Material(child: child, type: MaterialType.card),
            ),
          );
        });
    if (index != null) {
      print('点击了: $index');
    }
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return theme != null
                  ? Theme(data: theme, child: pageChild)
                  : pageChild;
            },
          ),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }

  Future<bool> showDeleteConfirmDialog3(BuildContext context) {
    bool _withTree = false;
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('您确定要删除当前文件吗?'),
                Row(
                  children: <Widget>[
                    Text('同时删除子目录？'),
                    // 实现1
                    // DialogCheckbox(
                    //   value: _withTree,
                    //   onChanged: (bool value) {
                    //     _withTree = !_withTree;
                    //   },
                    // )

                    // 实现2: 使用StatefulBuilder来构建StatefulWidget上下文
                    // StatefulBuilder(
                    //   builder: (context, _setState) {
                    //     return Checkbox(
                    //       value: _withTree,
                    //       onChanged: (bool value) {
                    //         _setState(() {
                    //           _withTree = !_withTree;
                    //         });
                    //       },
                    //     );
                    //   },
                    // )

                    // 实现3:
                    // 通过Builder来获得构建Checkbox的`context`，这是一种常用的缩小`context`范围的方式
                    Builder(
                      builder: (BuildContext context) {
                        return Checkbox(
                          value: _withTree,
                          onChanged: (bool value) {
                            (context as Element).markNeedsBuild();
                            _withTree = !_withTree;
                          },
                        );
                      },
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () {
                  Navigator.of(context).pop(_withTree);
                },
              )
            ],
          );
        });
  }

  Future<int> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('$index'),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
          );
        });
  }

  PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
    return showBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('$index'),
                onTap: () {
                  print('$index');
                  Navigator.of(context).pop();
                },
              );
            },
          );
        });
  }

  showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(
                      value: .8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0),
                      child: Text("正在加载，请稍后..."),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<DateTime> _showDatePicker1(BuildContext context) {
    var date = DateTime.now();
    return showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: date.add(Duration(days: 30)));
  }

  Future<DateTime> _showDatePicker2(BuildContext context) {
    var date = DateTime.now();
    return showCupertinoModalPopup(
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              minimumDate: date,
              maximumDate: date.add(Duration(days: 30)),
              maximumYear: date.year + 1,
              onDateTimeChanged: (DateTime value) {
                print(value);
              },
            ),
          );
        });
  }
}

class DialogCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  DialogCheckbox({Key key, this.value, @required this.onChanged});

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        // 将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          // 更新自身选中状态
          value = v;
        });
      },
    );
  }
}
