// ignore: unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api_manager/news_api_manager.dart';
import 'package:news_app/news/bloc/states.dart';

class NewsViewModel extends Cubit<NewsStates>{
  NewsViewModel():super(NewsLoadingState()) ;

  getNewsSources(String sourceId)async{
    try{
      emit(NewsLoadingState());
      var response =await NewsApiManager.getSourcesDetails(sourceId);
      if(response?.status !='ok'){
        emit(NewsErrorState(errorMessage: response!.message));
        return;
      }else if(response!.status =='ok'){
        emit(NewsSuccessState(newsList: response.articles));
        return;
      }
    }catch(e){
      NewsErrorState(errorMessage: e.toString());
    }
  }

}