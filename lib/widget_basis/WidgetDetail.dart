import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetDetail extends StatelessWidget {
  const WidgetDetail({
    Key key,
    @required this.title,
    this.backgroundColor: Colors.white,
  }) : super(key: key);
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
//    return new MaterialApp(
//        title: title,
//        home: new Scaffold(
//            appBar: new AppBar(
//              title: new Text(title),
//            ),
//            body: _buildBody(context)),
////    routes: <String,WidgetBuilder>{
////          "/1":(BuildContext context) =>RouterWidget(),
////          "/2":(BuildContext context) => StateManager(title: "状态管理",)
////    }
//    );
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Wiget简介"),
        ),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {

    return new  ListView.builder(
        padding: const EdgeInsets.all(4.0),
        itemCount: 4,
        itemBuilder: (context, i) {
          switch (i) {
            case 0:
             return new ListTile(
                  title: new Text('状态生命周期'),
                  onTap: () {
                    Navigator.pushNamed(context, "/7.1");
                  });
              break;
            case 1:
            case 3:
            return  new Divider();
              break;
            case 2:
              return  new ListTile(
                  title: new Text('状态管理'),
                  onTap: () {
                    Navigator.pushNamed(context, "/7.2");
                  });
              break;
          }
        });
//      child: SingleChildScrollView(
//          padding: EdgeInsets.all(16.0),
//          child: Center(
//              child: Column(
//                children: <Widget>[
//                  new ListTile(
//                      title: new Text('状态生命周期'),
//                      onTap: () {
//                        Navigator.pushNamed(context, "/7.1");
//                      }),
//                  new Divider(),
//                  new ListTile(
//                      title: new Text('状态管理'),
//                      onTap: () {
//                        Navigator.pushNamed(context, "/7.2");
//                      }),
//                  new Divider(),
//                ],
//              ))),
//    );
  }
}
//    return new WidgetDetail(text: 'hello');
