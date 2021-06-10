import 'package:flutter/services.dart';

import 'extracts/extracted.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                height: 20,
              ),
              Headings("Enter Your Account"),
              Text("Enter your e-mail",style: ksubheaders,),
              TextFields(label: "email",onChange: (value){

              },),
              Text("Enter your password",style: ksubheaders,),
              TextFields(label: "password", onChange: (value){

              },),
              Headings("Log In"),

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("Don't have an account yet?",style: TextStyle(
                      fontSize: 18,)),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, "register");

                      },
                      child: Text("Sign up ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,

                      ),),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),

    );
  }
}
