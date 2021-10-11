
import 'package:flutter/material.dart';
///
/// 剪裁控件的学习：
///
class UiPage2 extends StatefulWidget {
  @override
  _UiPageState createState() => _UiPageState();
}

class _UiPageState extends State<UiPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //添加安全区
      body: SafeArea(
        child: Center(
          //ClipOval:圆形剪裁控件
          //ClipRRect:圆角矩形，参数borderRaidius，设置圆角度
          //CircleAvatar:圆形视图控件，用来做头像的
          child: CircleAvatar(
           radius: 100,
            backgroundImage: NetworkImage('https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180824%2F2634e9d6b8564a5e8639f29babc716cd.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1624176942&t=b2bec0174cde6416d728f88a293f8a5b'),
          ),
        ),
      ),
    );
  }
}
