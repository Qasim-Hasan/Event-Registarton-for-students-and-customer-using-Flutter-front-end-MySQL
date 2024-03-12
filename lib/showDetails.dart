// ignore_for_file: unused_import, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, override_on_non_overriding_member, unused_local_variable, prefer_const_constructors, file_names, unnecessary_this, no_logic_in_create_state, annotate_overrides, library_private_types_in_public_api, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'mySqlhelper.dart';
import 'inputMessage.dart';
import 'signInScreen.dart'; // Import your SignInScreen
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class DummyScreen extends StatefulWidget {
  var lid;
  var st;
  DummyScreen(this.lid, this.st);

  @override
  _DummyScreenState createState() => _DummyScreenState(this.lid, this.st);
}

class _DummyScreenState extends State<DummyScreen> {
  var lid;
  var st;
  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  _DummyScreenState(this.lid, this.st);

  var memberID1;
  var memberID2;
  var leaderID;
  var leaderName;
  var memberName1;
  var memberName2;
  var competition;
  var email;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var mysql = Mysql();
    try {
      var results = await mysql.getResults(
          "SELECT student_id FROM Leader WHERE student_id = '$lid'"); //
      setState(() {
        for (var row in results) {
          leaderID = row.colByName('student_id');
        }
      });

      results = await mysql.getResults(
          "SELECT full_name FROM Leader WHERE student_id = '$lid'"); //
      setState(() {
        for (var row in results) {
          leaderName = row.colByName('full_name');
        }
      });

      results = await mysql
          .getResults("select email from leader where student_id='$lid';");
      setState(() {
        for (var row in results) {
          email = row.colByName('email');
        }
      });

      results = await mysql.getResults(
          "SELECT group_member_id FROM groupmember WHERE leader_id = '$lid' LIMIT 1");
      setState(() {
        for (var row in results) {
          memberID1 = row.colByName('group_member_id');
        }
      });

      results = await mysql.getResults(
          "SELECT group_member_id FROM groupmember WHERE leader_id = '$lid' LIMIT 1 OFFSET 1");
      setState(() {
        for (var row in results) {
          memberID2 = row.colByName('group_member_id');
        }
      });

      results = await mysql.getResults(
          "select e.event_name from event e, usereventselection ue, leader l where l.student_id='$lid' and l.student_id=ue.leader_id and ue.event_id=e.event_id;");
      setState(() {
        for (var row in results) {
          competition = row.colByName('event_name');
        }
      });
    } catch (e) {
      print('Error: $e');
    }
    if (st == 1) {
      _sendmail();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          backgroundColor: Color.fromARGB(136, 4, 5, 87),
          title: Text('All Details'),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              );
            },
          ),
          actions: [
            PopupMenuButton<String>(
              offset: Offset(0, 50),
              color: Color.fromARGB(255, 27, 10, 51),
              onSelected: (value) {
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
                          'Hello, $leaderName',
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
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/registerscrback.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            height: screenHeight,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  _buildRow('LEADER ID', '$leaderID'),
                  SizedBox(height: 10),
                  _buildDivider(),
                  SizedBox(height: 10),
                  _buildRow('LEADER NAME', '$leaderName'),
                  SizedBox(height: 10),
                  _buildDivider(),
                  SizedBox(height: 10),
                  _buildRow('EMAIL', '$email'),
                  SizedBox(height: 10),
                  _buildDivider(),
                  SizedBox(height: 10),
                  _buildRow('MEMBER 1 ID', '$memberID1'),
                  SizedBox(height: 10),
                  _buildDivider(),
                  SizedBox(height: 10),
                  _buildRow('MEMBER 2 ID', '$memberID2'),
                  SizedBox(height: 10),
                  _buildDivider(),
                  SizedBox(height: 10),
                  _buildRow('COMPETITION', '$competition'),
                  SizedBox(height: 10),
                  _buildDivider(),
                  SizedBox(height: 30),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MessageInputScreen(lid, lid, leaderName),
                          ),
                        );
                      },
                      child: Text(
                        'Request Edit',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }

  void _sendmail() async {
    late String msg = feedbackController.text;

    final smtpServer = gmail('talhashahidarain@gmail.com', 'maqlksjyqmpbzgrb');
    msg = '''
Dear $leaderName,

Thank you for registering for the DevCom Event. We appreciate your participation. Below are the details you provided:

- Leader ID: $leaderID
- Leader Name: $leaderName
- Email: $email
- Member 1 ID: $memberID1
- Member 2 ID: $memberID2
- Competition: $competition

We wish you the best of luck in the competition. If you have any questions or need further assistance, feel free to reach out.

Sincerely,
Team DevCom
''';
    var message = Message()
      ..from = Address('talhashahidarain@gmail.com', 'DevCom')
      ..recipients.add(email)
      ..subject = 'Thanks For Registration In DevCom'
      ..text = msg;

    try {
      await send(message, smtpServer);
    } catch (e, s) {
      print('Error sending feedback: $e, $s');
    }
  }

  Widget _buildRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: const Color.fromARGB(255, 250, 250, 250),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: const Color.fromARGB(255, 250, 250, 250),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: const Color.fromARGB(255, 170, 90, 184),
      thickness: 2.0,
    );
  }
}
