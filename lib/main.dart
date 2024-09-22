import 'package:firebse/ui/log%20in.dart';
import 'package:firebse/ui/register.dart';
import 'package:firebse/ui/screens/dashboard.dart';
import 'package:firebse/ui/screens/test.dart';
import 'package:firebse/ui/screens/test2.dart';
import 'package:firebse/ui/splashscreen.dart';

import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(),

      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "splash": (context)=> SplashScreen(),
        "logIn": (context)=> LogIn(),
        "register": (context)=> Register(),
        "home": (context)=> TestScreen2(),
      },
    );
  }
}
