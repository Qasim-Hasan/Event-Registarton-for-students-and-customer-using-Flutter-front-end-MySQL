// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
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
          'About Developer',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            buildAdminCard(
              'Qasim Hasan',
              '21K-3210',
              'k213210@nu.edu.pk',
              'assets/images/Qasim.jpeg',
            ),
            SizedBox(height: 16),
            buildAdminCard('Talha Shahid', '21K-3355', 'k213355@nu.edu.pk',
                'assets/images/Talha.jpeg'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildAdminCard(
      String name, String rollNumber, String email, String imagePath) {
    return Card(
      color: Color.fromARGB(92, 245, 245, 245),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 50,
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(height: 8),
            Text(
              'Roll Number: $rollNumber',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
