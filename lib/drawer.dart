// drawer.dart

// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'privacyPolicy.dart';
import 'my_drawer_header.dart';
import 'aboutDevs.dart';
import 'events.dart';
import 'send_feedback.dart';

class MyDrawer extends StatefulWidget {
  final DrawerSections currentPage;
  final Function(DrawerSections) onDrawerItemSelected;

  MyDrawer({required this.currentPage, required this.onDrawerItemSelected});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(
              1,
              "About Developer",
              Icons.people_alt_outlined,
              widget.currentPage == DrawerSections.about_developer
                  ? true
                  : false),
          menuItem(2, "Events", Icons.event,
              widget.currentPage == DrawerSections.events ? true : false),
          Divider(),
          menuItem(
              3,
              "Privacy policy",
              Icons.privacy_tip_outlined,
              widget.currentPage == DrawerSections.privacy_policy
                  ? true
                  : false),
          menuItem(
              4,
              "Send feedback",
              Icons.feedback_outlined,
              widget.currentPage == DrawerSections.send_feedback
                  ? true
                  : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(); // Close the drawer
          widget.onDrawerItemSelected(getDrawerSection(id));
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DrawerSections getDrawerSection(int id) {
    switch (id) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminPage(),
          ),
        );
        return DrawerSections.about_developer;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescriptionPage(),
          ),
        );
        return DrawerSections.events;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PrivacyPolicyPage(),
          ),
        );
        return DrawerSections.privacy_policy;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FeedbackScreen(),
          ),
        );
        return DrawerSections.send_feedback;
      default:
        return DrawerSections.about_developer;
    }
  }
}

enum DrawerSections {
  about_developer,
  events,
  privacy_policy,
  send_feedback,
}
