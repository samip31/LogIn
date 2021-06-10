import 'package:flutter/material.dart';
import 'extracts/extracted.dart';
import 'constants.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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

                    onChange: (value) {},
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

                onChange: (value) {},
              ),
              Text(
                "Create a new password",
                style: ksubheaders,
              ),
              TextFields(
                label: "create a password",

                onChange: (value) {},
              ),
              Headings("Sign Up"),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  children: [
                    Text("Already have an account ?",style: TextStyle(
                      fontSize: 18,)),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, "logIn");

                      },
                      child: Text("Log-In",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,

                        ),),
                    ),
                  ],
              ),
               ),
            ],
          ),
        ),
      ),
    ));
  }
}
