import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class textFilePage extends StatefulWidget {
  @override
  _textFilePageState createState() => _textFilePageState();
}

class _textFilePageState extends State<textFilePage> {


  TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(//由于Row的主轴是无穷的因此用Expanded将输入框
              child: TextField(
                //输入验证
                inputFormatters: [
                  // BlacklistingTextInputFormatter(RegExp("[a-z]")),
                  // LengthLimitingTextInputFormatter(11),
                  WhitelistingTextInputFormatter(RegExp("[a-z]")),
                ],

                controller: _controller,
                onChanged: (val){
                  setState(() {

                  });
                },
                decoration: InputDecoration(
                  counterText: "总计：${_controller.text.length}",
                  hintText: '请输入',
                  hintStyle: TextStyle(fontSize: 20,color: Colors.red),
                  labelText: '搜索框',
                  labelStyle: TextStyle(fontSize: 10),
                  // prefixText: '搜索框',
                  // prefixStyle: TextStyle(color: Colors.green),
                  // prefix: Text('搜索框'),
                  // prefix: Icon(Icons.lock,color: Colors.orange),
                  // suffixText: "搜一搜",
                  helperText: "help",
                  helperStyle: TextStyle(fontSize: 14,color: Colors.red),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

                ),
              ),
            ),
            RaisedButton(
              child: Text('搜索'),
              onPressed: (){
                print(_controller.text);//获取输入的值
              },
            ),
          ],
        ),
      ),
    );
  }
}
