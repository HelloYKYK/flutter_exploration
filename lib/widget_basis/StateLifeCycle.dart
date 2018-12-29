import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*
状态生命周期
 */
class RouterWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('状态生命周期'),
      ),
      body:
//      new CounterWidget(),
    Text('xxx')
    );
  }
}
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Center(
      child: FlatButton(
        child: Text('$_counter'),
        //点击后计数器自增
        onPressed: () => setState(() => ++_counter),
      ),
    );

  }

  @override
  void didUpdateWidget(CounterWidget oldWidget){
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }
  @override
  void deactivate(){
    super.deactivate();
    print('deactivate');
  }
  @override
  void dispose(){
    super.dispose();
    print('dispose');
  }
  @override
  void reassemble(){
    super.reassemble();
    print('reasemble');
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print('didChangeDependencies');
  }



}
