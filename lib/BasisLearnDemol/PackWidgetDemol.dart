import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pakeAWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Text('封装一个基本Widget'),
          FlatButton(
            child: Text('确认'),
            onPressed: (){
              print("点击了确认");
            },
          )
        ],
      ),
    );
  }
}

class pakeAWidget2 extends StatefulWidget {

  int count;

  pakeAWidget2(this.count);//构造函数

  @override
  _pakeAWidget2State createState() => _pakeAWidget2State();
}

class _pakeAWidget2State extends State<pakeAWidget2>  with WidgetsBindingObserver{//步骤一。继承该类准备注册监听


  void _showHint(){
    ///当前这个Widget的上下文
    Scaffold.of(context).showSnackBar(null);
  }
  

  @override
  void initState() {//ful生命周期实验
    super.initState();
    debugPrint("initState........");
    //步骤二。注册监听
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    //步骤三。取消监听
    WidgetsBinding.instance.removeObserver(this);
  }

  //步骤四。app的回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed://切到后台切到前台的回调
        break;
      case AppLifecycleState.inactive://点返回键
        break;
      case AppLifecycleState.paused://点返回键
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void didChangeDependencies() {//ful生命周期实验
    super.didChangeDependencies();
    debugPrint("didChangeDependencies........");
  }

  @override
  void didUpdateWidget(pakeAWidget2 oldWidget) {//ful生命周期实验
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget........");

  }

  @override
  void deactivate() {//ful生命周期实验
    super.deactivate();
    debugPrint("deactivate..........");

  }


  ///build里面的context是全局根Widget的上下文，和上边_showHint里的context不一样
  @override
  Widget build(BuildContext ctx) {
    debugPrint("build..........");
    this.context;//这么写是调用的是这个Widget的context，也可以将参数中的context改ctx就不重名了
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Text(
              '居中提示语句：${widget.count}'//通过Widget获取上方类中count参数
            ),
            FlatButton(
              child: Text('确定'),
              onPressed: (){
                widget.count++;//通过Widget获取上方类中count参数
              },
            ),
          ],
        ),
      ),
    );
  }
}

