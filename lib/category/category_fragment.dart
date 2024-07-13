import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/category/categoryDM.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryFrag extends StatelessWidget {
  final categories = CategoryDM.getCategories();
  final Function onCategoryClick;
  CategoryFrag({super.key, required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.all(25),
          child: Text(AppLocalizations.of(context)!.pick_your_category_of_interest
            ,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
        ),
        ),
        Expanded(
          child: GridView.builder(gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
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
