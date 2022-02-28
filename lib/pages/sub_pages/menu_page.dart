import 'package:flutter/material.dart';
import 'package:news_app/api/api_controller.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/pages/widgets/news_item_small.dart';

import '../../constants/constants.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Articles>? _articles = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('News App')),
        body: FutureBuilder(
          // future: fetchNewsArticles(categories[3]),
          future: ApiController.getNewsArticles(categories[3]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) _articles = snapshot.data;
            return _articles!.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemCount: _articles!.length,
                    itemBuilder: (context, index) =>
                        NewsItemSmall(articles: _articles![index]),
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
