// main.dart

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import

import 'package:dev_procom_day_registration_system/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'registerScreen.dart';
import 'admin_panel.dart';
import 'drawer.dart'; // Add this import
import 'admin_signIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
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
        ),
        nextScreen: MyHomePage(title: 'DEV Day 2023'),
        splashTransition: SplashTransition.fadeTransition,
        duration: 1500,
        backgroundColor: Colors.black,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DrawerSections currentPage = DrawerSections.about_developer; // Add this line

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(137, 36, 1, 43),
        // automaticallyImplyLeading: false,
        title: Text(widget.title),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/firstscrback.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: Column(
                  children: [
                    SizedBox(height: 110),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(34, 126, 16, 216),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                          );
                        },
                        child: Text(
                          '   User Login  ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(34, 126, 16, 216),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminSignInScreen(),
                            ),
                          );
                        },
                        child: Text(
                          '  Admin Login ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(
        currentPage: currentPage,
        onDrawerItemSelected: (section) {
          setState(() {
            currentPage = section;
          });
        },
      ),
    );
  }
}
