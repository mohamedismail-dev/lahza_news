import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lahza_news/api/api_constans.dart';
import 'package:lahza_news/api/end_points.dart';
import 'package:lahza_news/model/news_response.dart';
import 'package:lahza_news/model/source_response.dart';

class ApiManager {
  // API Sources
  // https://newsapi.org/v2/top-headlines/sources?apiKey=ce35e3faa1c841748522eb6298140293

  static Future<SourceResponse> getSources(
    String categoryId,
    String lang,
  ) async {
    // TODO: implement getSources

    try {
      Uri url = Uri.https(ApiConstans.baseUrl, EndPoints.sourceApi, {
        'apiKey': ApiConstans.apiKey,
        'language': 'lang',
        'category': categoryId,
      });
      var response = await http.get(url);

      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
// API News
// https://newsapi.org/v2/everything?q=bitcoin&apiKey=ce35e3faa1c841748522eb6298140293

Future<NewsResponse> getNewsBySourceId(String sourceId, String lang) async {
  // TODO: implement getNews
  try {
    Uri url = Uri.https(ApiConstans.baseUrl, EndPoints.newsApi, {
      "apiKey": ApiConstans.apiKey,
      "language": lang,
      "sources": sourceId,
    });
    var response = await http.get(url);
    var resonseBody = response.body;
    var json = jsonDecode(resonseBody);
    return NewsResponse.fromJson(json);
  } catch (e) {
    rethrow;
  }
}

Future<NewsResponse> searchNews(String q) async {
  // TODO: implement getNews
  try {
    Uri url = Uri.https(ApiConstans.baseUrl, EndPoints.newsApi, {
      "apiKey": ApiConstans.apiKey,
      "q": q,
    });
    var response = await http.get(url);
    var resonseBody = response.body;
    var json = jsonDecode(resonseBody);
    return NewsResponse.fromJson(json);
  } catch (e) {
    rethrow;
  }
}
