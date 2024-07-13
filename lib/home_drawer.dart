import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  Function onSideDrawerClick;
  static const int onCategoryClick=1;
  static const int onSettingClick=2;
  HomeDrawer({required this.onSideDrawerClick});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('News App'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.
        copyWith(color: Colors.white)),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          InkWell(
            onTap: (){
             onSideDrawerClick(onCategoryClick);
            },
            child: Row(
              children: [
                Icon(Icons.list,size: MediaQuery.of(context).size.height*0.05),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Categories',
                    style: Theme.of(context).textTheme.titleMedium!.
                    copyWith(fontSize: 20),),
                ),
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Settings',
                      style: Theme.of(context).textTheme.titleMedium!.
                      copyWith(fontSize: 20)),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
