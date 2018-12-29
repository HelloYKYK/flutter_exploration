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
    return new Column(
      children: <Widget>[
        new Text('Widget管理自身状态'),
        new TapboxA(),
        new Text('父widget管理子widget的state'),
        new ParentWidget(),
        new Text('混合管理'),
        new PrentWidgetC()
      ],
    );
    //内部管理State
//    return new TapboxA();
    //外部parent管理State
//    return new ParentWidget();
    //混合管理
//    return new PrentWidgetC();
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

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = !_active;
    });
  }
}

///外部管理自身状态
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
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

///混合管理
class PrentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<PrentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        onChanged: _handleTapboxChanged,
        active: _active,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    //在按下时添加绿色边框,当抬起时,取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown,
      //处理按下事件
      onTapUp: _handleTapUp,
      //处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'Active' : 'InActive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(color: Colors.teal[700], width: 10.0)
              : null,
        ),
      ),
    );
  }
}
