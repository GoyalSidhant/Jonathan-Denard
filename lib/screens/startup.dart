import 'package:Jonathan_Denard/screens/login.dart';
import 'package:flutter/material.dart';

class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  void autoLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff14345e),
      body: Column(
        children: [
          SizedBox(height: height / 2),
          Image.asset('assets/jonathan_denard_app_logo.png'),
          SizedBox(height: 20),
          Image.asset('assets/jonathan_denard_app_splash_screen_bullets.png')
        ],
      ),
    );
  }
}
