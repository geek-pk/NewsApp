import 'package:flutter/material.dart';
import 'package:news_app/api/api_controller.dart';
import 'package:news_app/themes/colors.dart';

import '../../constants/constants.dart';
import '../../models/news_model.dart';
import '../widgets/news_item_small.dart';

class NewsstandPage extends StatefulWidget {
  const NewsstandPage({Key? key}) : super(key: key);

  @override
  State<NewsstandPage> createState() => _NewsstandPageState();
}

class _NewsstandPageState extends State<NewsstandPage> {
  List<Articles>? articles = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: domains.length,
        child: Scaffold(
          appBar: AppBar(title: const Text('Newsstand')),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'News Showcase',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'Stories selected by newsroom editors',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                    children: [
                  for (int i = 0; i < domains.length; i++)
                    listviewWidget(domains[i])
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  listviewWidget(String domain) {
    return Column(
      children: [
        FutureBuilder(
          future: ApiController.getNewsArticlesFromSelection(domain),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) articles = snapshot.data;
            return articles!.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness==Brightness.dark?colorArsenic92:colorWhite,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(articles![1].source!.name!,
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          color: Colors.black54,
                          child: Text('Top headline of today'.toUpperCase(),
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorWhite)),
                        ),
                        ListView.separated(
                          padding: const EdgeInsets.all(16),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) =>
                              NewsItemSmall(articles: articles![index]),
                          separatorBuilder: (BuildContext context, int index) =>
                              Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            color: colorGrey,
                            height: 0.3
                          ),
                        ),
                      ],
                    ),
                  )
                : const Expanded(
                  child:  Center(child: CircularProgressIndicator())
                );
          },
        ),
      ],
    );
  }
}
