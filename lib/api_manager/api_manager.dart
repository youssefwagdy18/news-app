import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api_manager/api_constants.dart';
import 'package:news_app/model/source_response.dart';

class ApiManager{
 static Future<SourceResponse?> getSources(String categoryId)async{
   Uri url =Uri.https(ApiConstants.baseUrl ,ApiConstants.apiPath ,
   {
     'apiKey' : '9b9d6fd2aa824ef09102c5a8ab22b6e7' ,
     'category' : categoryId
   });
   try {
     var response = await http.get(url);
     var responseBody = response.body;
     var jason = jsonDecode(responseBody);
     return SourceResponse.fromJson(jason);
   }catch(e){
     rethrow;
   }
 }

}