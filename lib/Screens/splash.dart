import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:practice/Constants/app_colors.dart';
import 'package:practice/Screens/todo_homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.push(
            // ignore: prefer_const_constructors
            context,
            MaterialPageRoute(builder: (context) => TodoHomepage()));
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor.black,
      body: Center(
        child: LottieBuilder.asset("assets/loading.json"),
      ),
    );
  }
}
