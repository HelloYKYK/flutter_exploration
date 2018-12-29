import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//void main() => runApp(new AssetsWidgets());
//资源
class AssetsWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Assetes',
      home: new AssetsWidget(),
    );
  }
}

class AssetsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AssetState();
  }
}

class AssetState extends State<AssetsWidget> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(data),
        buildImg(context),
        new FloatingActionButton(onPressed: _onClick),
        new Text('hello'),
        builds(context)
      ],
    ))
//    new Text(''),
//        new FloatingActionButton(onPressed: _onClick)
        );
  }

  Widget builds(BuildContext context) {
    return Image.asset('graphics/gg.png');
  }

  Widget buildImg(BuildContext context) {
    return new DecoratedBox(
        decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage('graphics/gg.png'))
            ));
  }

  _onClick() {
    loadAsset().then((value) {
      print(value);
      setState(() {
        data = value;
      });
    });
  }

  Future<String> loadAsset() async {
    return await DefaultAssetBundle.of(context)
        .loadString('assetes/config.json');
//    return await rootBundle.loadString('assetes/config.json');
  }
}
