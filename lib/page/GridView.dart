import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    const bgColor = const [Colors.red, Colors.green, Colors.yellow];
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView study'),
      ),
      body: Container(
        child: GridView.builder(
            itemCount: 100,//限制格子数目
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120, //自适应的网格布局（宽度/120）
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 4 / 3,//格子比例
            ),
            itemBuilder: (ctx, i) {
              return Container(
                alignment: Alignment.center,
                color: bgColor[i % 3],
                child: Text("${i}"),
              );
            }),
      ),
    );
  }
}
