import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/config/my_theme.dart';
import 'package:news_app/news/news_item.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  static String routeName = 'newsDetails';


  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as NewsItem;
    return Stack(
      children: [
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
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(args.news.source?.name ?? '',
                style: const TextStyle(color: MyTheme.whiteColor)),
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: args.news.urlToImage ?? '',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.fill,
                    placeholder: (context, url) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  args.news.source?.name ?? '',
                  style: MyTheme.lightMode.textTheme.titleSmall!
                      .copyWith(color: const Color(0xFF7E7E7E)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  args.news.title ?? '',
                  style: MyTheme.lightMode.textTheme.titleMedium,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(args.news.publishedAt??'',
                    style: MyTheme.lightMode.textTheme.titleSmall!
                        .copyWith(color: const Color(0xFF7E7E7E)),),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        args.news.content ?? '',
                        textScaler: const TextScaler.linear(1.5),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: (){
                              Uri url=Uri.parse(args.news.url??'');
                              _launchUrl(url);
                            },
                            child: Text("View Full Article >",
                              style: MyTheme.lightMode.textTheme.titleMedium,),
                          ))
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url,mode:LaunchMode.inAppBrowserView )) {
      throw Exception('Could not launch $url');
    }
  }
}
