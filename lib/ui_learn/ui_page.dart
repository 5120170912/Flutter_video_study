
import 'package:flutter/material.dart';
///
/// 隐藏控件学习：
///
class UiPage1 extends StatefulWidget {
  @override
  _UiPageState createState() => _UiPageState();
}

class _UiPageState extends State<UiPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //添加安全区
      body: SafeArea(
        child: Container(
          //offstage:显示隐藏控件，offstage：ture为隐藏，false为显示
          child: Offstage(
            offstage: true,
              child: Text("安全区学习")
          ),
        ),
      ),
    );
  }
}
