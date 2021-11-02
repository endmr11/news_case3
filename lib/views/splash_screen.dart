import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_case3/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width * 0.6,
          height: width * 0.6,
          child: Image.asset(
            "assets/news.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
