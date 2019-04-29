import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackLayout extends StatelessWidget {
  const StackLayout({
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
   return new ConstrainedBox(
        constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Text("hello world",style: TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(
            left: 18.0,
            child: Text("Jack"),
          ) ,
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          ) ,
          Positioned(
            right: 18.0,
            child: Text("Bad"),
          )
        ],
      ),
    );
  }
}
