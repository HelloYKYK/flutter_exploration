import 'package:flutter/material.dart';
import 'package:my_flutter/group_layout/FlexLayout.dart';
import 'package:my_flutter/group_layout/FlowLayout.dart';
import 'package:my_flutter/group_layout/LayoutWidget.dart';
import 'package:my_flutter/group_layout/LinearLayout.dart';
import 'package:my_flutter/group_layout/StackLayout.dart';
import 'package:my_flutter/start/Assets.dart';
import 'package:my_flutter/start/tryFlutterWidget.dart';
import 'package:my_flutter/widget_basis/Buttons.dart';
import 'package:my_flutter/widget_basis/CheckBoxs.dart';
import 'package:my_flutter/widget_basis/ImageAndIcons.dart';
import 'package:my_flutter/widget_basis/InputWidget.dart';
import 'package:my_flutter/widget_basis/StateLifeCycle.dart';
import 'package:my_flutter/widget_basis/StateManager.dart';
import 'package:my_flutter/widget_basis/TextFontStyle.dart';
import 'package:my_flutter/widget_basis/WidgetDetail.dart';
import 'package:my_flutter/widget_basis/YinYang.dart';
import 'package:my_flutter/widget_basis/randomWideget.dart';

void main() => runApp(new MyApp());

///parent_xx 为列表小title
///不带parent_前缀的为列表项
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    courses[0] = 'parent_第一个flutter应用';
    courses[1] = '体验Flutter';
    courses[3] = '随机单词收藏';
    courses[5] = 'Assets';
    courses[6] = 'parent_基础Widgets';
    courses[7] = 'Widget简介';
    courses[9] = '文本、字体样式';
    courses[11] = '按钮';
    courses[13] = '图片和Icon';
    courses[15] = '单选框和复选框';
    courses[17] = '输入框和表单';
    courses[18] = 'parent_布局类Widgets';
    courses[19] = '布局类Widgets简介';
    courses[21] = '线性布局Row、Column';
    courses[23] = '弹性布局Flex';
    courses[25] = '流式布局Wrap、Flow';
    courses[27] = '层叠布局Stack、Positioned';
    courses[29] = '阴阳记';
    return new MaterialApp(
        title: 'Startup Name Generator',
        home: new StudyApp(),
        theme: new ThemeData(primaryColor: Colors.green),
        routes: <String, WidgetBuilder>{
          '/1': (BuildContext context) =>
              TryFlutter(title: 'Flutter Demo Home Page'),
          '/3': (BuildContext context) => RandomWords(),
          '/5': (BuildContext context) => AssetsWidgets(),
          '/7': (BuildContext context) => WidgetDetail(title: 'Widget简介'),
          '/7.1': (BuildContext context) => RouterWidget(),
          '/7.2': (BuildContext context) => StateManager(
                title: 'State管理',
              ),
          '/9': (BuildContext context) => TextFontStyle(
                title: "文本、字体样式",
              ),
          '/11': (BuildContext context) => Buttons(
                title: "按钮",
              ),
          '/13': (BuildContext context) => ImageAndIcons(
                title: "图片和Icon",
              ),
          '/15': (BuildContext context) => CheckBoxs(
                title: "单选框和复选框",
              ),
          '/17': (BuildContext context) => InputWidget(
                title: "输入框和表单",
              ),
          '/19': (BuildContext context) => LayoutWidget(title: "布局类Widgets简介"),
          '/21': (BuildContext context) =>
              LinearLayout(title: "线性布局Row、Column"),
          '/23': (BuildContext context) => FlexLayout(title: "弹性布局Flex"),
          '/25': (BuildContext context) => FlowLayout(title: "流式布局Wrap、Flow"),
          '/27': (BuildContext context) =>
              StackLayout(title: "层叠布局Stack、Positioned"),
          '/29':(BuildContext context) => YinYang(title:"阴阳记")
        });
  }
}

var courses = List<String>(50);

class StudyApp extends StatefulWidget {
  @override
  _StudyAppState createState() => _StudyAppState();
}

class _StudyAppState extends State<StudyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Seclect '),
      ),
      body: _buildCourse(),
    );
  }

  Widget _buildCourse() {
    return new ListView.builder(
        padding: const EdgeInsets.all(4.0),
        itemCount: courses.length,
        itemBuilder: (context, i) {
          if (!i.isOdd) {
            String course = courses[i];
            if (course == null) {
              return new Divider();
            }
            if (course.startsWith('parent_')) {
              //副标题
              return _buildTitle(courses[i].substring(7, courses[i].length));
            } else {
              return new Divider();
            }
          } else {
            return _buildRow(i);
          }
//          print(courses[i] + 'i=' + i.toString());
        });
  }

  Widget _buildRow(int course) {
    if (courses[course] != null) {
      return new ListTile(
        title: new Text(courses[course]),
        onTap: () {
          String router = '/' + course.toString();
          Navigator.pushNamed(context, router);
        },
      );
    } else {
      return null;
    }
  }

  Widget _buildTitle(String title) {
    return new Container(
      child: Column(
        children: <Widget>[
          new Divider(),
          new Text(
            title,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          new Divider()
        ],
      ),
    );

//    return new Text(color: Colors.green, child: new Text(title));
  }
}
