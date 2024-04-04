import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

import '../model/source_response.dart';

class TabItem extends StatelessWidget {

final bool isSelected;
final Source source;
const TabItem({super.key, required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 15,horizontal:3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 2,
        color: MyTheme.primaryLightColor),
        color: isSelected ? MyTheme.primaryLightColor : Colors.transparent
      ),
      child: Text(source.name??'',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: isSelected? MyTheme.whiteColor : MyTheme.primaryLightColor
      )),
    );
  }
}
