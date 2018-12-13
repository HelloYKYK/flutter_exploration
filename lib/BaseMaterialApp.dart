import 'package:flutter/material.dart';

 class BaseMaterialApp extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const BaseMaterialApp(
    Key key,
    this.backgroundColor,
    @required this.text,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(text),
        ),
        body: _buildBodys());
  }

 Widget _buildBodys(){
    print('log');
 }
  
}
