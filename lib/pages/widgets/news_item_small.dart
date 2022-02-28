import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/pages/news_details_page.dart';

class NewsItemSmall extends StatelessWidget {
  final Articles articles;

  const NewsItemSmall({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetailsPage(articles: articles))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(articles.urlToImage!))),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Text(
                articles.title!,
                maxLines: 3,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
