import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateManager extends StatelessWidget {
  const StateManager({
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
    //内部管理State
//    return new TapboxA();
    //外部parent管理State
    return new ParentWidget();
  }
}

class TapboxA extends StatefulWidget {
  @override
  _TabpbosAState createState() => new _TabpbosAState();
}

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
        child: new Container(
          child: new Center(
            child: new Text(
              _active ? 'Active' : 'InActive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ));
  }
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = !_active;
    });
  }

}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'InActive',
            style: new TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active?Colors.lightGreen[700]:Colors.grey[600]
        ),
      ),
    );
  }
}
