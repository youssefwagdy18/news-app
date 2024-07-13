import 'package:flutter/material.dart';
import 'package:news_app/category/category_details_sources.dart';
import 'package:news_app/category/category_fragment.dart';
import 'package:news_app/category/categoryDM.dart';
import 'package:news_app/config/my_theme.dart';
import 'package:news_app/news/search_view.dart';
import 'package:news_app/setting_tab/setting_drawer_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {
static const String routeName ='home_screen';

  const HomeScreen({super.key});


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
      actions: [
        if(selectedCategory!=null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(onPressed: (){
              showSearch(context: context, delegate: SearchView());
            },
            icon: Icon(Icons.search,size: MediaQuery.of(context).size.height*0.04,),),)
        
      ],
      iconTheme: const IconThemeData(color: Colors.white),
    title: Text( selectedCategoryDrawer == HomeDrawer.onSettingClick ?
        AppLocalizations.of(context)!.settings:
      selectedCategory==null ?
    AppLocalizations.of(context)!.news_app:
      selectedCategory!.title,

    style: Theme.of(context).textTheme.titleLarge,),),
      body: selectedCategoryDrawer == HomeDrawer.onSettingClick ?
          const SettingDrawerTab():
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
