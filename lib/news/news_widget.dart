import 'package:flutter/material.dart';
import 'package:lahza_news/api/api_manager.dart';
import 'package:lahza_news/model/source_response.dart';
import 'package:lahza_news/news/news_items.dart';
import 'package:lahza_news/widgets/main_error_widget.dart';
import 'package:lahza_news/widgets/main_loading.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNewsBySourceId(widget.source.id ?? ""),
      builder: (context, snapshot) {
        //todo: Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoading();
          //todo: Has Error
        } else if (snapshot.data?.status != "ok") {
          return MainErrorWidget(
            errorMessage: snapshot.data?.message ?? "",
            onPressed: () {
              getNewsBySourceId(widget.source.id ?? "");
              setState(() {});
            },
          );
        } else {
          var newsList = snapshot.data?.articles ?? [];
          return newsList.isEmpty
              ? Center(
                  child: Text(
                    "No News Found!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              : ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return NewsItems(news: newsList[index]);
                  },
                );
        }
      },
    );
  }
}
