import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled8/view/auth_screen/profileScreen.dart';
import 'package:untitled8/view/auth_screen/riegster_screen.dart';

import '../../controller/authController.dart';
import '../ComplantScreen/Complant Screen _test.dart';

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            await _authController.loginWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );
            if (_authController.firebaseUser.value != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ComplaintPage()),
              );
            }
          },
          child: Text('Login'),
        ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
