import 'package:c_news_app/shared/components/components.dart';
import 'package:c_news_app/ui/screens/web_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget ArticleItem(article){
  String imageUrl = article['urlToImage']??'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg';
  return Builder(
    builder: (context) {
      return GestureDetector(
        onTap: ()=> navigateTo(context, WebViewScreen(article['url'])),
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                flex: 3,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            return Text(article['title'],
                              style: Theme.of(context).textTheme.bodyText1,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              textAlign: TextAlign.start,
                            );
                          }
                        ),
                        const SizedBox(height: 10,),
                        Builder(
                          builder: (context) {
                            return Text(article['publishedAt'],style: Theme.of(context).textTheme.bodyText2,);
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  );
}