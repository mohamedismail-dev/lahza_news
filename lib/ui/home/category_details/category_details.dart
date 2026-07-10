import 'package:flutter/material.dart';
import 'package:lahza_news/api/api_manager.dart';
import 'package:lahza_news/core/providers/language_provider.dart';
import 'package:lahza_news/gen/assets.gen.dart';
import 'package:lahza_news/model/category_data.dart';
import 'package:lahza_news/model/source_response.dart';
import 'package:lahza_news/widgets/main_error_widget.dart';
import 'package:lahza_news/widgets/main_loading.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/widgets/sources_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryData category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: FutureBuilder<SourceResponse>(
        future: ApiManager.getSources(
          widget.category.id,
          languageProvider.currentLanguage.toString(),
        ),
        builder: (context, snapshot) {
          //todo: Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MainLoading();
            //todo: Has Error
          } else if (snapshot.data?.status != "ok") {
            return MainErrorWidget(
              errorMessage: snapshot.data?.message ?? "",
              onPressed: () {
                ApiManager.getSources(
                  widget.category.id,
                  languageProvider.currentLanguage.toString(),
                );
                setState(() {});
              },
            );
            //todo: Has Data
          } else if (snapshot.data?.status == "ok") {
            List<Source> sourcesList = snapshot.data?.source ?? [];
            return SourcesWidget(sources: sourcesList);
          } else {
            return MainErrorWidget(
              errorMessage: "Something Went Wrong",
              onPressed: () {
                ApiManager.getSources(
                  widget.category.id,
                  languageProvider.currentLanguage.toString(),
                );
                setState(() {});
              },
            );
          }
        },
      ),
    );
  }
}
