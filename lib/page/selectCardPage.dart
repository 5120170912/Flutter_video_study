import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///选项卡
class selectCardPage extends StatefulWidget {
  @override
  _selectCardPageState createState() => _selectCardPageState();
}

class _selectCardPageState extends State<selectCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('栈索引'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: IndexedStack(
                sizing: StackFit.expand,
                index: _pageIndex,//将改变的值传过来
                children: <Widget>[
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(child: Text('1'),onPressed: ()=>onClick(0),),
                FlatButton(child: Text('2'),onPressed: ()=>onClick(1),),
                FlatButton(child: Text('3'),onPressed: ()=>onClick(2),),
              ],
            )
          ],
        ),
      ),
    );
  }
  int _pageIndex = 0;
  void onClick(int index){//回调函数用来改变选项页面
    setState(() {
       _pageIndex = index;
    });
  }

}
