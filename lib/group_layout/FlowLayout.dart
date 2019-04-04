import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlowLayout extends StatelessWidget {
  const FlowLayout({
    Key key,
    @required this.title,
    this.backgroundColor: Colors.grey,
  }) : super(key: key);
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return new
        Center(
            child: new Column(
          children: <Widget>[
            new Wrap(
              runSpacing: 8,
              spacing: 20,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('A')),
                  label: new Text('易中秘密穷天地'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('M')),
                  label: new Text('造化天机泄未然'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('H')),
                  label: new Text('中有神明司祸福'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('J')),
                  label: new Text('从来切莫教轻传'),
                ),
              ],
            ),
            Flow(
              delegate: TestFlowDelegate(margin: EdgeInsets.all(10)),
              children: <Widget>[
                new Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.red,
                ),
                new Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.green,
                ),
                new Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.blue,
                ),
                new Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.yellow,
                ),
                new Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.brown,
                ),
                new Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.purple,
                ),
              ],
            )
          ],
        ));
//    return
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }
}
