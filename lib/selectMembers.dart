// ignore_for_file: unused_import, must_be_immutable, unused_local_variable, file_names, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'showDetails.dart';
import 'mySqlhelper.dart';
import 'selectEvent.dart';
import 'loding.dart';

class SelectMembers extends StatelessWidget {
  var stid1 = TextEditingController();
  var stid2 = TextEditingController();
  var evid;
  var lid;
  SelectMembers(this.lid, this.evid);
  var did1 = TextEditingController();
  var bid1 = TextEditingController();
  var did2 = TextEditingController();
  var bid2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: () async {
          // Handle back button press
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SelectEvents(lid)),
          );
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white, // Set the icon color here
              ),
              backgroundColor: Color.fromARGB(136, 4, 5, 87),
              // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text('Members Details'),
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/registerscrback.jpg'), // Replace with your image path
                      fit: BoxFit
                          .fill, // You can change the fit to suit your needs
                    ),
                  ),
                  height: screenHeight, //900
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              //color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: stid1,
                              decoration: InputDecoration(
                                labelText: 'Member ID 1 (e.g: 21K-3355)',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 230, 103, 103)),
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
                      Container(
                          decoration: BoxDecoration(
                              //color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: did1,
                              decoration: InputDecoration(
                                labelText:
                                    'Department ID 1 (e.g: CS, ROB, CYS)',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 230, 103, 103)),
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
                      Container(
                          decoration: BoxDecoration(
                              //color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: bid1,
                              decoration: InputDecoration(
                                labelText: 'Batch ID 1 (e.g: 19 - 23)',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 230, 103, 103)),
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
                      Container(
                          decoration: BoxDecoration(
                              //color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: stid2,
                              decoration: InputDecoration(
                                labelText: 'Member ID 2 (e.g: 21K-3210)',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 230, 103, 103)),
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
                      Container(
                          decoration: BoxDecoration(
                              //color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: did2,
                              decoration: InputDecoration(
                                labelText:
                                    'Department ID 2 (e.g: CS, ROB, CYS)',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 230, 103, 103)),
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
                      Container(
                          decoration: BoxDecoration(
                              //color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: bid2,
                              decoration: InputDecoration(
                                labelText: 'Batch ID 2 (e.g: 19 - 23)',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 230, 103, 103)),
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
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 170, 90, 184),
                                width: 2.0),
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
                              'Submit',
                              style: TextStyle(color: Colors.purple),
                            ),
                            onPressed: () async {
                              var mysql = Mysql();
                              var stId1 = stid1.text;
                              var sdid1 = did1.text;
                              var sbid1 = bid1.text;
                              var stId2 = stid2.text;
                              var sdid2 = did2.text;
                              var sbid2 = bid2.text;
                              var slid = lid.text;

                              // Check if any of the fields are empty
                              if (stId1.isEmpty ||
                                  sdid1.isEmpty ||
                                  sbid1.isEmpty ||
                                  stId2.isEmpty ||
                                  sdid2.isEmpty ||
                                  sbid2.isEmpty ||
                                  slid.isEmpty) {
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
                                  print("Transaction Started");
                                  var results = await mysql
                                      .getResults("START TRANSACTION;");
                                  results = await mysql.getResults(
                                      "INSERT INTO GroupMember (group_member_id, leader_id, department, batch_id) VALUES (UPPER('$stId1'), UPPER('$slid'), UPPER('$sdid1'), '$sbid1'),(UPPER('$stId2'), UPPER('$slid'), UPPER('$sdid2'), '$sbid2');");
                                  results = await mysql.getResults("COMMIT;");
                                  results = await mysql.getResults(
                                      "INSERT INTO usereventselection VALUES (UPPER('$slid'),'$evid');");

                                  results = await mysql.getResults(
                                      "UPDATE Leader SET status = 1 WHERE student_id = UPPER('$slid');");
                                  results = await mysql.getResults("COMMIT;");

                                  print("Committed");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoadingScreen(
                                          slid, 'Registration Completed', 1),
                                    ),
                                  );
                                } catch (e) {
                                  if (e.toString().contains(
                                      'Cannot add or update a child row')) {
                                    // Handle duplicate ID error
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(
                                              'Make Sure to match format with examples or correct Leader ID'),
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
                                  } else if (e
                                      .toString()
                                      .contains('Duplicate')) {
                                    // Handle duplicate ID error
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(
                                              'One can be registered only once.'),
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
                          ))
                    ],
                  ),
                ),
              ),
            )));
  }
}


//it's updated