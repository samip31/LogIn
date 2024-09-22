import 'package:flutter/services.dart';

import '../extracts/extracted.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late String username;
  late String password;
  String message = "";

  FirebaseAuth _auth = FirebaseAuth.instance;

  bool load = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(

          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                theme== ThemeData.dark()?Colors.black:Color(0xFFE3F2FD),


                theme== ThemeData.dark()? Color(0xffAF1319):Colors.lightBlueAccent,
              ]
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  message=="[firebase_auth/invalid-email] The email address is badly formatted."?"Email address format is wrong":message,
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                Headings("Enter Your Account"),
                Text(
                  "Enter your e-mail",
                  style: ksubheaders,
                ),
                TextFields(
                  label: "email",
                  onChange: (value) {
                    username = value;
                  },
                ),
                Text(
                  "Enter your password",
                  style: ksubheaders,
                ),
                PasswordField(
                  label: "password",
                  onChange: (value) {
                    password = value;
                  },
                  onTap: () {
                    setState(() {
                      if (kEyeColor == Colors.blueGrey) {
                        kEyeColor = Colors.blue;
                      } else if (kEyeColor == Colors.blue) {
                        kEyeColor = Colors.blueGrey;
                      }
                    });
                  },
                ),
                GestureDetector(
                    onTap: () async {
                      setState(() {
                        load = true;
                      });
                      try {
                        var user = await _auth.signInWithEmailAndPassword(
                            email: username, password: password);
                        setState(() {
                          load = false;
                        });

                        if (user != null) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool(kLOGIN_KEY, true);
                          prefs.setString(kEMAIL_KEY, username);

                          Navigator.pushReplacementNamed(context, "splash");
                        }
                      } catch (e) {
                        message = e.toString();
                        print(e.toString());
                      }
                    },
                    child: Headings("Log In")),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("Don't have an account yet?",
                          style: kGeneral),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "register");
                        },
                        child: Text(
                          "Sign up ",
                          style: TextStyle(
                            fontSize: 18,
                            color:  theme== ThemeData.dark()?Colors.blue: Colors.purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 230,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
