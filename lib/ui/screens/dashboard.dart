import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebse/ui/screens/addScreen.dart';
import 'package:firebse/ui/screens/home.dart';
import 'package:firebse/ui/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:firebse/constants.dart';
import 'package:firebse/extracts/extracted.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'store.dart';


enum pictures { home, add, store, setting }

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  void initState() {

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
        theme = ThemeData.dark();


      }

    });



  }


  // FirebaseFirestore _store = FirebaseFirestore.instance;

  @override

  pictures selectedPic = pictures.store;

FirebaseFirestore _store = FirebaseFirestore.instance;
  late DateTime _dateTime = DateTime.now() ;
  late String creditorName;
  late String product;
  late String number;
  late String quantity;
  late String rate;
  late String paidAmount;




  getScreen() {
    if (selectedPic == pictures.home) {
      return Home();
    } else if (selectedPic == pictures.setting) {
      return SettingPage(onTapDark: ()async{

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(kTheme_Value, "dark");
          getUserPref();



        },
        onTapLight: ()async{

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(kTheme_Value, "light");
          getUserPref();


      },

      );
    } else if (selectedPic == pictures.add) {

      return Group(
        onChangeDate: (){

              showDatePicker(context: context,
                  initialDate:DateTime.now(),
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2022))
                  .then((date){
                setState(() {

                  _dateTime = date!;

                });
              });


        },

        onChangeName: (value){
          creditorName = value;


        },
        onChangeNum: (value){
          number = value;

        },
        onChangeRate: (value){
          rate = value ;

        },
        onChangeProduct: (value){
          product = value ;

        },
        onChangeQuantity: (value){
          quantity = value;

        },
        onChangePaidAmount: (value){
          paidAmount = value ;

        },
        onTap:
            ()async{
        _store.collection("creditors").add({
          "date": _dateTime.toString(),
          "number": number,
          "rate": rate,
          "quantity": quantity,
          "paidAmount": paidAmount,
          "product": product,

          "creditorName": creditorName,
          "hasPaid": false
        });

        setState(() {
          selectedPic = pictures.home;

        });


      },
             );
    } else if (selectedPic == pictures.store) {
      return Store();
    }
  }
  getTitle() {
    if (selectedPic == pictures.home) {
      return "List Of Creditors";
    } else if (selectedPic == pictures.setting) {
      return "Settings";
    } else if (selectedPic == pictures.add) {
      return "Add Creditors Name";
    } else if (selectedPic == pictures.store) {
      return "KhataBook";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(getTitle()),
        centerTitle: true,
        backgroundColor:  theme== ThemeData.dark()? Color(0xFF340406):Colors.lightBlueAccent,



      ),

      // backgroundColor: Color.fromRGBO(190, 161, 255,  100),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomContainer(
                  icons: Icon(
                    Icons.book,
                    size: 30,
                    color: Colors.white,
                  ),
                  color: selectedPic == pictures.store
                      ? Colors.blue
                      : Colors.transparent,
                  onPress: () {
                    setState(() {
                      selectedPic = pictures.store;
                    });
                  },
                ),

                BottomContainer(
                  icons: Icon(
                    Icons.people,
                    size: 30,
                    color: Colors.white,
                  ),
                  color: selectedPic == pictures.home
                      ? Colors.blue
                      : Colors.transparent,
                  onPress: () {
                    setState(() {
                      selectedPic = pictures.home;
                    });
                  },
                ),
                BottomContainer(
                  icons: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  color: selectedPic == pictures.add
                      ? Colors.blue
                      : Colors.transparent,
                  onPress: () {
                    setState(() {
                      selectedPic = pictures.add;
                    });
                  },
                ),
                BottomContainer(
                  icons: Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.white,
                  ),
                  color: selectedPic == pictures.setting
                      ? Colors.blue
                      : Colors.transparent,
                  onPress: () {
                    setState(() {
                      selectedPic = pictures.setting;
                    });
                  },
                ),

              ],
            ),
          )),
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
    child:SafeArea(child:getScreen(),
      ),
    )
    );
  }
}
