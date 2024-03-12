// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, unused_local_variable

import 'package:dev_procom_day_registration_system/admin_signIn.dart';
import 'package:dev_procom_day_registration_system/main.dart';
import 'package:flutter/material.dart';
import 'mySqlhelper.dart';
import 'updation_screen.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  late List<Map<String, String>> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var mysql = Mysql();
    try {
      var results = await mysql.getResults("""
        SELECT
          leader,
          MIN(member1) AS member1,
          MAX(member2) AS member2,
          MAX(event) AS event,
          MAX(message_text) AS message_text
        FROM (
          SELECT
            l.student_id AS leader,
            gm1.group_member_id AS member1,
            NULL AS member2,
            NULL AS event,
            NULL AS message_text
          FROM
            leader l
          LEFT JOIN
            groupmember gm1 ON l.student_id = gm1.leader_id

          UNION ALL

          SELECT
            l.student_id AS leader,
            NULL AS member1,
            gm2.group_member_id AS member2,
            NULL AS event,
            NULL AS message_text
          FROM
            leader l
          LEFT JOIN
            groupmember gm1 ON l.student_id = gm1.leader_id
          LEFT JOIN
            groupmember gm2 ON l.student_id = gm2.leader_id AND gm2.group_member_id <> gm1.group_member_id

          UNION ALL

          SELECT
            l.student_id AS leader,
            NULL AS member1,
            NULL AS member2,
            e.event_name AS event,
            NULL AS message_text
          FROM
            leader l
          LEFT JOIN
            usereventselection ue ON l.student_id = ue.leader_id
          LEFT JOIN
            event e ON ue.event_id = e.event_id

          UNION ALL

          SELECT
            l.student_id AS leader,
            NULL AS member1,
            NULL AS member2,
            NULL AS event,
            m.message_text AS message_text
          FROM
            leader l
          LEFT JOIN
            Message m ON l.student_id = m.leader_id
        ) AS subquery
        GROUP BY
          leader;
      """);

      data = results.map((row) {
        return {
          'leader': row.colByName('leader') ?? '',
          'member1': row.colByName('member1') ?? '',
          'member2': row.colByName('member2') ?? '',
          'event': row.colByName('event') ?? '',
          'message_text': row.colByName('message_text') ?? '',
        };
      }).toList();
    } catch (e) {
      print('Error: $e');
    }
    setState(() {}); // Trigger a rebuild with the updated data
  }

  @override
  Widget build(BuildContext context) {
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
          centerTitle: true,
          title: Text(
            'Admin Panel',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminSignInScreen(),
                ),
              );
            },
          ),
          actions: [
            PopupMenuButton<String>(
              offset: Offset(0, 50),
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
                          Icons.admin_panel_settings_rounded,
                          color: Colors.black,
                          size: 50,
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'admin',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '         Admin          ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text('Leader', style: TextStyle(color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Member1', style: TextStyle(color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Member2', style: TextStyle(color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Event', style: TextStyle(color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Message', style: TextStyle(color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Action', style: TextStyle(color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Delete', style: TextStyle(color: Colors.white)),
                ),
              ],
              rows: data.map((entry) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(entry['leader'] ?? '',
                          style: TextStyle(color: Colors.white)),
                    ),
                    DataCell(
                      Text(entry['member1'] ?? '',
                          style: TextStyle(color: Colors.white)),
                    ),
                    DataCell(
                      Text(entry['member2'] ?? '',
                          style: TextStyle(color: Colors.white)),
                    ),
                    DataCell(
                      Text(entry['event'] ?? '',
                          style: TextStyle(color: Colors.white)),
                    ),
                    DataCell(
                      Text(entry['message_text'] ?? '',
                          style: TextStyle(color: Colors.white)),
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                        onPressed: () {
                          String leaderId = entry['leader'] ?? '';
                          String member1Id = entry['member1'] ?? '';
                          String member2Id = entry['member2'] ?? '';
                          String event = entry['event'] ?? '';

                          // Show the input pop-up with the initial values
                          showInputPopup(
                            context,
                            leaderId,
                            member1Id,
                            member2Id,
                            event,
                          );
                        },
                      ),
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          String leaderId = entry['leader'] ?? '';
                          deleteRow(leaderId, context);
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> deleteRow(var leaderId, var context) async {
  var mysql = Mysql();
  try {
    print(
        "Transaction Started;"); //Only For confirmation otherwise it's auto committed
    var results = await mysql.getResults("START TRANSACTION;");
    results = await mysql.getResults("SET SQL_SAFE_UPDATES = 0;");
    results = await mysql.getResults(
        "DELETE FROM UserEventSelection WHERE leader_id = '$leaderId';");
    results = await mysql
        .getResults("delete from groupmember where leader_id='$leaderId';");
    results = await mysql
        .getResults("DELETE FROM Message WHERE leader_id = '$leaderId';");
    results = await mysql
        .getResults("DELETE FROM Leader WHERE student_id = '$leaderId';");
    results = await mysql.getResults("COMMIT;");
    print("Committed");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdminPanel()),
    );
  } catch (e) {
    // Handle other errors
    print('Error: $e');
  }
}
