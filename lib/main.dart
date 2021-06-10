import 'package:firebse/log%20in.dart';
import 'package:firebse/register.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';


void main() async{


  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "logIn",
      routes: {
        "logIn": (context)=> LogIn(),
        "register": (context)=> Register(),
      },
    );
  }
}
