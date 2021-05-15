import 'package:flutter/material.dart';
///
/// 这是一个演示页面，
///
class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  @override
  void initState() {
    super.initState();
    debugPrint('为什么每次切换就会重建呢,选中了第一页！');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('这是少林'),
    );
  }
}
