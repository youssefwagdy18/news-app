import 'package:flutter/material.dart';
import 'package:news_app/news/news_details.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/model/news_response.dart';
import '../../model/source_response.dart';
import '../api_manager/news_api_manager.dart';
import '../config/my_theme.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

ScrollController scrollController = ScrollController();

class _NewsWidgetState extends State<NewsWidget> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: NewsApiManager.getSourcesDetails(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categoryDetails = snapshot.data?.articles ?? [];
          return ListView.builder(
              itemCount: categoryDetails.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, NewsDetails.routeName,
                          arguments: NewsItem(news: categoryDetails[index]));
                    },
                    child: NewsItem(news: categoryDetails[index]));
              });
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              const Text('Something went wrong please try again'),
              ElevatedButton(
                  onPressed: () {
                    NewsApiManager.getSourcesDetails(widget.source.id ?? '');
                    setState(() {});
                  },
                  child: const Text('Try again'))
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: MyTheme.primaryLightColor,
            value: 15,
          ),
        );
      },
    );
  }
}

