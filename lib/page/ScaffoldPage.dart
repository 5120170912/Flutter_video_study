import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class scaffoldPage extends StatefulWidget {
  @override
  _scaffoldPageState createState() => _scaffoldPageState();
}

class _scaffoldPageState extends State<scaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //---------------------------顶部标题--------------------------------------
      appBar: AppBar(
        title: Text('页面标题'),//appBar属性1：标题
        // leading: Icon(Icons.home),//属性2：可以覆盖drawer
        actions: <Widget>[//属性3：右边按钮
          IconButton(
            icon: Icon(Icons.print,color: Colors.white,),
          ),
          IconButton(
            icon: Icon(Icons.pan_tool,color: Colors.white,),
          ),
          IconButton(
            icon: Icon(Icons.add_comment,color: Colors.white,),
          ),
        ],
        bottom: AppBar(//属性4：底部位置
          title: Text('副标题'),
        ),
      ),

      //----------------------------主页面---------------------------------------
      body: Center(
        child: Container(
          child: Text('scaffold基本上属性'),
        ),
      ),
      //-----------------------------底部通知信息--------------------------------
      bottomSheet: Text("bottomSheet"),
      //------------------------------底部按钮-----------------------------------
      persistentFooterButtons: <Widget>[
        FlatButton(
          onPressed: (){

          },
          child: Text('按钮1'),
        ),
        Text('文本内容'),
      ],

      //-------------------------------底部悬浮按钮------------------------------
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //--------------------------------底部菜单(2种)----------------------------
        //*****************************底部菜单1*********************************
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(title: Text('主页'),icon: Icon(Icons.pages)),
      //     BottomNavigationBarItem(title: Text('我的'),icon: Icon(Icons.person)),
      //   ],
      // ),
        //******************************底部菜单2********************************
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
          color: Colors.blueGrey,
        ),
      ),


      //---------------------------------左拉框---------------------------------
      drawer: SizedBox(
        width: 150,
        child: Drawer(
          child: Container(
            child: Center(
                child: Text('抽屉菜单')
            ),
          ),
        ),
      ),
    );
  }
}
