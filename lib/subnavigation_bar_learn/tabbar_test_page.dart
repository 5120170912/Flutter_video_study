import 'package:flutter/material.dart';
import 'package:learn_demo/subnavigation_bar_learn/page1.dart';
import 'package:learn_demo/subnavigation_bar_learn/page2.dart';
import 'package:learn_demo/subnavigation_bar_learn/page3.dart';
import 'package:learn_demo/subnavigation_bar_learn/page4.dart';

class TabBarTestPage extends StatefulWidget {
  @override
  _TabBarTestPageState createState() => _TabBarTestPageState();
}

//SingleTickerProviderStateMixin必须混入这个才能初始化Tabs导航栏的controller中的vsncy参数
class _TabBarTestPageState extends State<TabBarTestPage> with SingleTickerProviderStateMixin{

  //Tab是Widget的组合控件，可以少写很多代码
  List<Tab> _tabs=[
    Tab(text: '少林',icon: Icon(Icons.pan_tool),),
    Tab(text: '武当',icon: Icon(Icons.dashboard),),
    Tab(text: '二妹',icon: Icon(Icons.list),),
    Tab(text: '空调',icon: Icon(Icons.save),),
    Tab(text: '空调2',icon: Icon(Icons.save),),
    Tab(text: '空调3',icon: Icon(Icons.save),),
    Tab(text: '空调4',icon: Icon(Icons.save),),
    Tab(text: '空调5',icon: Icon(Icons.save),),
    Tab(text: '空调6',icon: Icon(Icons.save),),
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


  //创建TabController让Tab和页面关联起来
  //TabController(初始化页面，tab总数（必），vsnyc(gpu渲染)(必))
  //_controller初始化只能在init里初始化
  //如果使用DefaultTabControlle那么就不用设置外面的controller了，因为这个里面包含了
  // TabController _controller;

  @override
  void initState() {
    super.initState();
    //如果使用DefaultTabControlle那么就不用设置外面的controller了，因为这个里面包含了
    // _controller = TabController(length: _tabs.length,vsync: this);
    // //初始化被选中的页面索引,设置初始化为第三页
    // _controller.index = 3;
  }

  //返回一个Widget的方法
  Widget _buildBody(){
    return TabBarView(
      //使用controller和TabbarView关联图标和页面
      //如果使用DefaultTabControlle那么就不用设置外面的controller了，因为这个里面包含了
      // controller: _controller,
      children:_pages,
    );
  }

  @override
  Widget build(BuildContext context) {
    //如果使用DefaultTabControlle那么就不用设置外面的controller了，因为这个里面包含了
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('任意导航栏学习'),
          bottom: TabBar(
            //设置导航栏上导航个数，相当于Items
            tabs: _tabs,
            //使用controller和TabbarView关联图标和页面
            //如果使用DefaultTabControlle那么就不用设置外面的controller了，因为这个里面包含了
            // controller: _controller,
            //设置导航栏可以滚动，当多个tabs存在的时候需要
            isScrollable: true,
          ),
        ),
        body: _buildBody(),

      ),
    );
  }
}


