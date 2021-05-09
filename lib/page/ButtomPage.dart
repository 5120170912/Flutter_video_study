import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buttomPage extends StatefulWidget {
  @override
  _buttomPageState createState() => _buttomPageState();
}

class _buttomPageState extends State<buttomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: Wrap(
          children: [
          FlatButton(
            color: Colors.blue,
            child: Text('FlatButton'),
            onPressed: (){
              print('FlatButton');
            },
          ),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Colors.green,
              child: Text('RaisedButton'),
              onPressed: (){
                print('RaisedButton');
              },
            ),
          OutlineButton(
            child: Text('OutlineButton'),
            onPressed: (){

            },
          ),
            Padding(
              padding: EdgeInsets.all(20),
              child: CupertinoButton(
                color: Colors.blue,
                child: Text('android'),
                onPressed: (){

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
