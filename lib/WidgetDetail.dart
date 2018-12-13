import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/BaseMaterialApp.dart';

class WidgetDetail extends StatelessWidget {
  const WidgetDetail({
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
    return new Center(
      child: Container(
        color: backgroundColor,
        child: Text(title),
      ),
    );
  }
//    return new WidgetDetail(text: 'hello');
}
