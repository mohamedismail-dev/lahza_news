import 'package:flutter/material.dart';
import 'package:lahza_news/api/api_manager.dart';
import 'package:lahza_news/core/providers/language_provider.dart';
import 'package:lahza_news/exctensions/time_ex.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/model/source_response.dart';
import 'package:lahza_news/news/news_items.dart';
import 'package:lahza_news/widgets/main_error_widget.dart';
import 'package:lahza_news/widgets/main_loading.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/no_news.svg",
                        width: width * 0.5,
                        height: height * 0.15,
                      ),
                      Text(
                        S.of(context).NoNewsFound,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return NewsItems(news: newsList[index], index: index);
                  },
                );
        }
      },
    );
  }
}
