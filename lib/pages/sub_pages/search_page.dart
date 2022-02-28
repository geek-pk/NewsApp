import 'package:flutter/material.dart';
import 'package:news_app/api/api_controller.dart';
import 'package:news_app/pages/widgets/news_item_small.dart';
import 'package:news_app/themes/colors.dart';

import '../../models/news_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Articles>? _articles = [];
  String _searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Search News')),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              decoration: BoxDecoration(
                  color: Theme.of(context).bottomAppBarColor,
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                onChanged: (text) async {
                  _searchKeyword = text;
                  if (_searchKeyword.length < 3) return;
                  _articles!.clear();
                  await Future.delayed(const Duration(milliseconds: 300))
                      .then((value) => setState(() {}));
                },
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Search'),
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineMedium!,
              ),
            ),
            Expanded(
              child: Center(
                child: FutureBuilder(
                  future: getNewsArticles(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      _articles = snapshot.data;
                      if (_articles!.isEmpty) {
                        return Text(
                          'No result Found with $_searchKeyword',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: colorGrey),
                        );
                      }
                    }
                    if (snapshot.hasError ||
                        _articles!.isEmpty ||
                        _searchKeyword.isEmpty) {
                      return Text(
                        'Type keyword in textbox',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: colorGrey),
                      );
                    }
                    if (_searchKeyword.length < 3) {
                      return Text(
                        'Search keyword length should be 3 or greater',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: colorGrey),
                      );
                    }

                    return _articles!.isNotEmpty
                        ? ListView.separated(
                            padding: const EdgeInsets.all(16),
                            shrinkWrap: true,
                            itemCount: _articles!.length,
                            itemBuilder: (context, index) =>
                                NewsItemSmall(articles: _articles![index]),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 16),
                          )
                        : const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getNewsArticles() async {
    if (_searchKeyword.length >= 3) {
      return ApiController.getNewsArticles(_searchKeyword);
    }
  }
}
