import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_bloc_app/nav_bar/nav_bar.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({super.key});

  @override
  State<SplashHome> createState() => _SplashHomeState();
}
class _SplashHomeState extends State<SplashHome> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(
      Duration(seconds:10),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NavBar(),
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF001F3F),
        body: Center(
          child: Image.asset('assets/images/Group 24.png',),
        ));
  }
}
