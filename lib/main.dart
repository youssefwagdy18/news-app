import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/my_theme.dart';

import 'category/category_details.dart';


void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      initialRoute: CategoryDetails.routName,
      routes: {
        CategoryDetails.routName :(context)=> const CategoryDetails(),
      },
   theme: MyTheme.lightMode,
    );

  }
}
