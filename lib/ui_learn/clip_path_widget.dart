//
// import 'package:flutter/material.dart';
// ///
// /// Path剪裁控件的学习：
// ///
// class ClipPathWidget extends StatefulWidget {
//   @override
//   _UiPageState createState() => _UiPageState();
// }
//
// class _UiPageState extends State<ClipPathWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//       body: ClipPath(
//         child: Container(
//           height: 200,
//           decoration: BoxDecoration(
//               color: Color(0xff622F74),
//               gradient: LinearGradient(
//                   colors: [Colors.blue, Colors.deepOrangeAccent],// blue deepOrangeAccent
//                   begin: Alignment.centerRight,
//                   end: Alignment(-1.0, -1.0))),
//         ),
//
//         //剪裁必须要设置的属性：
//         clipper: MyClipper4(),
//       ),
//     );
//   }
// }
//
//
// ///
// /// 步骤2：自定义剪裁器--梯形
// ///..必须要加Path路径类，类似套索选取工具，绘制
// class MyClipper extends CustomClipper<Path>{
//
//   //由该方法决定如何去剪裁
//   @override
//   getClip(Size size) {
//     //创建Path类，划线
//     var path = Path();
//     //起始点在0，0
//     path.lineTo(0, size.height/2);//size为当前容器的一半
//     path.lineTo(size.width, size.height/2-100);
//     path.lineTo(size.width, 0);
//     path.close();//自动闭合绘图剩最后两个点的时候使用
//
//     return path;
//   }
//
//   //shouldReclip：是否重新剪裁，false否
//   @override
//   bool shouldReclip(CustomClipper oldClipper) {
//     return false;
//   }
//
// }
//
//
// ///
// /// 自定义剪裁器--三角形
// ///
// class MyClipper2 extends CustomClipper<Path>{
//
//   //由该方法决定如何去剪裁
//   @override
//   getClip(Size size) {
//     //创建Path类，划线
//     var path = Path();
//     //起始点在0，0
//     path.lineTo(size.width, 0.0);
//     path.lineTo(size.width/2,size.height);
//     path.close();//自动闭合绘图剩最后两个点的时候使用
//
//     return path;
//   }
//
//   //shouldReclip：是否重新剪裁，false否
//   @override
//   bool shouldReclip(CustomClipper oldClipper) {
//     return false;
//   }
//
// }
//
// ///
// /// 自定义剪裁路径--曲线路径
// ///
// class MyClipper3 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//
//     //套索步骤
//     var path = Path()..lineTo(0, size.height - 60.0);
//
//     //--------------------------设置拉的控制点和控制点的终点-----------------------
//     var firstControlPoint = Offset(size.width / 2, size.height);
//     var firstEdnPoint = Offset(size.width, size.height - 60.0);
//
//     path.quadraticBezierTo(
//         firstControlPoint.dx,
//         firstControlPoint.dy,
//         firstEdnPoint.dx,
//         firstEdnPoint.dy);
//     //--------------------------拉线的过程结束-----------------------------------
//
//     //套索步骤
//     path..lineTo(size.width, size.height - 60.0)
//       ..lineTo(size.width, 0);
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
//
//
// ///
// /// 自定义剪切--波浪线路径
// ///
// class MyClipper4 extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size){
//     var path = Path()
//       ..lineTo(0, size.height - 40.0);
//
// //第一段曲线控制点
//     var firstControlPoint = Offset(size.width/4, size.height);
//     var firstEndPoint = Offset(size.width/2.25, size.height-30);
//     path.quadraticBezierTo(
//         firstControlPoint.dx,
//         firstControlPoint.dy,
//         firstEndPoint.dx,
//         firstEndPoint.dy);
//
// //第二段曲线控制点
//     var secondControlPoint = Offset(size.width/4*3, size.height-90);
//     var secondEndPoint = Offset(size.width, size.height-40);
//     path.quadraticBezierTo(
//         secondControlPoint.dx,
//         secondControlPoint.dy,
//         secondEndPoint.dx,
//         secondEndPoint.dy);
//
//     path..lineTo(size.width, size.height-40)
//       ..lineTo(size.width, 0);
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
//
// ///
// /// 自定义剪裁器--不规则图形
// ///..必须要加Path路径类，类似套索选取工具，绘制
// class MyClipper5 extends CustomClipper<Path>{
//
//   double circleTopOffset = 20;//中心圆弧
//   double circleRadius = 70;//小圆弧
//   double borderRadius = 0;
//
//   MyClipper5(this.circleRadius,this.circleTopOffset,this.borderRadius);
//
//   //角度转弧度公式
//   double _d2R(double degress){
//     return(math.pi * degress / 180);
//   }
//
//   //由该方法决定如何去剪裁
//   @override
//   getClip(Size size) {
//    double radian = math.acos((circleRadius-circleTopOffset)/circleRadius);
//
//    var path = Path()
//    ..arcTo(Rect.fromCircle(center: Offset(borderRadius,borderRadius+circleTopOffset),radius: borderRadius),-math.pi,math.pi / 2,false)//绘制圆弧中心点，开始的角度-math.pi,扫过的面积math.pi / 2
//     ..lineTo(size.width-borderRadius,circleTopOffset)
//    ..arcTo(Rect.fromCircle(center: Offset(size.width/2,circleRadius),radius: borderRadius),-(math.pi/2+radian),2*radian,false)
//    ..arcTo(Rect.fromCircle(center: Offset(size.width-borderRadius,borderRadius+circleTopOffset),radius: borderRadius),-math.pi/2,math.pi/2,false)
//    ..lineTo(size.width, size.height-borderRadius)
//    ..arcTo(Rect.fromCircle(center: Offset(size.width-borderRadius,size.height-borderRadius),radius: borderRadius), 0, math.pi/2, false)
//    ..lineTo(borderRadius, size.height)
//    ..arcTo(Rect.fromCircle(center: Offset(borderRadius,size.height-borderRadius),radius: borderRadius), math.pi/2, math.pi/2, false)
//    ..lineTo(0, borderRadius+circleTopOffset);
//     return path;
//   }
//
//   //shouldReclip：是否重新剪裁，false否
//   @override
//   bool shouldReclip(CustomClipper oldClipper) {
//     return false;
//   }
//
// }