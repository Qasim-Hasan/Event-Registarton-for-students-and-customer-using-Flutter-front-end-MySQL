// ignore_for_file: unused_import, must_be_immutable, unused_local_variable, file_names, non_constant_identifier_names, prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:dev_procom_day_registration_system/registered_loading.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'mySqlhelper.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var StudentID = TextEditingController();
  var Name = TextEditingController();
  var Phone = TextEditingController();
  var Email = TextEditingController();
  var department = TextEditingController();
  var Year = TextEditingController();
  var password = TextEditingController();
  bool _isObscured = true;
  bool isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              title: 'Welcome',
            ),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          backgroundColor: Color.fromARGB(136, 4, 5, 87),
          title: Text('Create Account'),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/registerscrback.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              height: screenHeight + 100,
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: StudentID,
                        decoration: InputDecoration(
                          labelText: 'Student ID (e.g: 21K-1234)',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 230, 103,
                                  103)), // Set label text color to white
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: Name,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 230, 103, 103)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: Phone,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 230, 103, 103)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: Email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 230, 103, 103)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          // Check if the email contains "@" and "."
                          bool isValidEmail =
                              value.contains('@') && value.contains('.');

                          // Update the UI based on email validity
                          setState(() {
                            isEmailValid = isValidEmail;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: department,
                        decoration: InputDecoration(
                          labelText: 'Department (e.g.: CS, ROB, CYS)',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 230, 103, 103)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: Year,
                        decoration: InputDecoration(
                          labelText: 'Batch Year (e.g: 19 - 23)',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 230, 103, 103)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: password,
                        obscureText: _isObscured,
                        decoration: InputDecoration(
                          labelText: 'Create Password (e.g.: abc123)',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 230, 103, 103)),
                          border: OutlineInputBorder(),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _togglePasswordVisibility();
                            },
                            child: Icon(
                              _isObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 170, 90, 184),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(40, 5, 51, 0.062)),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.purple),
                      ),
                      onPressed: () async {
                        var mysql = Mysql();
                        var stId = StudentID.text;
                        var sname = Name.text;
                        var sdepartment = department.text;
                        var sphone = Phone.text;
                        var semail = Email.text;
                        var syear = Year.text;
                        var spassword = password.text;
                        var sstatus = 0;
                        spassword = spassword.replaceAll("'", "''");
                        stId = stId.replaceAll("'", "''");
                        sname = sname.replaceAll("'", "''");
                        sdepartment = sdepartment.replaceAll("'", "''");
                        sphone = sphone.replaceAll("'", "''");
                        syear = syear.replaceAll("'", "''");
                        semail = semail.replaceAll("'", "''");
                        // Check if any of the fields are empty
                        if (stId.isEmpty ||
                            sname.isEmpty ||
                            sdepartment.isEmpty ||
                            sphone.isEmpty ||
                            semail.isEmpty ||
                            syear.isEmpty ||
                            spassword.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Please fill in all fields.'),
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
                        } else if (!isEmailValid) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content:
                                    Text('Please enter a valid email address.'),
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
                          return; // Stop the registration process if the email is not valid
                        } else {
                          try {
                            var results =
                                await mysql.getResults("START TRANSACTION;");
                            print("Transaction Started");

                            results = await mysql.getResults(
                                "insert into Leader values(UPPER('$stId'),'$spassword','$sname',UPPER('$sdepartment'),'$sphone','$semail','$syear','$sstatus');");

                            results = await mysql.getResults("COMMIT;");
                            print("Data Commited");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RgtrLoadingScreen(),
                              ),
                            );
                          } catch (e) {
                            if (e
                                .toString()
                                .contains('Cannot add or update a child row')) {
                              // Handle duplicate ID error
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text(
                                        'Make Sure to match format with examples'),
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
                            } else if (e.toString().contains('Duplicate')) {
                              // Handle duplicate ID error
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text(
                                        'This ID or Password is already registered.'),
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
                              // Handle other errors
                              print('Error: $e');
                            }
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
}
