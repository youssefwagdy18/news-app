import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api_manager/api_constants.dart';
import 'package:news_app/model/news_response.dart';

class NewsApiManager {
  static Future<NewsResponse?> getSourcesDetails(String sourceId,
      {int page = 1}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApiPath, {
      'apiKey': '9b9d6fd2aa824ef09102c5a8ab22b6e7',
      'sources': sourceId,
      'page': '$page',
      'pageSize': '20'
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var jason = jsonDecode(responseBody);
      return NewsResponse.fromJson(jason);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse?> getSearch(String q) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApiPath,
        {'apiKey': '65f67b0a275e44e1a176019908b3fea2', 'q': q});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var jason = jsonDecode(responseBody);
      return NewsResponse.fromJson(jason);
    } catch (e) {
      rethrow;
    }
  }
}
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=65f67b0a275e44e1a176019908b3fea2
