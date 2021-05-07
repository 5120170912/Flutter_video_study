import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_demo/page/GridView.dart';
import 'package:learn_demo/page/ListView.dart';
import 'package:learn_demo/page/homePage.dart';

void main() =>runApp(MyApp());//该函数传的是MyApp这个类的实例化

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //重写Widget的build方法就是生成新的界面即一个新的MaterialApp类
    //控件函数返回的MaterialApp就是一个控件
    return MaterialApp(
      //APP题目
      title: 'Flutter study',
      //APP主题
      theme: ThemeData( //这个类theme的实例化就是后面这个ThemeData(构造函数也是一堆的命名可选参数),我们选的是其中一个可选参primarySwatch这也是一个类
        primarySwatch: Colors.deepPurple,
      ),
      //APP的界面开始写的地方
      home: GridViewPage(),
    );
  }
}




