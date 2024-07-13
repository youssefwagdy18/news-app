import 'package:flutter/material.dart';
import 'package:news_app/category/category_details_sources.dart';
import 'package:news_app/category/category_fragment.dart';
import 'package:news_app/categoryDM.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/setting_drawer_tab.dart';

import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {
static const String routeName ='home_screen';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      iconTheme: const IconThemeData(color: Colors.white),
    title: Text( selectedCategoryDrawer == HomeDrawer.onSettingClick ?
        'Setting':
      selectedCategory==null ?
    'News App':
      selectedCategory!.title,

    style: Theme.of(context).textTheme.titleLarge,),),
      body: selectedCategoryDrawer == HomeDrawer.onSettingClick ?
          SettingDrawerTab():
      selectedCategory==null ?
      CategoryFrag(onCategoryClick: onCategoryClick ,):
      CategoryDetailsSources(category: selectedCategory!),

      drawer:  Drawer(
        child: HomeDrawer(onSideDrawerClick:onSelectedMenuItem ),
      ),
    ),
      ]
    );
  }

  CategoryDM? selectedCategory;

  void onCategoryClick(CategoryDM newSelectedCategory){
    selectedCategory=newSelectedCategory;
    setState(() {

    });
  }

  int selectedCategoryDrawer = HomeDrawer.onCategoryClick;
  void onSelectedMenuItem(int newSelectedDrawerClick){
    selectedCategoryDrawer=newSelectedDrawerClick;
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
