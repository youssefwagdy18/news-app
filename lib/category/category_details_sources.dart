// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/category/categoryDM.dart';
import 'package:news_app/category/bloc/category_view_model.dart';
import 'package:news_app/category/bloc/states.dart';
import 'package:news_app/tab/tab_widget.dart';

class CategoryDetailsSources extends StatefulWidget {
  static const String routeName = 'category_list';
  CategoryDM category;
  CategoryDetailsSources({super.key, required this.category});

  @override
  State<CategoryDetailsSources> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoryDetailsSources> {
  CategoryViewModel viewModel = CategoryViewModel();

  @override
  void initState() {
    viewModel.getSources(widget.category.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryViewModel, CategoryStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryErrorState) {
            return Column(
              children: [
                Text(state.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.categoryId);
                    },
                    child: const Text('try again'))
              ],
            );
          }else if(state is CategorySuccessState){
            return TabWidget(sourceList: state.sourceList!);
          }
          return Container();
        });
    // return ChangeNotifierProvider(
    //   create: (context) => viewModel,
    //   child: Consumer<CategoryViewModel>(
    //       builder: (context, viewmodel, child) {
    //         if (viewModel.errorMessage != null) {
    //           return Column(
    //             children: [
    //               Text(viewModel.errorMessage!),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     viewModel.getSources(widget.category.categoryId);
    //                   },
    //                   child: Text('try again'))
    //             ],
    //           );
    //         }
    //         else if (viewModel.sourceList == null) {
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         } else {
    //           return TabWidget(sourceList: viewModel.sourceList ?? []);
    //         }
    //       }
    //   ),
    // );
  }
}
// /*
// https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
//
//  */
