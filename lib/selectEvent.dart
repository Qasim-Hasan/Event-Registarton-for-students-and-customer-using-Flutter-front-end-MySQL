// ignore_for_file: unused_import, must_be_immutable, prefer_typing_uninitialized_variables, override_on_non_overriding_member, no_logic_in_create_state, annotate_overrides, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'selectMembers.dart';
import 'signInScreen.dart';
import 'showDetails.dart';
import 'eventselectionloading.dart';

class SelectEvents extends StatefulWidget {
  @override
  var stid;
  SelectEvents(this.stid);
  _SelectEventsState createState() => _SelectEventsState(stid);
}

class _SelectEventsState extends State<SelectEvents> {
  @override
  var eid = 1;
  var stid;
  _SelectEventsState(this.stid);
  Widget build(BuildContext context) {
    Future<void> selectEvent(int eventId) async {
      eid = eventId;
    }

    return WillPopScope(
        onWillPop: () async {
          // Handle back button press
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
                color: Colors.white, // Set the icon color here
              ),
              backgroundColor: Colors.black,
              // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text('Select Event'),
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                                child: Text(
                              "CODE IN DARK",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                selectEvent(1);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EvntLoadingScreen(stid, eid),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 175, 87, 87),
                                ),
                                child:
                                    Image.asset("assets/images/codeInDark.png"),
                              ),
                            )
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                                child: Text(
                              "HACKATHONE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                            SizedBox(height: 20),
                            InkWell(
                                onTap: () {
                                  selectEvent(2);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EvntLoadingScreen(stid, eid),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(
                                        255, 187, 133, 133),
                                  ),
                                  child: Image.asset(
                                    "assets/images/hackathone.png",
                                    height: 5,
                                    width: 5,
                                  ),
                                ))
                          ]),
                    ],
                  ),
                  SizedBox(height: 20),
                  /////////////////////////////////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                                child: Text(
                              "SPEED PROGRAMING",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                selectEvent(3);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EvntLoadingScreen(stid, eid),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 175, 87, 87),
                                ),
                                child: Image.asset(
                                    "assets/images/speedprograming.png"),
                              ),
                            )
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                                child: Text(
                              "WEB DEVELOPMENT",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                            SizedBox(height: 20),
                            InkWell(
                                onTap: () {
                                  selectEvent(4);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EvntLoadingScreen(stid, eid),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 145, 114, 231),
                                  ),
                                  child: Image.asset(
                                    "assets/images/webdev.png",
                                    height: 5,
                                    width: 5,
                                  ),
                                ))
                          ]),
                    ],
                  ),
                  SizedBox(height: 20),
                  ///////////////////////////////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                                child: Text(
                              "APP DEVELOPMENT",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                selectEvent(5);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EvntLoadingScreen(stid, eid),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 17, 72, 109),
                                ),
                                child: Image.asset("assets/images/appdev.png"),
                              ),
                            )
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                                child: Text(
                              "EA GAMING",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                            SizedBox(height: 20),
                            InkWell(
                                onTap: () {
                                  selectEvent(6);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EvntLoadingScreen(stid, eid),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 142, 211, 30),
                                  ),
                                  child: Image.asset(
                                    "assets/images/gaming.png",
                                    height: 5,
                                    width: 5,
                                  ),
                                ))
                          ]),
                    ],
                  ),
                  ///////////////////////////////////////////////////
                ],
              ),
            )));
  }
}
