import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YinYang extends StatelessWidget {
  const YinYang({
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
    return new Container(
      width: 400,
      height: 400,
      child:  new Column(
          children: <Widget>[
            new SwitchYinAndYangRoute(),
            new SwitchYinAndYangRoute(),
            new SwitchYinAndYangRoute(),
            new SwitchYinAndYangRoute(),
            new SwitchYinAndYangRoute(),
            new SwitchYinAndYangRoute(),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        )
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SwitchAndCheckBoxTestRouteState();
}

class SwitchYinAndYangRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SwitchYinAndYangState();
}

class _SwitchYinAndYangState extends State<SwitchYinAndYangRoute> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[new SwitchAndCheckBoxTestRoute(), new TapboxA()],
    );
  }
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _checkboxSelected = false; //维护复选开关状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.black,
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}

class TapboxA extends StatefulWidget {
  @override
  _TabpbosAState createState() => new _TabpbosAState();
}

///内部管理自身State
class _TabpbosAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: _handleTap,
//        ConstrainedBox
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
                child: new Center(
                  child: new Text(
                    _active ? '阴' : '阳',
                    style: new TextStyle(
                        fontSize: 16.0,
                        color: _active ? Colors.white : Colors.black),
                  ),
                ),
                width: 50.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  color: _active ? Colors.black : Colors.white,
                )),
            !_active
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: new Container(
                        width: 208, height: 10, color: Colors.black))
                : new Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: new Container(
                              width: 100, height: 10, color: Colors.black)),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: new Container(
                              width: 100, height: 10, color: Colors.black)),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  )
          ],
        ));
  }
}
