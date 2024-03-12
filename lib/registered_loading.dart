// ignore_for_file: must_be_immutable, unused_import

import 'dart:async';
import 'package:dev_procom_day_registration_system/main.dart';
import 'package:dev_procom_day_registration_system/selectMembers.dart';
import 'package:dev_procom_day_registration_system/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RgtrLoadingScreen extends StatefulWidget {
  RgtrLoadingScreen();

  @override
  _RgtrLoadingScreen createState() => _RgtrLoadingScreen();
}

class _RgtrLoadingScreen extends State<RgtrLoadingScreen> {
  _RgtrLoadingScreen();
  double rotation = 0.0;
  bool canContinue = false; // Flag to control whether the user can continue

  @override
  void initState() {
    super.initState();

    // Simulate a loading delay (you can replace this with your actual data loading logic)
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        canContinue = true; // Allow the user to continue after 3 seconds
      });
    });

    // Rotate all SpinKitDoubleBounce widgets in a line
    Timer.periodic(Duration(milliseconds: 30), (timer) {
      if (!canContinue) {
        // Only update the rotation if the animation is still allowed
        setState(() {
          rotation += 0.1;
        });
      } else {
        timer.cancel(); // Stop the timer when the animation is complete
        _redirectToFinalPage(); // Redirect to the final page
      }
    });
  }

  Widget buildRotatedSpinKit(Color color, double size) {
    return Transform.rotate(
      angle: rotation,
      child: SpinKitDoubleBounce(
        color: color,
        size: size,
      ),
    );
  }

  void _redirectToFinalPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'Welcome')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top: Completed Registration Text
            Text(
              'Registration Successfull',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 90.0),
            // Middle: AnimatedContainer with three SpinKitDoubleBounce widgets
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRotatedSpinKit(
                  Color.fromARGB(255, 161, 231, 173),
                  80.0,
                ),
                buildRotatedSpinKit(
                  Color.fromARGB(255, 180, 255, 59),
                  80.0,
                ),
                buildRotatedSpinKit(
                  const Color.fromARGB(255, 41, 121, 44),
                  80.0,
                ),
              ],
            ),
            SizedBox(height: 120.0), // Space between ticks and Continue button
            // Continue button (conditionally displayed)
            // canContinue
            //     ? ElevatedButton(
            //         onPressed: _redirectToFinalPage,
            //         child: Text('Continue'),
            //       )
            //     : Container(),
          ],
        ),
      ),
    );
  }
}
