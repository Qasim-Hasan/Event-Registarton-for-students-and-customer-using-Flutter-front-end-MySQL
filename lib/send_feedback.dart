// ignore_for_file: unused_import

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isEmailValid = true;
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
          'Feedback',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Your Email',
                labelStyle:
                    TextStyle(color: Color.fromARGB(255, 230, 103, 103)),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                // Check if the email contains "@" and "."
                bool isValidEmail = value.contains('@') && value.contains('.');

                // Update the UI based on email validity
                setState(() {
                  isEmailValid = isValidEmail;
                });
              },
            ),
            if (!isEmailValid)
              Text(
                'Email is not correct',
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 30),
            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Enter your feedback',
                labelStyle:
                    TextStyle(color: Color.fromARGB(255, 230, 103, 103)),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isEmailValid ? _sendFeedback : null,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  isEmailValid ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendFeedback() async {
    final String email = emailController.text;
    late String feedback = feedbackController.text;

    final smtpServer = gmail('talhashahidarain@gmail.com', 'maqlksjyqmpbzgrb');
    feedback = 'Message : $feedback \nFrom : $email';
    var message = Message()
      ..from = Address('talhashahidarain@gmail.com', 'DevCom') //email
      ..recipients.add('talhashahidarain@gmail.com')
      ..subject = 'Feedback from DevCom App'
      ..text = feedback;

    try {
      await send(message, smtpServer);
      _showSnackBar('Feedback sent successfully!');
    } catch (e, s) {
      print('Error sending feedback: $e, $s');
      _showSnackBar('Error sending feedback. Please try again later.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
