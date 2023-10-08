import 'package:dev_procom_day_registration_system/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEV+PROCOM DAY',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset(
          "assets/images/icon.png",
          height: 50,
          width: 50,
        ), // Add your logo image here
        nextScreen: MyHomePage(title: 'DEV DAY 2023'),
        splashTransition: SplashTransition.fadeTransition,
        duration: 1500,
        backgroundColor: Colors.black,
      ),
    );
  }
}

// ... rest of your code ...

