

import 'package:e_learning/widget/auth/login.dart';
import 'package:e_learning/widget/home/beranda.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sevima Hackathon',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  timerNext() {
  Future.delayed(const Duration(seconds: 2), () {
    checkMasuk();
  });
}

checkMasuk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String masuk = prefs.getString('masuk') ?? '';
    String login = prefs.getString('login') ?? '';

    try {
      if (login == 'true' && masuk == 'true') {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeWidget()));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginWidget()));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    timerNext();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Text('Splash', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}