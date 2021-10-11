import 'package:flutter/material.dart';
///
/// 这是一个演示页面，
///
class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with AutomaticKeepAliveClientMixin{//第一步：混入

  @override
  void initState() {
    super.initState();
    debugPrint('为什么每次切换就会重建呢,选中了第一页！');
  }

  @override
  Widget build(BuildContext context) {
    //第三步：调用保存状态
    super.build(context);
    return Center(
      child: Text('这是少林'),
    );
  }

  @override
  //第二步：是否保存状态？=true
  bool get wantKeepAlive => true;
}
