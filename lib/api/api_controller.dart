import 'package:news_app/api/restclient.dart';
import 'package:news_app/models/news_model.dart';

class ApiController {
  static getNewsArticles(String keyword) async {
    var res = await RestClient().getNewsArticles(keyword);
    print(res.toString());
    return NewsModel.fromJson(res).articles;
  }

  static getNewsArticlesFromSelection(String domains) async {
    var res = await RestClient().getNewsArticlesFromSelection(domains);
    print(res.toString());
    return NewsModel.fromJson(res).articles;
  }
}
