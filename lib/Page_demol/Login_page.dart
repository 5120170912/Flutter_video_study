
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _phoneNum = TextEditingController();
  TextEditingController _password = TextEditingController();

  TapGestureRecognizer _tapGestureRecognizer;//定义Text。rich点击事件识别器对象=定义变量
  GlobalKey<ScaffoldState> _gk = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();//创建识别器对象，给该对象赋值，创建该对象=给变量赋值创建对象
    _tapGestureRecognizer.onTap = myTap;//给事件赋值函数
  }

  void myTap(){
    print("点击了<<服务许可协议>>");
    _gk.currentState.showSnackBar(SnackBar(
      content: Text('条例'),
      action: SnackBarAction(
        label: '确认',
        onPressed: (){
          print("点击了确认");
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_gk,
      resizeToAvoidBottomPadding: false,//控制当前软键盘会不会影响当前布局的
      body: Stack(
        children: <Widget>[
          Align(//底部的圆圈
            alignment: Alignment.topCenter,
            child: Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(top: 120),//盖在蓝色的Container上面
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Container(
            height: 420,
            padding: EdgeInsets.only(top: 70,left: 16,right: 16),
            margin: EdgeInsets.only(top: 150,right: 16,left: 16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.phone,//键盘类型
                  controller: _phoneNum,//获取输入值
                  maxLines: 1,
                  maxLength: 30,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_iphone),
                      hintText: "请输入手机号",
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 10, bottom: 20),//第二个输入框离上边输入框的边距，离下边的边距
                  child: TextField(
                    controller: _password,
                    maxLines: 1,
                    maxLength: 32,
                    obscureText: true,//将输入变成**隐藏
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "请输入登录密码",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                        )),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '忘记密码?',
                        style: TextStyle(fontSize: 16,color: Color(0xff333333)),
                      )
                    ]
                ),
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      '登录',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xFFEA3D87),
                          const Color(0xFFFF7095)
                        ]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1.0, 5.0),
                            color: Color.fromRGBO(234, 61, 135, 0.4),
                            blurRadius: 5.0,
                          )
                        ]),
                  ),
                ),

                // SizedBox(height: 20,),//为了让两个元素不要贴太近用一个空白占用

                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('验证码登录',style: TextStyle(fontSize: 16,color: Color(0xff333333))),

                      Container(//用来让垂直分割线有高度
                          height: 12,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: VerticalDivider(width: 0.0,color: Color(0xFFDEDEDE),thickness: 1,)),

                      InkWell(
                        onTap: (){
                        },
                        child: Text('新用户注册',style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF02A9FF)),),
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: true,
                        onChanged: (v){},
                      ),
                      Text.rich(
                          TextSpan(
                              text:'我已阅读并同意遵守',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: const Color(0xff999999)
                              ),
                              children: [
                                TextSpan(
                                    text: '《服务许可协议》',
                                    style: TextStyle(
                                        fontSize: 10,
                                        decoration: TextDecoration.underline,
                                        color: const Color(0xff333333)
                                    ),
                                    recognizer: _tapGestureRecognizer//给富文本增加点击事件
                                )
                              ]
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 130),
            child: Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/user-head.jpg')),
                    // image: AssetImage('assets/user-level0.png'),
                  ),
                ),
                SizedBox(height: 10,),
                Text('登录'),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
