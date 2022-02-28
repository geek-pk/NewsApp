import 'package:flutter/material.dart';
import 'package:news_app/themes/theme_button.dart';
import 'package:news_app/utils/utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/news_model.dart';
import '../themes/colors.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, this.articles}) : super(key: key);
  final Articles? articles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
          leading: const Icon(Icons.arrow_back_ios),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(articles!.urlToImage!))),
              ),
              const SizedBox(height: 8),
              Text(
                articles!.source!.name!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                articles!.title!,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    convertToAgo(articles!.publishedAt!),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: colorGrey, fontWeight: FontWeight.normal),
                  ),
                  InkWell(
                      onTap: () => _onShare(context, articles!.url!),
                      child: const Icon(Icons.more_vert)),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                articles!.description!,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 8),
              Text(
                articles!.author!,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 8),
              Text(
                articles!.content!,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 32),
              Container(
                alignment: Alignment.center,
                child: ThemeButton(
                  name: 'See full article',
                  onPress: () async => await launch(articles!.url!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onShare(BuildContext context, String link) async {
    final box = context.findRenderObject() as RenderBox?;

    if (link.isNotEmpty) {
      await Share.share(link,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(link,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }
}
