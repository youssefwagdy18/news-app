import 'package:flutter/material.dart';
import 'package:news_app/config/linked_index_state_managment.dart';
import 'package:news_app/news/news_widget.dart';
import 'package:news_app/tab/tab_item.dart';
import 'package:provider/provider.dart';
import '../model/source_response.dart';
class TabWidget extends StatefulWidget {

final List<Source>sourceList;

const TabWidget({super.key, required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  LinkedIndexStateManagement indexStateManagement = LinkedIndexStateManagement();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LinkedIndexStateManagement>(
      create: (context)=>indexStateManagement,
      child: DefaultTabController(
          length: widget.sourceList.length,
          child:Column(
            children: [
              TabBar(
                onTap: (index){
                  indexStateManagement.changeIndex(index);
                  setState(() {

                  });
                },isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sourceList.map((source) => TabItem(
                    source: source,
                    isSelected: indexStateManagement.index ==widget.sourceList.indexOf(source))).toList(),
              ),
              Expanded(child: NewsWidget(source:widget.sourceList[indexStateManagement.index]))
            ],
          )),
    );
  }
}
