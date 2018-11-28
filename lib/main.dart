import 'package:flutter/material.dart';
import 'package:my_flutter/randomWideget.dart';
import 'package:my_flutter/tryFlutterWidget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    courses[0] = '体验Flutter';
    courses[2] = '随机单词收藏';
    courses[4] = 'Widget 框架总览';
    courses[6] = 'Widget 目录';
    return new MaterialApp(
        title: 'Startup Name Generator',
        home: new StudyApp(),
        theme: new ThemeData(primaryColor: Colors.green),
        routes: <String, WidgetBuilder>{
          '/0': (BuildContext context) =>
              TryFlutter(title: 'Flutter Demo Home Page'),
          '/2': (BuildContext context) => RandomWords(),
        });
  }
}

var courses = List<String>(8);

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
          int index = 0;
          if (i.isOdd) return new Divider();
          print(courses[i] + 'i=' + i.toString());

          return _buildRow(i);
        });
  }

  Widget _buildRow(int course) {
    return new ListTile(
      title: new Text(courses[course]),
      onTap: () {
        String router = '/' + course.toString();
        Navigator.pushNamed(context, router);
      },
    );
  }
}
