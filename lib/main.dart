import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_demo/Page_demol/Login_page.dart';
import 'package:learn_demo/page/ButtomPage.dart';
import 'package:learn_demo/page/Container_buttom.dart';
import 'package:learn_demo/page/GridView.dart';
import 'package:learn_demo/page/IndexedStackPage.dart';
import 'package:learn_demo/page/ListView.dart';
import 'package:learn_demo/page/ScaffoldPage.dart';
import 'package:learn_demo/page/TextFilePage.dart';
import 'package:learn_demo/page/homePage.dart';
import 'package:learn_demo/page/inforWidgetPage.dart';
import 'package:learn_demo/page/radioPage.dart';
import 'package:learn_demo/page/remove_Container_Event.dart';
import 'package:learn_demo/page/selectCardPage.dart';
import 'package:learn_demo/page/testPage.dart';
import 'package:learn_demo/subnavigation_bar_learn/bottom_navigationbar_test.dart';

import 'BasisLearnDemol/PackWidgetDemol.dart';
import 'subnavigation_bar_learn/tabbar_test2_page.dart';
import 'subnavigation_bar_learn/tabbar_test_page.dart';

void main() =>runApp(MyApp4());//该函数传的是MyApp这个类的实例化


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //重写Widget的build方法就是生成新的界面即一个新的MaterialApp类
    //控件函数返回的MaterialApp就是一个控件
    return MaterialApp(
      //APP题目
      title: 'Flutter study',
      // showSemanticsDebugger: true,//分析调试布局用
      //APP主题
      theme: ThemeData( //这个类theme的实例化就是后面这个ThemeData(构造函数也是一堆的命名可选参数),我们选的是其中一个可选参primarySwatch这也是一个类
        primarySwatch: Colors.blue,
      ),
      //APP的界面开始写的地方
      home: scaffoldPage(),
    );
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP2',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:pakeAWidget2(10),
    );
  }
}


///
/// 底部导航栏演示案例app
///
class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '底部导航栏学习app',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: BottomNavigationBarTest(),
    );
  }
}

///
/// 任意导航栏学习app
///
class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '底部导航栏学习app',
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      home: TabBarTest2Page(),
    );
  }
}




