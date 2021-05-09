import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexedStackPage extends StatefulWidget {
  @override
  _IndexedStackPageState createState() => _IndexedStackPageState();
}

class _IndexedStackPageState extends State<IndexedStackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('栈索引'),
      ),
      body: IndexedStack(
        index: 1,
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
    );
  }
}
