import 'package:dev_procom_day_registration_system/SelectOperation.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController StudentID = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, // Set the icon color here
          ),
          backgroundColor: Colors.black,
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Login Into Account'),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        body: SingleChildScrollView(
            child: Container(
          // height: 670,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/mainscr.jpg"),
              Container(
                  width: 300,
                  height: 330,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 20),
                        Row(children: [
                          Text(
                            "Student ID",
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
                            "Password",
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
                              controller: Password,
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
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectOperation()),
                            );
                          },
                        )
                      ])),
            ],
          ),
        )));
  }
}
