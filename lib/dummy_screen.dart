// dummy_screen.dart

import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Set the icon color here
        ),
        backgroundColor: Colors.black,
        title: Text('Dummy Screen'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Text(
          "IT IS A DUMMY SCREEN JUST FOR TEST",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
