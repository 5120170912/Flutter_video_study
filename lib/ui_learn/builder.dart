import 'package:flutter/material.dart';
///
/// Builder，使用一个闭包来创建Widget可以用来获取Wideget的上下文可以在创建控件之前进行操纵然后再创建控件
/// Meterial的builder如果也使用builder属性的话，那么在创建home的时候会优先执行builder的闭包
/// 例如：class MyApp5 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//        参数child就是FunctionWidget
//        此处添加builder在创建meterial值钱初始化⭐⭐
//        builder:(ctx,child){
//        debugPrint("Meterial creat");
//        return child;
//      }
//       title: 'UI控件的学习',
//       theme: ThemeData(
//           primaryColor: Colors.blue
//       ),
//       home:FunctionWidget(),
//     );
//   }
// }
///
class BuilderWidget extends StatefulWidget {
  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<BuilderWidget> {

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
                        return Text('hello world！', style: TextStyle(
                            color: color));
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
