import 'package:flutter/material.dart';
import 'package:news_app/api_manager/news_api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/config/my_theme.dart';
import 'package:news_app/news/news_details.dart';
import 'package:news_app/news/news_item.dart';

class SearchView extends SearchDelegate {

  @override
  TextStyle get searchFieldStyle => const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,

  );

  @override
  Widget buildResults(BuildContext context) {
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset(
          'assets/images/pattern.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: query.isEmpty
            ? Center(child: Text("please enter search key",style: MyTheme.lightMode.textTheme.titleMedium,))
            : FutureBuilder<NewsResponse?>(
                future: NewsApiManager.getSearch(query),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: MyTheme.primaryLightColor,
                        value: 15,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Column(
                      children: [
                        Text('Something went wrong please try again'),
                        // ElevatedButton(onPressed: (){
                        //   NewsApiManager.getSearch(query);
                        //   setState(() {
                        //
                        //   });}
                        //     , child: const Text('Try again'))
                      ],
                    );
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.status != 'ok') {
                      Column(
                        children: [
                          Text(
                            snapshot.data?.message ?? '',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          // ElevatedButton(onPressed: (){
                          //   NewsApiManager.getSearch(query);
                          //   setState(() {
                          //
                          //   });
                          // }, child: const Text('Try Again'))
                        ],
                      );
                    }
                  }
                  var categoryDetails = snapshot.data?.articles ?? [];
                  return ListView.builder(
                      itemCount: categoryDetails.length,
                      itemBuilder: (context, index) {
                        return InkWell(onTap: (){
                          Navigator.pushNamed(context,NewsDetails.routeName,
                              arguments:NewsItem(news: categoryDetails[index]));
                        },
                            child: NewsItem(news: categoryDetails[index]));
                      });
                },
              ),
      )
    ]);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset(
          'assets/images/pattern.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: query.isEmpty
            ? Center(child: Text("please enter search key",style: MyTheme.lightMode.textTheme.titleMedium,))
            : FutureBuilder<NewsResponse?>(
                future: NewsApiManager.getSearch(query),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: MyTheme.primaryLightColor,
                        value: 15,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Column(
                      children: [
                        Text('Something went wrong please try again'),
                        // ElevatedButton(onPressed: (){
                        //   NewsApiManager.getSearch(query);
                        //   setState(() {
                        //
                        //   });}
                        //     , child: const Text('Try again'))
                      ],
                    );
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.status != 'ok') {
                      Column(
                        children: [
                          Text(
                            snapshot.data?.message ?? '',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          // ElevatedButton(onPressed: (){
                          //   NewsApiManager.getSearch(query);
                          //   setState(() {
                          //
                          //   });
                          // }, child: const Text('Try Again'))
                        ],
                      );
                    }
                  }
                  var categoryDetails = snapshot.data?.articles ?? [];
                  return ListView.builder(
                      itemCount: categoryDetails.length,
                      itemBuilder: (context, index) {
                        return InkWell(onTap: (){
                          Navigator.pushNamed(context,NewsDetails.routeName,
                              arguments:NewsItem(news: categoryDetails[index]));
                        },
                            child: NewsItem(news: categoryDetails[index]));
                      });
                },
              ),
      )
    ]);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }
}
