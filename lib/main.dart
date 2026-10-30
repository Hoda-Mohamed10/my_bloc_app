import 'package:flutter/material.dart';
import 'package:my_bloc_app/home/splash_home.dart';

 void main() {
   runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashHome(),
    );
  }
}

