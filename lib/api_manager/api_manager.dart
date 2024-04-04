import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api_manager/api_constants.dart';
import 'package:news_app/model/source_response.dart';

class ApiManager{
 static Future<SourceResponse?> getSources(String categoryId)async{
   Uri url =Uri.https(ApiConstants.baseUrl ,ApiConstants.apiPath ,
   {
     'apiKey' : '65f67b0a275e44e1a176019908b3fea2' ,
     'category' : categoryId
   });
   try {
     var response = await http.get(url);
     var responseBody = response.body;
     var jason = jsonDecode(responseBody);
     return SourceResponse.fromJson(jason);
   }catch(e){
     throw e;
   }
 }
}