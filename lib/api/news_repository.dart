import 'dart:async';

import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart' as api;
import 'package:news_app/models/news_model.dart';

class NewsRepository {
  NewsRepository._internal();

  static final NewsRepository instance = NewsRepository._internal();

  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey = api.apiKey;

  final Dio _dio = Dio();

  var getSourcesUrl = '$mainUrl/sources';
  var getTopHeadlinesUrl = '$mainUrl/top-headlines';
  var everythingUrl = "$mainUrl/everything";


  Future<NewsModel> getNewsArticlesWithTimeFrame(
      String value, String from, String to) async {
    var params = {
      "apiKey": apiKey,
      "q": value,
      "from": from,
      "to": to,
      "sortBy": "popularity"
    };
    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: params);
      return NewsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      return Articles.withError("$error", '$stacktrace');
    }
  }
}
