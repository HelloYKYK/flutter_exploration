import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextFontStyle extends StatelessWidget {
  const TextFontStyle({
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
        Text(
          "hellow world " * 6,
          textAlign: TextAlign.center,
        ),
        Text(
          "hello world I'm Jack." * 4,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "hello world",
          textScaleFactor: 1.5,
        ),
        Text(
          "Hello world",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            height: 1.2,
            fontFamily: "Courier",
            background: new Paint()..color = Colors.yellow,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.wavy,
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "YellowHome:"),
              TextSpan(
                  text: "http://www.baidu.com",
                  style: TextStyle(color: Colors.blue),
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      print("ontap");
                      launchUrl("http://flutterchina.club");
                    })
            ],
          ),
        ),
        DefaultTextStyle(
          //1.设置默认样式
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0
          ),
          textAlign: TextAlign.start,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Hello world"),
              Text("I am Jack"),
              Text("I am Jack",
              style: TextStyle(
                inherit: false,//2.不继承默认样式
                color: Colors.grey
              ),),
            ],
          ),
        )
      ],
    );
  }
}

TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();

launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
