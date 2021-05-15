import 'package:flutter/material.dart';
import 'package:learn_demo/BasisLearnDemol/PackWidgetDemol.dart';
import 'package:learn_demo/subnavigation_bar_learn/page1.dart';
import 'package:learn_demo/subnavigation_bar_learn/page2.dart';
import 'package:learn_demo/subnavigation_bar_learn/page3.dart';
import 'package:learn_demo/subnavigation_bar_learn/page4.dart';
///
/// 底部导航栏演示学习页面！
///
class BottomNavigationBarTest extends StatefulWidget {
  @override
  _BottomNavigationBarTestState createState() => _BottomNavigationBarTestState();
}

class _BottomNavigationBarTestState extends State<BottomNavigationBarTest> {

  //底部导航栏页面Item列表
  final List<BottomNavigationBarItem> _Items=[
    BottomNavigationBarItem(
        title: Text('第一页'),
        icon: Icon(Icons.home),
        //更改选中后显示的图标
        activeIcon: Icon(Icons.pan_tool)
    ),
    BottomNavigationBarItem(
        title: Text('第二页'),
        icon: Icon(Icons.list)
    ),
    BottomNavigationBarItem(
        title: Text('第三页'),
        icon: Icon(Icons.save)
    ),
    BottomNavigationBarItem(
        title: Text('第四页'),
        icon: Icon(Icons.dashboard)
    ),
  ];

  //默认选中页面索引
  int _SelecIndex = 0;


  //页面列表
  final List<Widget> _pages=[
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];

  //根据索引去选择哪一个页面
  Widget _buildPage(int index){
    return _pages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('底部导航栏学习页面'),
      ),
      body: _buildPage(_SelecIndex),
      bottomNavigationBar: BottomNavigationBar(
        //当底部栏超过三个就得改type
        type: BottomNavigationBarType.fixed,
        items: _Items,
        //当前激活的下标Item
        currentIndex: _SelecIndex,
        //更改选中时候的颜色
        selectedItemColor: Colors.red,
        //未选中时候的颜色
        unselectedItemColor: Colors.black,
        //点击修改页面index就是当前点击的_Items的列表的下 标
        onTap: (index){
            setState(() {
              _SelecIndex=index;
            });
        },
      ),
    );
  }
}
