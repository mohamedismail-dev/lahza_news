import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/data/api/api_manager.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/data/models/news_response.dart';
import 'package:lahza_news/data/models/source_response.dart';
import 'package:lahza_news/presentation/news/news_items.dart';
import 'package:lahza_news/presentation/widgets/main_loading.dart';
import "package:lottie/lottie.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<News> articles = [];
  String error = "";
  bool isLoading = false;
  final searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: SizedBox.shrink(),
            leadingWidth: 0,
            toolbarHeight: 70,

            title: TextField(
              textInputAction: TextInputAction.search,
              // textDirection: TextDirection.rtl,
              onSubmitted: (value) => getArticles(),
              controller: searchController,
              cursorColor: Theme.of(context).colorScheme.onPrimary,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                hintStyle: Theme.of(context).textTheme.titleMedium,
                hintText: S.of(context).search,

                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: IconButton(
                    onPressed: () {
                      getArticles();
                      setState(() {});
                    },
                    icon: Icon(Iconsax.search_normal),
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      articles.clear();
                      setState(() {});
                    },
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          if (articles.isEmpty)
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,

                    children: [
                      if (articles.isEmpty &&
                          error.isEmpty &&
                          isLoading == false)
                        Column(
                          spacing: 8,
                          children: [
                            Lottie.asset(
                              'assets/lottie/search empty.json',
                              width: width * 0.55,
                              height: hight * 0.20,
                            ),
                            Text(
                              S.of(context).noResultsFound,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      if (isLoading == true) MainLoading(),
                    ],
                  ),
                ),
              ),
            ),
          if (articles.isNotEmpty)
            SliverList.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return NewsItems(news: articles[index], index: index);
              },
            ),
        ],
      ),
    );
  }

  Future<void> getArticles() async {
    try {
      setState(() {
        isLoading = true;
        error = "";
      });
      var response = await searchNews(searchController.text);
      setState(() {
        articles = response.articles ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }
}
