import 'package:flutter/material.dart';
import 'package:news_app/api/api_controller.dart';
import 'package:news_app/models/news_model.dart';

import '../widgets/news_item_large.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  List<Articles>? articles = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ApiController.getNewsArticles(widget.category),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) articles = snapshot.data;
            return articles!.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemCount: articles!.length,
                    itemBuilder: (context, index) =>
                        NewsItemLarge(articles: articles![index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 16),
                  )
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
