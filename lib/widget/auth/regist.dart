
import 'dart:convert';

import 'package:e_learning/service/api_service.dart';
import 'package:e_learning/widget/auth/login.dart';
import 'package:e_learning/widget/home/beranda.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistWidget extends StatefulWidget {
  RegistWidget({super.key});

  @override
  State<RegistWidget> createState() => _RegistWidgetState();
}

class _RegistWidgetState extends State<RegistWidget> {
  bool obscureText = true;
  String role = 'Satpam', sendRole = 'guard';
  TextEditingController usernameController = TextEditingController(), emailController = TextEditingController(), passwordController = TextEditingController();

  List<String> list_role = ['Satpam', 'Admin'];

  setRegist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var data = {
      'name': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'role': sendRole
    };

    var send = await ApiService().dataUrl(data, 'user/regist');
    var body = json.decode(send.body);

    print(data);

    if (body['status'] == 'success') {
      setState(() {
        prefs.setString('masuk', 'true');
        prefs.setString('login', 'true');
        prefs.setString('username', usernameController.text);
        prefs.setString('role', role);
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
            Center(
              child: Text('Register', style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 80),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: DropdownButton(
                value: role,
                isExpanded: true,
                underline: Container(),
                items: list_role.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (value) {
                  setState(() {
                    role = value.toString();
                    sendRole = value.toString() == 'Satpam' ? 'guard' : 'admin';
                  });
                }
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty && role.isNotEmpty) {
                  setRegist();
                }
              },
              child: const Text('Register')
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Login',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginWidget())
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