/*
 * @Author: your name
 * @Date: 2020-12-29 22:51:40
 * @LastEditTime: 2021-04-24 08:45:01
 * @LastEditors: Please set LastEditors
 * @Description: 用于控制文本是否显示的案例
 * @FilePath: \learn_demo\lib\main.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  bool _isShow=false;//创建是否显示文本的变量；


  @override
  Widget build(BuildContext context) {
    const bgColor = const[Colors.red,Colors.green,Colors.yellow];
    return Scaffold(
      body: Container(
        child:ListView.separated(
            itemCount: 12,
            itemBuilder: (ctx,i){//builder是一个返回Widget的回调函数
          return Container(
            height: 70,
            color: bgColor[i%3],
          );
        },
          separatorBuilder: (ctx,i){//添加分割线
              return Divider(color: Colors.black,indent: 16,endIndent: 16,thickness: 5,);
          },
        )


      ),
    );
  }
}