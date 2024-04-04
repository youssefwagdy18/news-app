import 'package:flutter/material.dart';
import 'package:news_app/news/news_widget.dart';
import 'package:news_app/tab/tab_item.dart';
import '../model/source_response.dart';
class TabWidget extends StatefulWidget {

final List<Source>sourceList;

const TabWidget({super.key, required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child:Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex=index;
                setState(() {

                });
              },isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourceList.map((source) => TabItem(
                  source: source,
                  isSelected: selectedIndex ==widget.sourceList.indexOf(source))).toList(),
            ),
            Expanded(child: NewsWidget(source:widget.sourceList[selectedIndex]))
          ],
        ));
  }
}
