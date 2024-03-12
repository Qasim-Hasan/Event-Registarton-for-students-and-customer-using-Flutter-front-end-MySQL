// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Set the icon color here
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Introduction',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    // other text style properties if needed
                    ),
              ),
              SizedBox(height: 8),
              Text(
                'This Privacy Policy governs the manner in which our mobile application collects, uses, maintains, and discloses information collected from users.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                '2. Information We Collect',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    // other text style properties if needed
                    ),
              ),
              SizedBox(height: 8),
              Text(
                'We may collect personal information from users in various ways, including but not limited to when users visit our app, register on the app, subscribe to newsletters, and in connection with other activities, services, features, or resources we make available in our app.',
                style: TextStyle(color: Colors.white),
              ),
              // Add more sections based on your app's data handling practices.
              // ...

              SizedBox(height: 16),
              Text(
                '3. How We Use Collected Information',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    // other text style properties if needed
                    ),
              ),
              SizedBox(height: 8),
              Text(
                'We may use the information we collect for various purposes, including:',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '- Personalize user experience',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '- Improve our app',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '- Send periodic emails or notifications',
                      style: TextStyle(color: Colors.white),
                    ),
                    // Add more purposes based on your app's features.
                    // ...
                  ],
                ),
              ),
              // Add more sections based on your app's data handling practices.
              // ...

              SizedBox(height: 16),
              Text(
                '4. Security',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    // other text style properties if needed
                    ),
              ),
              SizedBox(height: 8),
              Text(
                'We implement security measures to protect the misuse, loss, and alteration of the information under our control.',
                style: TextStyle(color: Colors.white),
              ),
              // Add more sections based on your app's data handling practices.
              // ...
            ],
          ),
        ),
      ),
    );
  }
}
