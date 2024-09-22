import 'package:flutter/material.dart';

const kLOGIN_KEY = "login_value";
const kEnteredName = "name_value";
const kEMAIL_KEY = "email_value";
const kTheme_Value = "theme_value";

ThemeData theme = ThemeData();

Color kEyeColor = Colors.blueGrey;
Color kBottomNavColor = Colors.transparent;

bool showPassword = true;

const TextStyle kheaders =
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);



TextStyle ksubheaders = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25,
  color: theme == ThemeData.dark() ? Colors.white : Colors.black,
);

TextStyle kGeneral = TextStyle(
  fontSize: 20,
  color: theme == ThemeData.dark() ? Colors.white : Colors.black,
);
