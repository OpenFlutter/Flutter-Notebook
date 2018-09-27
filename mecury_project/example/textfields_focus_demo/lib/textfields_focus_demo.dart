/**
 * 实现原理：
 * 使用FocusNode获取当前textField焦点
 * 在TextNode的textInputAction属性中选择键盘action（next/down）
 * 对于最后一个之前的TextField：在onSubmitted属性中解除当前focus状态
 * 再聚焦下一个FocusNode:FocusScope.of(context).requestFocus( nextFocusNode );
 * 对于最后一个TextField,直接解除focus并提交表单
 */
import 'package:flutter/material.dart';

class TextFieldFocusDemo extends StatefulWidget {
  @override
  State createState() => TextFieldFocusDemoState();
}

class TextFieldFocusDemoState extends State<TextFieldFocusDemo> {
  TextEditingController _nameController,_pwController;
  FocusNode _nameFocus,_pwFocus;

  @override
  void initState() {
    _nameController = TextEditingController();
    _pwController = TextEditingController();
    _nameFocus = FocusNode();
    _pwFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 80.0),
            Center(
              child: Text('Login',style: TextStyle(
                  fontSize: 32.0
              ),),
            ),
            const SizedBox(height: 80.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  focusNode: _nameFocus,
                  controller: _nameController,
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (input){
                    _nameFocus.unfocus();
                    FocusScope.of(context).requestFocus(_pwFocus);
                  },
                  decoration: InputDecoration(
                    labelText: "name",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  focusNode: _pwFocus,
                  controller: _pwController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (input){
                    _pwFocus.unfocus();
                    //登陆请求
                  },
                  decoration: InputDecoration(
                    labelText: "password",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            ButtonBar(
              children: <Widget>[
                RaisedButton(onPressed: (){},child: Text('login'),color: Colors.white,)
              ],
            )
          ],
        ),
      ),
    );
  }
}