import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///按钮
class Buttons extends StatelessWidget {

  const Buttons({
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
    return new Column(
      children: <Widget>[
        RaisedButton(
          child: Text('normal'),
          onPressed: ()=>{},
        ),
        FlatButton(
          child: Text("normal"),
          onPressed: ()=>{},
        ),
         OutlineButton(
          child: Text("normal"),
          onPressed: ()=>{},
        ),
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: ()=>{},
        ),
        RaisedButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text('Submit'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: ()=>{},
        )
      ],
    );
  }

}