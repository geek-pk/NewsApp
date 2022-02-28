import 'package:flutter/material.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/pages/news_details_page.dart';
import 'package:news_app/themes/colors.dart';
import 'package:share_plus/share_plus.dart';

class NewsItemLarge extends StatelessWidget {
  final Articles? articles;

  const NewsItemLarge({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetailsPage(articles: articles))),
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
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: colorGrey, fontWeight: FontWeight.normal),
              ),
              InkWell(
                  onTap: () => _onShare(context, articles!.url!),
                  child: const Icon(Icons.more_vert)),
            ],
          ),
        ],
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