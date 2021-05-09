import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Container_buttom extends StatefulWidget {
  @override
  _Container_buttomState createState() => _Container_buttomState();
}

class _Container_buttomState extends State<Container_buttom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Material(
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                print("点击了一下...");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Text(
                  '这是按钮',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
