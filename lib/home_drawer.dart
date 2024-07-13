// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  Function onSideDrawerClick;
  static const int onCategoryClick=1;
  static const int onSettingClick=2;
  HomeDrawer({super.key, required this.onSideDrawerClick});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:  Text(AppLocalizations.of(context)!.news_app),
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.
        copyWith(color: Colors.white)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            InkWell(
              onTap: (){
               onSideDrawerClick(onCategoryClick);
              },
              child: Row(
                children: [
                  Icon(Icons.list,size: MediaQuery.of(context).size.height*0.05),
                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                  Text(AppLocalizations.of(context)!.categories,
                    style: Theme.of(context).textTheme.titleMedium!.
                    copyWith(fontSize: 20),),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            InkWell(
              onTap: (){
                onSideDrawerClick(onSettingClick);
              },
              child: Row(
                children: [
                  Icon(Icons.settings,size: MediaQuery.of(context).size.height*0.05),
                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                  Text(AppLocalizations.of(context)!.settings,
                      style: Theme.of(context).textTheme.titleMedium!.
                      copyWith(fontSize: 20)),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
