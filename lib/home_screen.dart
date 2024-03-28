import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routName ='Home Screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset('assets/images/pattern.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('News',
            style: Theme.of(context).textTheme.titleLarge,),
          ),
        )
      ],
    );
  }
}
