
import 'dart:convert';

import 'package:e_learning/widget/auth/regist.dart';
import 'package:e_learning/widget/home/beranda.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/api_service.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  bool obscureText = true;
  TextEditingController emailController = TextEditingController(), passwordController = TextEditingController();

  setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var data = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    var send = await ApiService().dataUrl(data, 'user/login');
    var body = json.decode(send.body);

    print(data);

    if (body['status'] == 'success') {
      setState(() {
        prefs.setString('masuk', 'true');
        prefs.setString('login', 'true');
        prefs.setString('username', body['data']['name']);
        prefs.setString('role', body['data']['role']);
      });

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeWidget())
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(body['message']))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login', style: TextStyle(fontSize: 30)),
            SizedBox(height: 80),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText =
                          !obscureText;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                  setLogin();
                }
              },
              child: const Text('Login')
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Register',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => RegistWidget())
                      );
                    }
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}