import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/core/theme/app_colors.dart';
import 'package:lahza_news/core/providers/language_provider.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/model/category_data.dart';
import 'package:lahza_news/ui/home/category_details/category_details.dart';
import 'package:lahza_news/ui/home/category_details/category_fragment/category_fragment.dart';
import 'package:lahza_news/ui/home/drawer/drawer_details.dart';
import 'package:lahza_news/ui/search/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryData? selectedCategory;

  void onCategoryClicked(CategoryData category) {
    selectedCategory = category;

    setState(() {});
  }

  void onDrawerItemClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final languageProvider = Provider.of<LanguageProvider>(context);

    return PopScope(
      canPop: selectedCategory != null ? false : true,

      child: Scaffold(
        body: selectedCategory == null
            ? CategoryFragment(onCategoryClicked: onCategoryClicked)
            : CategoryDetails(category: selectedCategory!),
        drawer: Drawer(
          backgroundColor: AppColors.primaryColorDark,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  height: hight * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      // bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(16),
                    ),
                    color: AppColors.onPrimaryColorDark,
                  ),
                  child: Row(
                    mainAxisSize: .max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/images/logo_drawer.png",

                          alignment: Alignment.center,

                          width: width * 0.50,
                          fit: BoxFit.contain,

                          // fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: DrawerDetails(
                    onDrawerItemClicked: onDrawerItemClicked,
                  ),
                ),
              ],
            ),
          ),
        ),

        appBar: AppBar(
          title: Text(
            selectedCategory == null
                ? S.of(context).home
                : selectedCategory!.titleFor(languageProvider.language),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),

              child: IconButton(
                enableFeedback: false,

                splashColor: Colors.transparent,

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },

                icon: Icon(Iconsax.search_normal, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
