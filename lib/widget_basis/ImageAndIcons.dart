import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///图片和Icon
class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
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
    String icons = "";
    icons += "\uE914";
    icons += "\uE000";
    icons += "\uE90D";
    return new SingleChildScrollView(
      padding: EdgeInsets.all(100),
      child: Column(
        
        children: <Widget>[
          Text(
            '图片:',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
            textAlign: TextAlign.left,
          ),
          Image(
            image: AssetImage('graphics/gg.png'),
            width: 100.0,
          ),
          Image.asset(
            'graphics/gg.png',
            width: 100.0,
          ),
          Image(
            image: NetworkImage(
                'https://ws1.sinaimg.cn/large/0065oQSqly1fytdr77urlj30sg10najf.jpg'),
            width: 100.0,
          ),
          Image.network(
            "https://ws1.sinaimg.cn/large/0065oQSqly1fytdr77urlj30sg10najf.jpg",
            width: 100.0,
          ),
          Image(
            image: NetworkImage(
                "https://ws1.sinaimg.cn/large/0065oQSqly1fytdr77urlj30sg10najf.jpg"),
            width: 100,
            color: Colors.blue,
            colorBlendMode: BlendMode.softLight,
          ),
          Text(
            '图标:',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          Text(
            icons,
            style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 48.0,
                color: Colors.green),
          ),
          Icon(Icons.accessible,color: Colors.green,),
          Icon(Icons.error,color: Colors.green,),
          Icon(Icons.fingerprint,color: Colors.green,),
          Icon(Icons.search,color: Colors.green,),

        ],
      ),
//
//    Column(
//
//    )
    );
  }
}
