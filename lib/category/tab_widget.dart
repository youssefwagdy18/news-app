import 'package:flutter/material.dart';
import 'package:news_app/category/tab_item.dart';
import '../model/source_response.dart';
class Tabs extends StatelessWidget {

List<Source>sourceList;
Tabs({required this.sourceList});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child:TabBar(
          tabs: [
            TabItem(source: sourceList[0] , isSelected: true),
            TabItem(source: sourceList[1], isSelected: true)
          ],
        ));
  }
}
