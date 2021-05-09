import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoveContainerEvent extends StatefulWidget {
  @override
  _RemoveContainerEventState createState() => _RemoveContainerEventState();
}

class _RemoveContainerEventState extends State<RemoveContainerEvent> {
  double _left = 0.0;
  double _top = 0.0;

  GlobalKey _gKey = GlobalKey();
  double stackWidth = 0.0;
  double stackHeight = 0.0;

  @override
  void initState() {
    super.initState();
    //注册一个回调函数当这个Widget的构造函数执行则这个函数执行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("这个Widget开始执行了");
      stackHeight = _gKey.currentContext.size
          .height; //将stack的高赋值给变量当执行这个的时候必须在回调函数中执行，因为下面的Widget还没有return，Build也就是还没绘图是不可能有宽高的Size为null
      stackWidth = _gKey.currentContext.size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖动事件演示'),
      ),
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          //触摸点不断移动的时候触发
          // print("----$stackWidth:$stackHeight");
          setState(() {
            //需要刷新一下

            //宽的边界检测
            if (_left + 200 > stackWidth) {
              //200是Cntainer的宽
              _left = stackWidth - 200;
            } else if (_left < 0) {
              _left = 0;
            } else {
              _left += details.delta.dx;
            }

            //高的边界检测
            if (_top + 200 > stackHeight) {
              //200是Cntainer的高
              _top = stackHeight - 200;
            } else if (_top < 0) {
              _top = 0;
            } else {
              _top += details.delta.dy;
            }
          });
          // print("${_left} : ${_top}"); //变化的dx
        },
        child: Stack(
          key: _gKey,
          children: <Widget>[
            Positioned(
              left: _left,
              top: _top,
              width: 200.0,
              height: 200.0,
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
