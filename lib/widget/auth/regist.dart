
import 'package:e_learning/widget/auth/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegistWidget extends StatefulWidget {
  RegistWidget({super.key});

  @override
  State<RegistWidget> createState() => _RegistWidgetState();
}

class _RegistWidgetState extends State<RegistWidget> {
  bool obscureText = true;
  String role = 'Satpam';
  TextEditingController usernameController = TextEditingController(), emailController = TextEditingController(), passwordController = TextEditingController();

  List<String> list_role = ['Satpam', 'Admin'];

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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
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
                  });
                }
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
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