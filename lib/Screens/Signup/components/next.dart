import 'package:flutter/material.dart';
import 'package:sabti/Screens/Signup/components/body.dart';

import '../../../constants.dart';
import '../signup_screen.dart';

class Next extends StatefulWidget {
  @override
  _nextState createState() => _nextState();
}

class _nextState extends State<Next> {
  String txt = '';
  String role;
  @override
  Widget build(BuildContext context) {
    var icon;
    double width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0, left: 20),
                child: Material(
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: kPrimaryColor),
                      width: (MediaQuery.of(context).size.width),
                      height: 300,
                      child: Center(
                          child: Text(
                        "فلاح",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpScreen(role = "fallah")));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0, left: 20),
                child: Material(
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: kPrimaryColor),
                      width: (MediaQuery.of(context).size.width),
                      height: 300,
                      child: Center(
                          child: Text(
                        "شاري",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      )),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignUpScreen(role = "client")));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
