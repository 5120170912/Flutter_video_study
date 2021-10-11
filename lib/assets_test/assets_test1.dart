
import 'package:flutter/material.dart';
import 'package:flutter_iconfont/flutter_iconfont.dart';

class Assets_test1 extends StatefulWidget {
  @override
  _Assets_test1State createState() => _Assets_test1State();
}

class _Assets_test1State extends State<Assets_test1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(IconFonts.beibao),
            Icon(IconFonts.fanchuan),
            Icon(IconFonts.fangsaisuang),
          ],
        ),

      ),
    );
  }
}
