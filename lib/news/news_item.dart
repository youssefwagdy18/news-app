import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
final Article news;
const NewsItem({super.key, required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(imageUrl: news.urlToImage??'',
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.3,
              fit: BoxFit.fill,
              placeholder: (context ,url){
              return const Center(child: CircularProgressIndicator());
              },
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ) ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  child: Text(news.author??'',style: Theme.of(context).textTheme.titleSmall?.
                  copyWith(fontWeight: FontWeight.w300)),
                ),
              ),
            ],
          ),
          Text(news.title??'',style: Theme.of(context).textTheme.titleMedium,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(news.publishedAt??'',style: Theme.of(context).textTheme.titleSmall),
            ],
          )
        ],
      ),
    );
  }
}
