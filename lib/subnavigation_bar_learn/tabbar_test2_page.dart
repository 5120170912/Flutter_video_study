import 'package:flutter/material.dart';
import 'package:learn_demo/subnavigation_bar_learn/page1.dart';
import 'package:learn_demo/subnavigation_bar_learn/page2.dart';
import 'package:learn_demo/subnavigation_bar_learn/page3.dart';
import 'package:learn_demo/subnavigation_bar_learn/page4.dart';

///
///TabBar + PageView为了拜托TabBar + TabPageView这种系统封装好的更加灵活地封装模板
///
class TabBarTest2Page extends StatefulWidget {
  @override
  _TabBarTestPageState createState() => _TabBarTestPageState();
}

//SingleTickerProviderStateMixin必须混入这个才能初始化Tabs导航栏的controller中的vsncy参数
class _TabBarTestPageState extends State<TabBarTest2Page> with SingleTickerProviderStateMixin{

  //Tab是Widget的组合控件，可以少写很多代码
  List<Tab> _tabs=[
    Tab(text: '少林',icon: Icon(Icons.pan_tool),),
    Tab(text: '武当',icon: Icon(Icons.dashboard),),
    Tab(text: '二妹',icon: Icon(Icons.list),),
    Tab(text: '三页',icon: Icon(Icons.dashboard),),
    Tab(text: '四页',icon: Icon(Icons.face),),
    Tab(text: '五页',icon: Icon(Icons.g_translate),),
    Tab(text: '六页',icon: Icon(Icons.wallpaper),),
    Tab(text: '七页',icon: Icon(Icons.edit),),
    Tab(text: '八页',icon: Icon(Icons.radio),),
  ];

  //页面列表
  //注意：Tab个数和页面个数必须相同不然就会报错
  final List<Widget> _pages=[
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page4(),
    Page4(),
    Page4(),
    Page4(),
    Page4(),
  ];

  //创建Tabcontroller
  TabController _controller;
  //创建PageView的controller
  PageController _pagecontroller = PageController();

  @override
  void initState() {
    super.initState();
    //初始化Tabcontroller
    _controller = TabController(length: _tabs.length,vsync: this);
  }

  //返回一个Widget的方法
  Widget _buildBody(){
    //使用builder方法，因为如果页面很多的话，如果有100个，当人们不用到第100个就不会再一开始加载就创建该页面
    return PageView.builder(
      //使用controller
      controller: _pagecontroller,

      //注册监听器：使当页面切换的时候能切换到对应上方的按钮
      onPageChanged: (index){
        _controller.index = index;
      },

      //builder带的构造方法,这是一种生成的方法每次都生成一个Page1，
      itemBuilder: (context,index){
        ///重点：这里可以写一个框架页面，当通过index，框架页面不动从而改变框架页面内显示的内容。
        ///这里演示不方便先用_pages代替了，测试index的效果
        return _pages[index ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //如果使用DefaultTabControlle那么就不用设置外面的controller了，因为这个里面包含了
    return Scaffold(
      appBar: AppBar(
        title: Text('任意导航栏学习'),
        bottom: TabBar(
          //设置导航栏上导航个数，相当于Items
          tabs: _tabs,
          //使用Tabconttroller关联pageview页面
          controller: _controller,
          //使其标签可以滚动
          isScrollable: true,
          //实现监听器：使点击上方的图标能切换到页面
          onTap: (index){
            //左边的如果存在则跳转到对应的页面
            _pagecontroller?.jumpToPage(index);
          },
        ),
      ),
      body: _buildBody(),

    );
  }
}


