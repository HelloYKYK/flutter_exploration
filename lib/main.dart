import 'package:flutter/material.dart';
import 'package:my_flutter/Assets.dart';
import 'package:my_flutter/StateLifeCycle.dart';
import 'package:my_flutter/StateManager.dart';
import 'package:my_flutter/WidgetDetail.dart';
import 'package:my_flutter/randomWideget.dart';
import 'package:my_flutter/tryFlutterWidget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    courses[0] = 'parent_第一个flutter应用';
    courses[1] = '体验Flutter';
    courses[3] = '随机单词收藏';
    courses[5] = 'Assets';
    courses[6] = 'parent_基础Widgets';
    courses[7] = 'Widget简介';
    courses[9] = 'State生命周期';
    courses[11] = 'State管理';
    return new MaterialApp(
        title: 'Startup Name Generator',
        home: new StudyApp(),
        theme: new ThemeData(primaryColor: Colors.green),
        routes: <String, WidgetBuilder>{
          '/1': (BuildContext context) =>
              TryFlutter(title: 'Flutter Demo Home Page'),
          '/3': (BuildContext context) => RandomWords(),
          '/5': (BuildContext context) => AssetsWidgets(),
          '/7': (BuildContext context) => WidgetDetail( title: 'Widget1'),
          '/9': (BuildContext context) => RouterWidget(),
          '/11': (BuildContext context) => StateManager(title: 'State管理',),
//          '/9': (BuildContext context) =>JiCheng(key,Colors.blue,""),
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
          }else{
            return _buildRow(i);

          }
//          print(courses[i] + 'i=' + i.toString());

        });
  }

  Widget _buildRow(int course) {
    if(courses[course]!=null){

    return new ListTile(
      title: new Text(courses[course]),
      onTap: () {
        String router = '/' + course.toString();
        Navigator.pushNamed(context, router);
      },
    );
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
