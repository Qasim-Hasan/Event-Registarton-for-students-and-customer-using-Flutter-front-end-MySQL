// ignore_for_file: unused_import, must_be_immutable, file_names, non_constant_identifier_names, prefer_const_constructors, avoid_print, avoid_unnecessary_containers, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'showDetails.dart';
import 'selectEvent.dart';
import 'mySqlhelper.dart';
import 'registerScreen.dart';
import 'main.dart';
import 'admin_panel.dart';

class AdminSignInScreen extends StatelessWidget {
  var StudentID = TextEditingController();
  var Password = TextEditingController();

  AdminSignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print('$screenHeight');
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                    title: 'Welcome',
                  )),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, // Set the icon color here
          ),
          backgroundColor: Colors.black,
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Login As Admin'),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: screenHeight,
              width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/backgroung1.jpeg'), // Replace with your image path
                  fit: BoxFit.fill, // You can change the fit to suit your needs
                ),
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/oper1.png'),
                                  fit: BoxFit.fill)),
                        ),
                        // SizedBox(height: 50),
                        Container(
                            decoration: BoxDecoration(
                                //color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: StudentID,
                                decoration: InputDecoration(
                                  labelText: 'User Name',
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 230, 103, 103)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors
                                          .white, // Change this color to your desired outline color
                                    ),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        // SizedBox(height: 20),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: Password,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 230, 103, 103)),
                                  border: OutlineInputBorder(),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 2.0),
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust the border radius as needed
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(40, 5, 51,
                                      0.062)), // Change the button's background color as needed
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.purple),
                            ),
                            onPressed: () async {
                              var mysql = Mysql();
                              var stId = StudentID.text;
                              var spass = Password.text;
                              stId = stId.replaceAll("'", "''");
                              spass = spass.replaceAll("'", "''");
                              // Check if any of the fields are empty
                              if (stId.isEmpty || spass.isEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content:
                                          Text('Please fill in all fields.'),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                try {
                                  print('$stId');
                                  print('$spass');
                                  var results = await mysql.getResults(
                                      "select admin_username, admin_password from Admin where (admin_username='$stId' and BINARY admin_password='$spass');");
                                  if (results.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AdminPanel(),
                                      ),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(
                                              'Invalid Student ID or Password.'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } catch (e) {
                                  if (e
                                      .toString()
                                      .contains('0 row(s) returned')) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(
                                              'Make sure to match the format with examples or correct Leader ID'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    print('Error: $e');
                                  }
                                }
                              }
                            },
                            // child: null,
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: 20)
              ])),
        ),
      ),
    );
  }
}
