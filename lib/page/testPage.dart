import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        width: 80,
        height: 80,
        // decoration:BoxDecoration(
        //   image: DecorationImage(image: AssetImage('assets/user-head.jpg')),
        // ) ,
        // child: Image.asset('assets/user-head.jpg',),
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          image:DecorationImage(//将图片作为背景加入进去
            image: AssetImage(
              'assets/user-head.jpg',
            ),
          ),
        ),
      ),
    );
  }
}

