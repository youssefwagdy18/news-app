import 'package:flutter/material.dart';
import 'package:news_app/api_manager/api_manager.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/my_theme.dart';

class CategoryDetails extends StatefulWidget {
  static const String routName ='category_list';

  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset('assets/images/pattern.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('News',
                style: Theme.of(context).textTheme.titleLarge,),
            ),
            body: FutureBuilder<SourceResponse?>(
                future: ApiManager.getSources(),
                builder: (context ,snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: MyTheme.primaryLightColor,
                      ),
                    );
                  }
                  else if (snapshot.hasData) {
                    if (snapshot.data!.status != 'ok') {
                      return Column(
                        children: [
                          Text(snapshot.data!.message!),
                          ElevatedButton(onPressed: () {
                            ApiManager.getSources();
                            setState(() {

                            });
                          },
                              child: Text('try again'))
                        ],
                      );
                    }
                  }
                  else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text('Something went wrong'),
                        ElevatedButton(onPressed: () {
                          ApiManager.getSources();
                          setState(() {

                          });
                        },
                            child: Text('try again'))
                      ],
                    );
                  }
                  var sourcesList = snapshot.data?.sources??[];
                  return ListView.builder(itemBuilder: (context, index) {
                    return Text(sourcesList[index].name!);

                  },
                    itemCount: sourcesList.length,
                  );
                }
            )

        )
      ],
    );
  }
}
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

 */