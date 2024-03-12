// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, sized_box_for_whitespace, use_build_context_synchronously, avoid_print, must_be_immutable, prefer_typing_uninitialized_variables, override_on_non_overriding_member, annotate_overrides, prefer_const_constructors_in_immutables, unnecessary_this, no_logic_in_create_state, unused_local_variable

import 'package:dev_procom_day_registration_system/showDetails.dart';
import 'package:flutter/material.dart';
import 'mySqlhelper.dart';
import 'loding.dart';

class MessageInputScreen extends StatefulWidget {
  @override
  var lid;
  var msgID;
  var name;
  MessageInputScreen(this.lid, this.msgID, this.name);
  _MessageInputScreenState createState() =>
      _MessageInputScreenState(this.lid, this.msgID, this.name);
}

class _MessageInputScreenState extends State<MessageInputScreen> {
  var _messageController = TextEditingController();
  @override
  var lid;
  var msgID;
  var name;
  var adminID = 1234;
  _MessageInputScreenState(this.lid, this.msgID, this.name);
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async {
          // Handle back button press
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DummyScreen(lid, 0)),
          );
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Send Your Message',
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: IconThemeData(
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            backgroundColor: Color.fromARGB(136, 4, 5, 87),
            actions: [
              PopupMenuButton<String>(
                offset: Offset(0, 50),
                color: Color.fromARGB(255, 27, 10, 51),
                onSelected: (value) {
                  // Handle menu item selection
                  print(value);
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'profile',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: const Color.fromARGB(255, 228, 211, 211),
                            size: 50,
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'user',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hello, $name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ],
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
                height: screenHeight,
                width: 490,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _messageController,
                        maxLines: null,
                        maxLength: 450, // Set maximum character limit
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          labelText: 'Enter your message:',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 198, 136, 209),
                          ),
                          prefixIcon: Icon(
                            Icons.message,
                            color: Color.fromARGB(255, 198, 136, 209),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 170, 90, 184),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(40, 5, 51, 0.062),
                            ),
                          ),
                          onPressed: () async {
                            var mysql = Mysql();
                            var msg = _messageController.text;
                            if (msg.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content:
                                        Text('Enter some message to continue'),
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
                                msg = msg.replaceAll("'", "''");
                                print("Transaction Started;");
                                var results = await mysql
                                    .getResults("START TRANSACTION;");
                                results = await mysql.getResults(
                                    "insert into message values(UPPER('$msgID'),UPPER('$lid'),$adminID,UPPER('$msg'));");

                                results = await mysql.getResults("COMMIT;");
                                print("Committed");

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LoadingScreen(lid, 'Sending....', 0),
                                  ),
                                );
                              } catch (e) {
                                if (e.toString().contains('Duplicate')) {
                                  // Handle duplicate ID error
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Error'),
                                        content: Text(
                                            'You can send edit message only once.'),
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
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.purple),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
