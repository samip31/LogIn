import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebse/constants.dart';
import 'package:firebse/ui/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebse/extracts/extracted.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  final Function() onTapLight;
  final Function() onTapDark;

  SettingPage({required this.onTapLight, required this.onTapDark});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool load = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Text(
                "Choose a theme",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color:
                      theme == ThemeData.dark() ? Colors.white : Colors.black,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: widget.onTapDark,
                    child: Headings("Blood 🩸 "),
                  ),
                  GestureDetector(
                  onTap: widget.onTapLight,
                    child: Headings("Water 💧"),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () async {
              setState(() {
                load = true;
              });
              try {
                await auth.signOut();
                setState(() {
                  load = false;
                });


                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool(kLOGIN_KEY, false);

                  Navigator.pushReplacementNamed(context, "splash");

              } catch (e) {
                print(e.toString());
              }
            },
            child: Headings("Log Out"),
          ),
        ],
      ),
    );
  }
}
