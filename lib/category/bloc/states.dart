import 'package:news_app/model/source_response.dart';

abstract class CategoryStates {}
class CategoryLoadingState extends CategoryStates{}
class CategoryErrorState extends CategoryStates{
  String? errorMessage;
  CategoryErrorState({required this.errorMessage});
}
class CategorySuccessState extends CategoryStates{
  List<Source>? sourceList;
  CategorySuccessState({required this.sourceList});
}