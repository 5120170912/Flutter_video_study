/*
 * @Author: your name
 * @Date: 2020-12-29 22:51:40
 * @LastEditTime: 2021-04-24 08:45:01
 * @LastEditors: Please set LastEditors
 * @Description: 用于控制文本是否显示的案例
 * @FilePath: \learn_demo\lib\main.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isShow=false;//创建是否显示文本的变量；


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1304939164,2119451256&fm=26&gp=0.jpg'),
          ),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
          margin: EdgeInsets.only(top:60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("这是标题",style: TextStyle(color: Colors.red),)
              ),
              Visibility(
                  visible: _isShow,
                  child: Text("这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本这是一段文本",style: TextStyle(color: Colors.blue),)),
              IconButton(
                icon:Icon(_isShow==true?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,size: 40,color: Colors.white),
                onPressed: (){
                  setState(() {
                    _isShow=!_isShow;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}