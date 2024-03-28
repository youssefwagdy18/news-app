import 'package:flutter/material.dart';

class MyTheme{
  static const Color primaryLightColor=  Color(0xff39A552);
  static const Color whiteColor= Color(0xffFFFFFF);
  static const Color blackColor= Color(0xff303030);
  static ThemeData lightMode =ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
      appBarTheme:const AppBarTheme(
        backgroundColor: MyTheme.primaryLightColor,
          centerTitle: true,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)
            ),
          )
      ),
    textTheme:  const TextTheme(
      titleLarge: TextStyle(
        color: MyTheme.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),
        titleMedium: TextStyle(
            color: blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
        titleSmall: TextStyle(
            color: blackColor,
            fontSize: 14,
            fontWeight: FontWeight.bold
        )
    ),
  );
}