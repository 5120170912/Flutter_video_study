import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int _sex=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: Row(
          children: [
            Text('男'),
            Radio(
              value: 1,
              groupValue: _sex,
              onChanged: (val){
                setState(() {
                  _sex = val;
                });
              },
            ),
            Text('女'),
            Radio(
              value: 2,
              groupValue: _sex,
              onChanged: (val){
                setState(() {
                  _sex = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
