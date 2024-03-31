import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

import '../model/source_response.dart';

class TabItem extends StatelessWidget {

bool isSelected;
Source source;
TabItem({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 2,
        color: MyTheme.primaryLightColor),
        color: isSelected ? MyTheme.primaryLightColor : Colors.transparent
      ),
      child: Text(source.name??'',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: isSelected? MyTheme.primaryLightColor : MyTheme.whiteColor
      )),
    );
  }
}
