import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/core/app_colors.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/model/news_response.dart';
import 'package:lahza_news/widgets/main_error_widget.dart';
import 'package:lahza_news/widgets/main_loading.dart';

class NewsBottomSheet extends StatelessWidget {
  VoidCallback viewFullArticle;
  final News news;
  NewsBottomSheet({
    super.key,
    required this.news,
    required this.viewFullArticle,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: height * 0.25,
                width: double.infinity,
                alignment: Alignment.center,
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) => MainLoading(),
                errorWidget: (context, url, error) {
                  return Icon(Iconsax.image, size: 50, color: AppColors.gray);
                },
              ),
            ),
            Text(
              news.content ?? "",

              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, height * 0.06),
              ),
              onPressed: () {
                viewFullArticle();
              },
              child: Text(S.of(context).viewFullArticle),
            ),
          ],
        ),
      ),
    );
  }
}
