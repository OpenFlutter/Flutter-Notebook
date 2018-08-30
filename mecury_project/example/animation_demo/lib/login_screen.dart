import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameController;
  TextEditingController _pwController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _pwController = TextEditingController();
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
            _buildTextField(_nameController, false,"name"),
            _buildTextField(_pwController, true,"password"),
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

  Widget _buildTextField(TextEditingController controller, bool obscureText,String labelText) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
//              filled: true,
              labelText: labelText,
//              fillColor: Colors.white
          ),
        ),
      ),
    );
  }
}
