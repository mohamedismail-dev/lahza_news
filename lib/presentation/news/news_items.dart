import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/core/theme/app_colors.dart';
import 'package:lahza_news/presentation/providers/language_provider.dart';
import 'package:lahza_news/extensions/time_ex.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/data/models/news_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lahza_news/presentation/news/news_bottom_sheet.dart';
import 'package:lahza_news/presentation/news/view_full_news.dart';
import 'package:lahza_news/presentation/widgets/main_error_widget.dart';
import 'package:lahza_news/presentation/widgets/main_loading.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItems extends StatefulWidget {
  final News news;
  int index;

  NewsItems({super.key, required this.news, required this.index});

  @override
  State<NewsItems> createState() => _NewsItemsState();
}

class _NewsItemsState extends State<NewsItems> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeago.setLocaleMessages('en', timeago.EnMessages());
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    timeago.setLocaleMessages('de', timeago.DeMessages());
    timeago.setLocaleMessages('es', timeago.EsMessages());
    timeago.setLocaleMessages('fr', timeago.FrMessages());
    timeago.setLocaleMessages('he', timeago.HeMessages());
    timeago.setLocaleMessages('it', timeago.ItMessages());
    timeago.setLocaleMessages('nl', timeago.NlMessages());
    timeago.setLocaleMessages('no', timeago.NbNoMessages());
    timeago.setLocaleMessages('pt', timeago.PtBrMessages());
    timeago.setLocaleMessages('ru', timeago.RuMessages());
    timeago.setLocaleMessages('sv', timeago.SvMessages());
    timeago.setLocaleMessages(
      'ur',
      timeago.UrMessages(),
    ); // لو موجود، وإلا شوف الملاحظة timeago.setLocaleMessages('zh', timeago.ZhMessages());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final languageProvider = Provider.of<LanguageProvider>(context);
    return InkWell(
          hoverColor: Colors.transparent,
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: NewsBottomSheet(
                  news: widget.news,
                  viewFullArticle: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ViewFullNews(url: widget.news.url),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: height * 0.25,
                        width: width * 0.9,
                        alignment: Alignment.center,
                        imageUrl: widget.news.urlToImage ?? "",
                        placeholder: (context, url) => MainLoading(),
                        errorWidget: (context, url, error) => Icon(
                          Iconsax.image,
                          size: 50,
                          color: AppColors.gray,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    Text(
                      widget.news.title ?? "",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: height * 0.015),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.news.author == null
                                ? ""
                                : '${S.of(context).by} ${widget.news.author}',
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.gray,
                                ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.news.publishedAt?.toTimeAgo(
                                locale: languageProvider.currentLanguage.code,
                              ) ??
                              "",
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(
                                overflow: TextOverflow.ellipsis,

                                color: AppColors.gray,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .animate(delay: Duration(milliseconds: widget.index == 1 ? 800 : 400))
        .fadeIn(duration: 800.ms, curve: Curves.easeOut)
        .slide(
          begin: Offset(0, 0.2),
          end: Offset.zero,
          duration: 800.ms,
          curve: Curves.easeOut,
        )
        .blurXY(begin: 8.0, end: 0.0, duration: 600.ms, curve: Curves.easeOut);
  }
}
