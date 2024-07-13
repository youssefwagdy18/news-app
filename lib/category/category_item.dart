// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/category/categoryDM.dart';

class CategoryItem extends StatelessWidget {
CategoryDM category;
int index;
CategoryItem({super.key, required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,
      horizontal: 15),
      decoration: BoxDecoration(
        color: category.categoryColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25),
          topRight: const Radius.circular(25),
          bottomRight:Radius.circular(
            index %2 ==0 ?0 :25
          ),
          bottomLeft: Radius.circular(
              index %2 ==0 ?25 :0
          ),
        )
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset(category.imagePath,
          height: MediaQuery.of(context).size.height*0.13,),
        Text(category.title,style: Theme.of(context).textTheme.titleMedium!.
        copyWith(color: Colors.white ,fontSize: 20))
      ],
      )
    );
  }
}
