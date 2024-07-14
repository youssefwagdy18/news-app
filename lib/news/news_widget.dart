import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/bloc/news_view_model.dart';
import 'package:news_app/news/bloc/states.dart';
import 'package:news_app/news/news_details.dart';
import 'package:news_app/news/news_item.dart';
import '../../model/source_response.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

ScrollController scrollController = ScrollController();

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getNewsSources(widget.source.id??'');
   return BlocBuilder<NewsViewModel, NewsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Center(child: CircularProgressIndicator(),);
        } else if (state is NewsErrorState) {
          return Column(
            children: [
              Text('${state.errorMessage}'),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsSources(widget.source.id??'');
                  },
                  child: const Text('Try again'))
            ],
          );
        } else if (state is NewsSuccessState) {
          return ListView.builder(
              itemCount: state.newsList!.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, NewsDetails.routeName,
                          arguments: NewsItem(news: state.newsList![index]));
                    },
                    child: NewsItem(news: state.newsList![index]));
              });
        }
        return Container();
      },
    );
  }
}

//return FutureBuilder<NewsResponse?>(
//       future: NewsApiManager.getSourcesDetails(widget.source.id ?? ''),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           var categoryDetails = snapshot.data?.articles ?? [];
//           return ListView.builder(
//               itemCount: categoryDetails.length,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                     onTap: () {
//                       Navigator.pushNamed(context, NewsDetails.routeName,
//                           arguments: NewsItem(news: categoryDetails[index]));
//                     },
//                     child: NewsItem(news: categoryDetails[index]));
//               });
//         }
//         if (snapshot.hasError) {
//           return Column(
//             children: [
//               const Text('Something went wrong please try again'),
//               ElevatedButton(
//                   onPressed: () {
//                     NewsApiManager.getSourcesDetails(widget.source.id ?? '');
//                     setState(() {});
//                   },
//                   child: const Text('Try again'))
//             ],
//           );
//         }
//         return const Center(
//           child: CircularProgressIndicator(
//             color: MyTheme.primaryLightColor,
//             value: 15,
//           ),
//         );
//       },
//     );
