// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_local_variable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'mySqlhelper.dart';
import 'admin_panel.dart';

class InputPopupScreen extends StatefulWidget {
  // Add parameters for initial values
  final String initialLeaderId;
  final String initialMember1Id;
  final String initialMember2Id;
  final String initialEvent;

  // Constructor to receive initial values
  InputPopupScreen({
    this.initialLeaderId = '',
    this.initialMember1Id = '',
    this.initialMember2Id = '',
    this.initialEvent = '',
  });

  @override
  _InputPopupScreenState createState() => _InputPopupScreenState();
}

class _InputPopupScreenState extends State<InputPopupScreen> {
  late TextEditingController leaderController;
  late TextEditingController member1Controller;
  late TextEditingController member2Controller;
  late TextEditingController eventController;

  // Variables to store initial values
  late String oldLeaderId;
  late String oldMember1Id;
  late String oldMember2Id;
  late String oldEvent;

  @override
  void initState() {
    super.initState();

    // Initialize text controllers with initial values
    leaderController = TextEditingController(text: widget.initialLeaderId);
    member1Controller = TextEditingController(text: widget.initialMember1Id);
    member2Controller = TextEditingController(text: widget.initialMember2Id);
    eventController = TextEditingController(text: widget.initialEvent);

    // Store initial values in variables
    oldLeaderId = widget.initialLeaderId;
    oldMember1Id = widget.initialMember1Id;
    oldMember2Id = widget.initialMember2Id;
    oldEvent = widget.initialEvent;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Details'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //  _buildTextField('Leader ID', leaderController),
            _buildTextField('Member 1 ID', member1Controller),
            _buildTextField('Member 2 ID', member2Controller),
            _buildTextField('Event', eventController),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the pop-up
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            // Retrieve the values entered by the user
            var leaderId = leaderController.text;
            var member1Id = member1Controller.text;
            var member2Id = member2Controller.text;
            var event = eventController.text;

            /////////////////////////////////////////
            var mysql = Mysql();
            try {
              var results = await mysql.getResults("SET SQL_SAFE_UPDATES = 0;");
              print("Transaction Started");
              results = await mysql.getResults("START TRANSACTION;");
              results = await mysql.getResults(
                  "UPDATE GroupMember SET group_member_id = '$member1Id' WHERE leader_id = '$leaderId' AND group_member_id = '$oldMember1Id';");
              results = await mysql.getResults(
                  "UPDATE GroupMember SET group_member_id = '$member2Id' WHERE leader_id = '$leaderId' AND group_member_id = '$oldMember2Id';");
              results = await mysql.getResults(
                  "UPDATE usereventselection ue JOIN event e ON ue.event_id = e.event_id SET ue.event_id = CASE WHEN '$event' = 'Code In Dark' THEN 1 WHEN '$event' = 'Hackathon' THEN 2 WHEN '$event' = 'Speed Programing' THEN 3 WHEN '$event' = 'Web Development' THEN 4 WHEN '$event' = 'App Development' THEN 5 WHEN '$event' = 'EA Gaming' THEN 6 END WHERE ue.leader_id = '$leaderId' AND e.event_name = '$oldEvent';");
              results = await mysql.getResults("COMMIT;");
              print("Committed");
              results = await mysql.getResults("SET SQL_SAFE_UPDATES = 1;");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminPanel()),
              );
              // Add your button's onPressed logic here

              // Navigator.of(context).pop();
            } catch (e) {
              if (e.toString().contains('Cannot add or update a child row')) {
                // Handle duplicate ID error
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text('Make Sure to match format and ranges'),
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
                      content: Text('This ID is already registered.'),
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
              } else if (e.toString().contains('cannot be null')) {
                // Handle duplicate ID error
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text('Enter valid data.'),
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

            ////////////////////////////////////////////
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}

// Example of how to use the pop-up screen
void showInputPopup(BuildContext context, String initialLeaderId,
    String initialMember1Id, String initialMember2Id, String initialEvent) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return InputPopupScreen(
        initialLeaderId: initialLeaderId,
        initialMember1Id: initialMember1Id,
        initialMember2Id: initialMember2Id,
        initialEvent: initialEvent,
      );
    },
  );
}
