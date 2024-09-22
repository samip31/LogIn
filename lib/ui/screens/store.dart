import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebse/extracts/extracted.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
class Store extends StatefulWidget {


  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Headings("        Welcome to \n        Khata Book !"),

            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              theme== ThemeData.dark()?Colors.grey:Colors.purpleAccent,
              theme== ThemeData.dark()?Color(0xff312A77):Colors.lightBlueAccent,


              theme== ThemeData.dark()?Color(0xff312A77):Colors.deepPurpleAccent,

              theme== ThemeData.dark()?Colors.black:Colors.purpleAccent,

            ],
          )
      ),

              child: Text("Your trusted Record keeping App to make your life easier.\n"
                  "Add the details of creditors who owe you money and be relieved. "
                  "We are here to keep track of every Rupee you are owed\n\n"
                  "See the list of creditors' details you already added by clicking on 👥 \n\n"
                  "Add the creditors' details by simply clicking on  '+'\n \n"
                  "Click on Settings menu for further more."
                  ,style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  )
           ),
            ),

          ],

        ),
      ),
    );
  }


  }

