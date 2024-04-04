import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/categoryDM.dart';

class CategoryFrag extends StatelessWidget {
  var categories = CategoryDM.getCategories();
  Function onCategoryClick;
  CategoryFrag({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.all(25),
          child: Text('Pick your category \nof interest'
            ,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
        ),
        ),
        Expanded(
          child: GridView.builder(gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
          ),
            itemBuilder: (BuildContext context, int index) {
            return InkWell(onTap: (){
              onCategoryClick(categories[index]);
            },
                child: CategoryItem(category: categories[index], index: index));
          },
            itemCount: categories.length,
          ),
        )
      ],
    );

  }
}
