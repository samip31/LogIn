import 'package:flutter/material.dart';
import 'package:firebse/constants.dart';

class TextFields extends StatelessWidget {
  final Function(String)? onChange;
  final String label;


  TextFields({
    this.onChange,
    required this.label,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
      child: TextField(
        style:
        TextStyle(
          fontSize: 18,
          color: theme == ThemeData.dark()?Colors.white : Colors.black,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          // suffixIcon: Icon(Icons.add),

          labelText: label,


          labelStyle:
          TextStyle(
            fontSize: 18,
            color: theme == ThemeData.dark()?Colors.white : Colors.black,
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}

class Headings extends StatelessWidget {
  final String registers;

  Headings(this.registers);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              theme== ThemeData.dark()?Colors.black:Colors.purpleAccent,




              theme== ThemeData.dark()?Color(0xff312A77):Colors.deepPurpleAccent,
              theme== ThemeData.dark()?Color(0xff312A77):Colors.lightBlueAccent,

              theme== ThemeData.dark()?Colors.grey:Colors.purpleAccent,

            ],
          )
      ),
      child: Text(registers, style: kheaders),
    );
  }
}

class PasswordField extends StatelessWidget {
  final Function(String)? onChange;
  final String label;

  final Function()? onTap;

PasswordField({required this.label,this.onChange,this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
      child: TextField(
        obscureText: kEyeColor==Colors.blue?false:showPassword,
        style:
        TextStyle(
          fontSize: 18,
          color: theme == ThemeData.dark()?Colors.white : Colors.black,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: GestureDetector(
            onTap:onTap,
            child:  Icon(Icons.remove_red_eye,
              color: kEyeColor,),


          ),

          labelText: label,



          labelStyle:
          TextStyle(
            fontSize: 18,
            color: theme == ThemeData.dark()?Colors.white : Colors.black,
          ),
        ),
        onChanged:onChange ,
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  final Icon icons;
  final Color color;
  final Function()? onPress;
  BottomContainer({required this.icons,this.onPress,required this.color});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: icons,





        ),



    );
  }
}
class NumberFields extends StatelessWidget {
  final Function(String)? onChange;
  final String label;


  NumberFields({
    this.onChange,
    required this.label,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
      child: TextField(
        style:TextStyle(
          fontSize: 18,
          color: theme == ThemeData.dark()?Colors.white : Colors.black,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          // suffixIcon: Icon(Icons.add),

          hintText: label,


          hintStyle:
          TextStyle(
            fontSize: 18,
            color: theme == ThemeData.dark()?Colors.white : Colors.black,
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
class HintTextFields extends StatelessWidget {
  final Function(String)? onChange;

  final String hint;


  HintTextFields({
    required this.hint, this.onChange,



  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
      child: TextField(
        style: TextStyle(
          fontSize: 18,
          color: theme == ThemeData.dark()?Colors.white : Colors.black,
        ),

        decoration: InputDecoration(
          border: OutlineInputBorder(),
          // suffixIcon: Icon(Icons.add),


          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 18,
            color: theme == ThemeData.dark()?Colors.white : Colors.black,
          ),


          labelStyle: TextStyle(
            fontSize: 18,
            color: theme == ThemeData.dark()?Colors.white : Colors.black,
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}



