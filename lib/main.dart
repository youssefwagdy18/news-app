import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/my_theme.dart';

import 'category/category_details_sources.dart';


void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context)=> HomeScreen()
      },
   theme: MyTheme.lightMode,
    );

  }
}
