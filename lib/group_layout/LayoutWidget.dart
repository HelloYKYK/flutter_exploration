import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {

  const LayoutWidget({
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

  }

}