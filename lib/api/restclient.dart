import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';
import 'package:retrofit/http.dart';

part 'restclient.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient() {
    var dio = Dio();
    dio.options = BaseOptions(
        receiveTimeout: 5000,
        connectTimeout: 5000,
        queryParameters: {'apiKey': apiKey, 'sortBy': 'popularity'},
        headers: {'authorization': 'eyJhbGciOiJySum4-R0NIs'});
    return _RestClient(dio, baseUrl: baseUrl);
  }
//https://newsapi.org/v2/everything?q=pankaj&sortBy=publishedAt&apiKey=f1e7882f59db4b9ba2d9b9a6698811f5
  @GET('everything')
  Future<dynamic> getNewsArticles(@Query('q') String keyword);

  @GET('everything')
  Future<dynamic> getNewsArticlesFromSelection(
      @Query('domains') String domains);


/* async {
    var params = {
      "apiKey": apiKey,
      "domains": domains,
    };
    try {
      Response response =
      await _dio.get(everythingUrl, queryParameters: params);
      return NewsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      return Articles.withError("$error", '$stacktrace');
    }
  }*/

/*  @GET('sources')
  Future<NewsModel> getSourcesUrl(@Query('apiKey') String apiKey,
      @Query('q') String q, @Query('sortBy') String popularity);

  @GET('top-headlines')
  Future<NewsModel> getTopHeadlinesUrl(@Query('apiKey') String apiKey,
      @Query('q') String q, @Query('sortBy') String popularity);*/
}
