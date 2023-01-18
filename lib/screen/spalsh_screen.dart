

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:netflixclone/screen/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/image/Netflix-logo-red.png'),
      ),
    );
  }

  Future<void> gotoHome() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>const HomeScreen()));
  }
}
