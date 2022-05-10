import 'package:e_commerce_apps/common/styles/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

ThemeData tdMain(BuildContext context) => ThemeData(
  primarySwatch: mBlack,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.montserratTextTheme(
    Theme.of(context).textTheme,
  ),
  primaryColor: Colors.black,
  primaryColorDark: Colors.black,
  primaryTextTheme: const TextTheme(headline6: TextStyle(color: Colors.black)),
  dividerColor: Colors.grey,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black),
    hintStyle: TextStyle(color: Colors.grey),
    hoverColor: Colors.grey,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
);