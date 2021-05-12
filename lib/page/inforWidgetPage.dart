import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarPage extends StatefulWidget {
  @override
  _SnackBarPageState createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {

  GlobalKey<ScaffoldState> _gk = GlobalKey<ScaffoldState>();

@override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _gk,
      appBar: AppBar(
      ),
      body: Builder(
        builder: (ctx){//这个context是Scaffold传的，还有一种通过Key拿到Context暂时不会用
          return Center(
            child: RaisedButton(
              child: Text(
                "按钮",
              ),
              onPressed: (){
                // Scaffold.of(_gk.currentState.context).showSnackBar(SnackBar(
                  _gk.currentState.showSnackBar(SnackBar(//第二种方法通过Key获取到当前Scaffold的属性然后调用通知栏
                  content: Text("你有未读消息"),
                  action: SnackBarAction(
                    label: "知道了",
                    onPressed: (){
                      print("点击了按钮");
                    },
                  ),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
