import 'package:flutter/material.dart';
import 'package:news_app/api_manager/api_manager.dart';
import 'package:news_app/categoryDM.dart';
import 'package:news_app/tab/tab_widget.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';

class CategoryDetailsSources extends StatefulWidget {
  static const String routeName ='category_list';
  CategoryDM category;
  CategoryDetailsSources({super.key, required this.category});

  @override
  State<CategoryDetailsSources> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoryDetailsSources> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
                future: ApiManager.getSources(widget.category.categoryId),
                builder: (context ,snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: MyTheme.primaryLightColor,
                      ),
                    );
                  }
                  else if (snapshot.hasData) {
                    if (snapshot.data!.status != 'ok') {
                      return Column(
                        children: [
                          Text(snapshot.data!.message!),
                          ElevatedButton(onPressed: () {
                            ApiManager.getSources(widget.category.categoryId);
                            setState(() {

                            });
                          },
                              child: const Text('try again'))
                        ],
                      );
                    }
                  }
                  else if (snapshot.hasError) {
                    return Column(
                      children: [
                        const Text('Something went wrong'),
                        ElevatedButton(onPressed: () {
                          ApiManager.getSources(widget.category.categoryId);
                          setState(() {

                          });
                        },
                            child: const Text('try again'))
                      ],
                    );
                  }
                  var sourcesList = snapshot.data?.sources??[];
                  return TabWidget(sourceList:sourcesList);
                }
    );
  }
}
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

 */