import 'package:news_app/model/news_response.dart';

 class NewsStates{}
class NewsErrorState extends NewsStates{
  String? errorMessage;
  NewsErrorState({required this.errorMessage});
}
class NewsLoadingState extends NewsStates{}
class NewsSuccessState extends NewsStates{
  List<Article>? newsList;
  NewsSuccessState({required this.newsList});
}