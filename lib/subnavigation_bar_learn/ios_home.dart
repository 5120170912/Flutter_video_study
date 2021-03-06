import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page1.dart';
import 'page2.dart';

class IosHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<IosHomePage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(title: Text("้ฆ้กต"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text("ๆ็"), icon: Icon(Icons.account_box)),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return Page1();
                break;
              case 1:
                return Page2();
                break;
              default:
                return Page1();
            }
          },
        );
      },
    );
  }
}