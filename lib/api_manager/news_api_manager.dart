import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:news_app/api_manager/api_constants.dart';
import 'package:news_app/model/news_response.dart';
class NewsApiManager{
 static Future<NewsResponse?> getSourcesDetails(String sourceId)async{
   Uri url = Uri.https(ApiConstants.baseUrl ,ApiConstants.newsApiPath ,
   {
     'apiKey' : '65f67b0a275e44e1a176019908b3fea2' ,
     'sources' : sourceId
   });
   try {
     var response = await http.get(url);
     var responseBody = response.body;
     var jason = jsonDecode(responseBody);
     return NewsResponse.fromJson(jason);
   }
   catch(e){
     rethrow;
   }

 }

}
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=65f67b0a275e44e1a176019908b3fea2