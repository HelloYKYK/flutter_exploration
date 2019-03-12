import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
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
    TextEditingController _unameController = new TextEditingController();
    TextEditingController _upasswordController = new TextEditingController();

    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)),
          controller: _unameController,
        ),
        TextField(
          autofocus: true,
          decoration: InputDecoration(
              labelText: "密码", hintText: "登录密码", prefixIcon: Icon(Icons.lock)),
          obscureText: true,
          controller: _upasswordController,
        ),
        RaisedButton(
          child: Text("登录"),
          onPressed: () {
            print(_unameController.text);
            print(_upasswordController.text);
          },
        )
      ],
    );
  }
}
