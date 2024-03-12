// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
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
          'Events Description',
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
                'Overview:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Explore the exciting events offered in the DevCom registration app. Participate in various activities and enhance your skills in the following events:',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('- Code in Dark (about making pages after one scene)',
                        style: TextStyle(color: Colors.white)),
                    Text('- Web Development',
                        style: TextStyle(color: Colors.white)),
                    Text('- Speed Programming',
                        style: TextStyle(color: Colors.white)),
                    Text('- App Development',
                        style: TextStyle(color: Colors.white)),
                    Text('- EA Gaming', style: TextStyle(color: Colors.white)),
                    Text('- Hackathon', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              // Event 1: Code in Dark
              SizedBox(height: 16),
              Text(
                'Code in Dark:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Participate in the Code in Dark event, where you will be challenged to create pages after one scene. Showcase your coding skills and creativity.',
                style: TextStyle(color: Colors.white),
              ),

              // Event 2: Web Development
              SizedBox(height: 16),
              Text(
                'Web Development:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Join the Web Development event to build and present your web development projects. Explore the latest trends and technologies in web development.',
                style: TextStyle(color: Colors.white),
              ),

              // Event 3: Speed Programming
              SizedBox(height: 16),
              Text(
                'Speed Programming:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Test your coding speed and problem-solving skills in the Speed Programming event. Solve challenging problems within a limited time.',
                style: TextStyle(color: Colors.white),
              ),

              // Event 4: App Development
              SizedBox(height: 16),
              Text(
                'App Development:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Participate in the App Development event to build innovative mobile applications. Showcase your app development expertise and creativity.',
                style: TextStyle(color: Colors.white),
              ),

              // Event 5: EA Gaming
              SizedBox(height: 16),
              Text(
                'EA Gaming:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Experience the thrill of EA Gaming. Join this event to compete in exciting gaming challenges and showcase your gaming skills.',
                style: TextStyle(color: Colors.white),
              ),

              // Event 6: Hackathon
              SizedBox(height: 16),
              Text(
                'Hackathon:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Participate in the Hackathon event to collaborate, innovate, and solve real-world problems. Bring your coding skills to the table and create impactful solutions.',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
