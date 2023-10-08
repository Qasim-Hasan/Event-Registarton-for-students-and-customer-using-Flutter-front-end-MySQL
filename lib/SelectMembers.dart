import 'package:dev_procom_day_registration_system/dummy_screen.dart';
import 'package:flutter/material.dart';

class SelectMembers extends StatelessWidget {
  TextEditingController StudentID = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController UniversityName = TextEditingController();
  TextEditingController Year = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, // Set the icon color here
          ),
          backgroundColor: Colors.black,
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Members Details'),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Container(
            width: 330,
            height: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20),
                Row(children: [
                  Text(
                    "MEMBER NAME 1",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                ]),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                      controller: Name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                      )),
                ),
                SizedBox(height: 20),
                Row(children: [
                  Text(
                    "STUDENT ID 1",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                ]),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                      controller: StudentID,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                      )),
                ),
                SizedBox(height: 20),
                Row(children: [
                  Text(
                    "MEMBER NAME 2",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                ]),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                      controller: Phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                      )),
                ),
                SizedBox(height: 20),
                Row(children: [
                  Text(
                    "STUDENT ID 2",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                ]),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                      controller: Email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                      )),
                ),
                SizedBox(height: 20),
                Row(children: [
                  Text(
                    "MEMBER NAME 3",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                ]),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                      controller: UniversityName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                      )),
                ),
                SizedBox(height: 20),
                Row(children: [
                  Text(
                    "STUDENT ID 3",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                ]),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                      controller: Year,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                      )),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DummyScreen()),
                    );
                  },
                )
              ],
            ),
          ),
        )));
  }
}
