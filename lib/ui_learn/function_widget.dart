import 'package:flutter/material.dart';
///
/// MediaQuery控件学习,一般用于查数据
///
class FunctionWidget extends StatefulWidget {
  @override
  _FunctionWidgetState createState() => _FunctionWidgetState();
}

class _FunctionWidgetState extends State<FunctionWidget> {
  @override
  Widget build(BuildContext context) {

    MediaQueryData data = MediaQuery.of(context);

    //获取当前手机屏幕的宽和高
    double w = data.size.width;
    double h = data.size.height;

    return Scaffold(
      body: Container(
        //可以通过MedianQuery内数据改变显示
        child:MediaQuery(
          data: MediaQueryData().copyWith(
            textScaleFactor: 2.0
          ),
          child: Text('Hello'),
        ),
      ),
    );
  }
}
