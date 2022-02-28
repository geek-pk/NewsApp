import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'sub_pages/news_page.dart';

class NewsTabsPage extends StatefulWidget {
  const NewsTabsPage({Key? key}) : super(key: key);

  @override
  State<NewsTabsPage> createState() => _NewsTabsPageState();
}

class _NewsTabsPageState extends State<NewsTabsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 1,
        length: categories.length,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const Text('News App'),
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    indicatorColor: Theme.of(context).tabBarTheme.labelColor,
                    isScrollable: true,
                    tabs: [
                      for (var cat in categories) Tab(text: cat.toUpperCase())
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                for (var cat in categories) NewsListPage(category: cat),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
