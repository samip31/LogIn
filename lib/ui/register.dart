import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../extracts/extracted.dart';
import '../constants.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String username;
  late String password;
  late  String firstName ;

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Headings("Register"),
                    Row(
                      children: [
                        Expanded(
                            child: TextFields(
                          label: "First Name",

                          onChange: (value) {
                            firstName = value;
                          },
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextFields(
                          label: "Last Name",

                          onChange: (value) {},
                        ))
                      ],
                    ),
                    Text(
                      "Enter your phone number",
                      style: ksubheaders,
                    ),
                    TextFields(
                      label: "phone:",

                      onChange: (value) {},
                    ),
                    Text(
                      "Enter your e-mail address",
                      style: ksubheaders,
                    ),
                    TextFields(
                      label: "e-mail",

                      onChange: (value) {
                        username= value;
                      },
                    ),
                    Text(
                      "Create a new password ",
                      style: ksubheaders,
                    ),
                    PasswordField(label: "password (at least 6 characters)",onChange: (value){
                      password = value;
                    },
                    onTap: (){
                      setState(() {
                        if(kEyeColor == Colors.blueGrey){
                          kEyeColor = Colors.blue;
                        }
                        else if(kEyeColor == Colors.blue){
                          kEyeColor = Colors.blueGrey;
                        }

                      });
                    },),
                    GestureDetector(
                        onTap: () async{
                          setState(() {
                            load=true;
                          });
                          try{

                            var user = await _auth.createUserWithEmailAndPassword(email: username, password: password,);

                            setState(() {
                              load=false;
                            });

                            if(user!=null){
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool(kLOGIN_KEY, true);
                              prefs.setString(kEnteredName, firstName);
                              prefs.setString(kEMAIL_KEY, username);
                              Navigator.pushReplacementNamed(context, "home");
                            }

                          }
                          catch(e){
                            print(e.toString());
                          }



                        },
                        child: Headings(load?"Loading.. ":"Sign Up")),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                        children: [
                          Text("Already have an account ?",style: TextStyle(
                            fontSize: 18,
                            color:  theme== ThemeData.dark()?Colors.white: Colors.black,)),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, "logIn");

                            },
                            child: Text("Log-In",
                              style: TextStyle(
                                fontSize: 18,
                                color:  theme== ThemeData.dark()?Colors.blue: Colors.purple,

                              ),),
                          ),
                        ],
                    ),
                     ),
                    SizedBox(height: 70,)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
