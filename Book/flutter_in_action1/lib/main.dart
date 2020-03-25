import 'package:flutter/material.dart';
import 'basic/first.dart';
import 'basic/route.dart';
import 'basic/package.dart';
import 'basic/resource.dart';
import 'basic/debug.dart';
import 'widget/widget.dart';
import 'widget/state.dart';
import 'widget/text.dart';
import 'widget/button.dart';
import 'widget/image.dart';
import 'widget/switch.dart';
import 'widget/textField.dart';
import 'widget/form.dart';
import 'widget/progress.dart';
import 'layout/linear.dart';
import 'layout/flex.dart';
import 'layout/flow.dart';
import 'layout/stack.dart';
import 'layout/relative.dart';
import 'container/padding.dart';
import 'container/size.dart';
import 'container/decorate.dart';
import 'container/transform.dart';
import 'container/container.dart';
import 'container/scaffold.dart';
import 'container/clip.dart';
import 'scroll/SingleChildScrollView.dart';
import 'scroll/ListView.dart';
import 'scroll/GridView.dart';
import 'scroll/CustomScrollView.dart';
import 'scroll/ScrollController.dart';
import 'scroll/ScrollNotification.dart';
import 'feature/WillPopScope.dart';
import 'feature/InheritedWidget.dart';

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
        'new_page1': (context) => NewRoute(),
        'new_page2': (context) => EchoRoute(),
        'new_page3': (context) =>
            TipRoute(text: ModalRoute.of(context).settings.arguments),
        'randomWords': (context) => RandomWordsWidget(),
        'resourceTest1': (context) => ResourceTest1(),
        'resourceTest2': (context) => ResourceTest2(),
        'resourceTest3': (context) => ResourceTest3(),
        'debugTest1': (context) => DebugTest1(),
        'echo': (context) => Echo(text: 'hello world'),
        'contextRoute': (context) => ContextRoute(),
        'counterWidget': (context) => CounterWidget(),
        'ancestorState': (context) => AncestorStateWidget(),
        'cupertino': (context) => CupertinoTestRoute(),
        'tapboxA': (context) => TapboxA(),
        'tapboxB': (context) => ParentWidget(),
        'tapboxC': (context) => ParentWidgetC(),
        'textTest': (context) => TextTest(),
        'textStyleTest': (context) => TextStyleTest(),
        'textSpanTest': (context) => TextSpanTest(),
        'defaultTextStyleTest': (context) => DefaultTextStyleTest(),
        'fontTest': (context) => FontTest(),
        'buttonTest': (context) => ButtonTest(),
        'localImageTest': (context) => LocalImageTest(),
        'networkImageTest': (context) => NetworkImageTest(),
        'boxFitTest': (context) => BoxFitTest(),
        'blendModeTest': (context) => BlendModeTest(),
        'imageRepeatTest': (context) => ImageRepeatTest(),
        'imageAndIconRoute': (context) => ImageAndIconRoute(),
        'iconfontTest1': (context) => IconfontTest1(),
        'iconfontTest2': (context) => IconfontTest2(),
        'iconfontTest3': (context) => IconfontTest3(),
        'switchAndCheckBoxTest': (context) => SwitchAndCheckBoxTestRoute(),
        'textFieldAndFormTest': (context) => TextFieldAndFormTest(),
        'focusTestRoute': (context) => FocusTestRoute(),
        'inputDecorationTest': (context) => InputDecorationTest(),
        'FormTestRoute': (context) => FormTestRoute(),
        'ProgressIndicatorTest': (context) => ProgressIndicatorTest(),
        'ProgressRoute': (context) => ProgressRoute(),
        'LinearTest1': (context) => LinearTest1(),
        'LinearTest2': (context) => LinearTest2(),
        'LinearTest3': (context) => LinearTest3(),
        'FlexLayoutTestRoute': (context) => FlexLayoutTestRoute(),
        'WrapTest': (context) => WrapTest(),
        'FlowTest': (context) => FlowTest(),
        'StackTest1': (context) => StackTest1(),
        'StackTest2': (context) => StackTest2(),
        'RelativeTest1': (context) => RelativeTest1(),
        'RelativeTest2': (context) => RelativeTest2(),
        'PaddingTestRoute': (context) => PaddingTestRoute(),
        'ConstrainedBoxTest': (context) => ConstrainedBoxTest(),
        'SizedBoxTest': (context) => SizedBoxTest(),
        'UnconstrainedBoxTest': (context) => UnconstrainedBoxTest(),
        'DecoratedBoxTest': (context) => DecoratedBoxTest(),
        'TransformTest': (context) => TransformTest(),
        'ContainerTest': (context) => ContainerTest(),
        'MyContainer': (context) => MyContainer(),
        'MyScaffold': (context) => MyScaffold(),
        'MyClip': (context) => MyClip(),
        'MyScroll': (context) => MyScroll(),
        'MySingleChildScrollView': (context) => MySingleChildScrollView(),
        'MyListView1': (context) => MyListView1(),
        'MyListView2': (context) => MyListView2(),
        'MyListView3': (context) => MyListView3(),
        'MyListView4': (context) => MyListView4(),
        'MyListView5': (context) => MyListView5(),
        'MyGridView1': (context) => MyGridView1(),
        'MyGridView2': (context) => MyGridView2(),
        'MyGridView3': (context) => MyGridView3(),
        'MyGridView4': (context) => MyGridView4(),
        'MyGridView5': (context) => MyGridView5(),
        'MyCustomScrollView': (context) => MyCustomScrollView(),
        'MyScrollController': (context) => MyScrollController(),
        'MyScrollNotification': (context) => MyScrollNotification(),
        'MyFeature': (context) => MyFeature(),
        'MyWillPopScope': (context) => MyWillPopScope(),
        'MyInheritedWidget': (context) => MyInheritedWidget(),
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          print('未注册路由：$routeName');
          return NewRoute();
        });
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    {'pattern': '', 'name': '计数器示例'},
    {'pattern': '', 'name': '路由管理-简单示例'},
    {'pattern': '', 'name': '路由管理-路由传值'},
    {'pattern': 'new_page1', 'name': '路由管理-命名路由1'},
    {'pattern': 'new_page2', 'name': '路由管理-命名路由2'},
    {'pattern': 'new_page3', 'name': '路由管理-命名路由3'},
    {'pattern': 'new_page4', 'name': '路由管理-命名路由4'},
    {'pattern': 'randomWords', 'name': '包管理-随机字符串'},
    {'pattern': 'resourceTest1', 'name': '资源管理-rootBundle'},
    {'pattern': 'resourceTest2', 'name': '资源管理-AssetImage'},
    {'pattern': 'resourceTest3', 'name': '资源管理-Image.asset'},
    {'pattern': 'debugTest1', 'name': '调试-debugDumpApp'},
    {'pattern': 'echo', 'name': 'widget-StatelessWidget'},
    {'pattern': 'contextRoute', 'name': 'widget-context'},
    {'pattern': 'counterWidget', 'name': 'widget-生命周期'},
    {'pattern': 'ancestorState', 'name': 'widget-ancestorState'},
    {'pattern': 'cupertino', 'name': 'widget-Cupertino（iOS风格）'},
    {'pattern': 'tapboxA', 'name': '状态管理-Widget管理自身状态'},
    {'pattern': 'tapboxB', 'name': '状态管理-父Widget管理子Widget的状态'},
    {'pattern': 'tapboxC', 'name': '状态管理-混合状态管理'},
    {'pattern': 'textTest', 'name': '文本、字体样式-Text'},
    {'pattern': 'textStyleTest', 'name': '文本、字体样式-TextStyle'},
    {'pattern': 'textSpanTest', 'name': '文本、字体样式-TextSpan'},
    {'pattern': 'defaultTextStyleTest', 'name': '文本、字体样式-DefaultTextStyle'},
    {'pattern': 'fontTest', 'name': '文本、字体样式-Font'},
    {'pattern': 'buttonTest', 'name': '按钮'},
    {'pattern': 'localImageTest', 'name': '图片和Icon-本地图片'},
    {'pattern': 'networkImageTest', 'name': '图片和Icon-网络图片'},
    {'pattern': 'boxFitTest', 'name': '图片和Icon-BoxFit'},
    {'pattern': 'blendModeTest', 'name': '图片和Icon-BlendMode'},
    {'pattern': 'imageRepeatTest', 'name': '图片和Icon-ImageRepeat'},
    {'pattern': 'imageAndIconRoute', 'name': '图片和Icon-属性演示'},
    {'pattern': 'iconfontTest1', 'name': '图片和Icon-矢量图标1'},
    {'pattern': 'iconfontTest2', 'name': '图片和Icon-矢量图标2'},
    {'pattern': 'iconfontTest3', 'name': '图片和Icon-矢量图标3'},
    {'pattern': 'switchAndCheckBoxTest', 'name': '单选框和复选框'},
    {'pattern': 'textFieldAndFormTest', 'name': '输入框和表单'},
    {'pattern': 'focusTestRoute', 'name': '输入框和表单-焦点'},
    {'pattern': 'inputDecorationTest', 'name': '输入框和表单-InputDecoration'},
    {'pattern': 'FormTestRoute', 'name': '表单'},
    {'pattern': 'ProgressIndicatorTest', 'name': '进度指示器1'},
    {'pattern': 'ProgressRoute', 'name': '进度指示器2'},
    {'pattern': 'LinearTest1', 'name': '线性布局1'},
    {'pattern': 'LinearTest2', 'name': '线性布局2'},
    {'pattern': 'LinearTest3', 'name': '线性布局3'},
    {'pattern': 'FlexLayoutTestRoute', 'name': '弹性布局'},
    {'pattern': 'WrapTest', 'name': '流式布局-Wrap'},
    {'pattern': 'FlowTest', 'name': '流式布局-Flow'},
    {'pattern': 'StackTest1', 'name': '层叠布局1'},
    {'pattern': 'StackTest2', 'name': '层叠布局2'},
    {'pattern': 'RelativeTest1', 'name': '相对布局1'},
    {'pattern': 'RelativeTest2', 'name': '相对布局2'},
    {'pattern': 'PaddingTestRoute', 'name': '填充容器Padding'},
    {'pattern': 'ConstrainedBoxTest', 'name': '约束盒子ConstrainedBox'},
    {'pattern': 'SizedBoxTest', 'name': '大小盒子SizedBox'},
    {'pattern': 'UnconstrainedBoxTest', 'name': '剔除约束盒子UnconstrainedBox'},
    {'pattern': 'DecoratedBoxTest', 'name': '装饰容器DecoratedBox'},
    {'pattern': 'TransformTest', 'name': '转换Transform'},
    {'pattern': 'ContainerTest', 'name': '容器Container'},
    {'pattern': 'MyContainer', 'name': '容器类组件'},
    {'pattern': 'MyScroll', 'name': '可滚动组件'},
    {'pattern': 'MyFeature', 'name': '功能性部件'},
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
                case 0:
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyCounter(title: 'My Counter');
                  }));
                  break;
                case 1:
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewRoute();
                  }));
                  break;
                case 2:
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RouterTestRoute();
                  }));
                  break;
                case 4:
                case 5:
                  Navigator.pushNamed(context, _list[index]['pattern'],
                      arguments: 'hi');
                  break;
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

class MyContainer extends StatefulWidget {
  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  final _list = [
    {'pattern': 'MyScaffold', 'name': '框架Scaffold'},
    {'pattern': 'MyClip', 'name': '剪裁Clip'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('容器类组件')),
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

class MyScroll extends StatefulWidget {
  @override
  _MyScrollState createState() => _MyScrollState();
}

class _MyScrollState extends State<MyScroll> {
  final _list = [
    {'pattern': 'MySingleChildScrollView', 'name': 'SingleChildScrollView'},
    {'pattern': 'MyListView1', 'name': 'ListView-构造函数'},
    {'pattern': 'MyListView2', 'name': 'ListView-builder'},
    {'pattern': 'MyListView3', 'name': 'ListView-separated'},
    {'pattern': 'MyListView4', 'name': 'ListView-加载更多'},
    {'pattern': 'MyListView5', 'name': 'ListView-头'},
    {'pattern': 'MyGridView1', 'name': 'GridView-SliverGridDelegateWithFixedCrossAxisCount'},
    {'pattern': 'MyGridView2', 'name': 'GridView-count'},
    {'pattern': 'MyGridView3', 'name': 'GridView-SliverGridDelegateWithMaxCrossAxisExtent'},
    {'pattern': 'MyGridView4', 'name': 'GridView-extent'},
    {'pattern': 'MyGridView5', 'name': 'GridView-builder'},
    {'pattern': 'MyCustomScrollView', 'name': 'CustomScrollView'},
    {'pattern': 'MyScrollController', 'name': 'ScrollController'},
    {'pattern': 'MyScrollNotification', 'name': 'ScrollNotification'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('可滚动组件')),
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

class MyFeature extends StatefulWidget {
  @override
  _MyFeatureState createState() => _MyFeatureState();
}

class _MyFeatureState extends State<MyFeature> {
  final _list = [
    {'pattern': 'MyWillPopScope', 'name': '导航返回拦截-WillPopScope'},
    {'pattern': 'MyInheritedWidget', 'name': '数据共享-InheritedWidget'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('可滚动组件')),
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