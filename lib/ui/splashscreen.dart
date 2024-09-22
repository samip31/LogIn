import 'package:flutter/material.dart';
import 'package:firebse/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    checkUserState();
    getUserPref();
    // TODO: implement initState
    super.initState();
  }

  getUserPref()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeData = prefs.getString(kTheme_Value) ?? "light";
    setState(() {

      if (themeData == "light"){
        theme = ThemeData();
      }
      else  if (themeData == "dark"){
        theme = ThemeData.dark().copyWith(

        );
      }

    });



  }

  void checkUserState()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? userlogin = prefs.getBool(kLOGIN_KEY);

    if(userlogin!=null) {
      if (userlogin) {
        Navigator.pushReplacementNamed(context, "home");
      }
      else {
        Navigator.pushReplacementNamed(context, "logIn");
      }
    }
    else if (userlogin! == null){
      Navigator.pushReplacementNamed(context, "logIn");

    }


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          value: 40,
        ),
      ),
    );
  }
}
