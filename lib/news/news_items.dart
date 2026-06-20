import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/core/app_colors.dart';
import 'package:lahza_news/exctensions/time_ex.dart';
import 'package:lahza_news/model/news_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lahza_news/widgets/main_error_widget.dart';
import 'package:lahza_news/widgets/main_loading.dart';

class NewsItems extends StatelessWidget {
  final News news;
  NewsItems({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
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
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  imageUrl: news.urlToImage ?? "",
                  placeholder: (context, url) => MainLoading(),
                  errorWidget: (context, url, error) =>
                      Icon(Iconsax.image, size: 50, color: AppColors.gray),
                ),
              ),
              SizedBox(height: height * 0.015),
              Text(
                news.title ?? "",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: height * 0.015),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      news.author == null ? "" : 'By: ${news.author}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    news.publishedAt?.toTimeAgo() ?? "",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
    );
  }
}
