import 'dart:typed_data';

///
/// 截图控件
///
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RepaintBoundaryWidget extends StatefulWidget {
  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<RepaintBoundaryWidget> {
  //截图控件需要搭配这个标识，放在最外层是为了要截图截全屏
  GlobalKey _globalKey = GlobalKey();
  //字节数组,二进制数组
  Uint8List imgData;

  int count = 0;

  //可以自定义一个方法，如果是夜间模式则显示夜间模式的主题，在builder的return前作判断
  bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        body: Builder(
            //使用Builder返回一个Container的上下文
            builder: (context) {
          //此处可以进行一系列数据的初始化
          count++;
          debugPrint("count=$count");
          return Theme(
            //使用局部主题,设置了一个文字的颜色
            //标注1
            data: Theme.of(context).copyWith(hintColor: Colors.blue),

            child: Container(
                alignment: Alignment.center,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 400,
                      child: imgData == null
                          ? Image.network(
                              'https://c-ssl.duitang.com/uploads/item/201810/07/20181007131933_qhjkl.thumb.1000_0.jpg')
                          : Image.memory(imgData),
                    ),
                    FlatButton(
                      child: Text("截图"),
                      onPressed: () async {
                        var data = await _capture();
                        setState(() {
                          imgData = data;
                        });
                      },
                    )
                  ],
                )),
          );
        }),
      ),
    );
  }

  // 返回图片的二进制数据
  Future<Uint8List> _capture() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
// 获取png格式数据
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    return pngBytes;
  }
}
