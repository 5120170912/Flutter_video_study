import 'dart:ui';

///
/// 模糊处理控件,就是把图片啥模糊处理
///
///
import 'package:flutter/material.dart';

class BackdropfilterWidget extends StatefulWidget {
  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<BackdropfilterWidget> {

  int count = 0;
  //可以自定义一个方法，如果是夜间模式则显示夜间模式的主题，在builder的return前作判断
  bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        //使用Builder返回一个Container的上下文
          builder:(context){
            //此处可以进行一系列数据的初始化
            count++;
            debugPrint("count=$count");
            return Theme(
              //使用局部主题,设置了一个文字的颜色
              //标注1
              data:Theme.of(context).copyWith(
                  hintColor: Colors.blue),

              child: Container(

                alignment: Alignment.center,
                child:MediaQuery(
                  data: MediaQueryData().copyWith(
                      textScaleFactor: 2.0
                  ),
                  //使用builder初始化创建text控件,这样可以在创建该控件之前自定义一些属性
                  child: Builder(


                      builder: (ctx){
                        //可以根据当前模式显示相对的ui
                        if(isDarkMode(ctx))
                        {
                          return Container();
                        }
                        else
                        {
                          //将之前定义好局部主题中的变量取出来,此处取的颜色是上一级Theme，即标注1定义的颜色
                          Color color = Theme
                              .of(ctx)
                              .hintColor;
                          return Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                width: 300,
                                height: 400,
                                child: Image.network('https://c-ssl.duitang.com/uploads/item/201810/07/20181007131933_qhjkl.thumb.1000_0.jpg'),
                              ),
                              BackdropFilter(
                                //sigmax调整模糊度
                                filter: ImageFilter.blur(sigmaX: 4.0,sigmaY: 4.0),
                                child: Center(
                                  child: Container(
                                    color: Colors.red.withOpacity(0),
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                      }
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
