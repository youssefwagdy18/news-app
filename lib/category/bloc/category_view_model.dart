import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api_manager/api_manager.dart';
import 'package:news_app/category/bloc/states.dart';

class CategoryViewModel extends Cubit<CategoryStates>{
  CategoryViewModel() :super(CategoryLoadingState());
  getSources(String categoryId)async{
    try{
      emit(CategoryLoadingState());
      var response = await ApiManager.getSources(categoryId);
      if(response?.status =='ok'){
        emit(CategorySuccessState(sourceList: response!.sources));
      }else if(response!.status =='error'){
        emit(CategoryErrorState(errorMessage: response.message));
      }
    }catch(e){
      emit(CategoryErrorState(errorMessage: e.toString()));
    }
  }
  }