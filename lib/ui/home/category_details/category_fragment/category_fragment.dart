import 'package:flutter/material.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/model/category_data.dart';
import 'package:lahza_news/ui/home/category_details/category_fragment/category_items.dart';

typedef onCategoryClick = void Function(CategoryData);

class CategoryFragment extends StatelessWidget {
  final onCategoryClick onCategoryClicked;
  CategoryFragment({super.key, required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              SizedBox(height: 0.1),
              Row(
                children: [
                  Text(
                    S.of(context).WelcomeText,

                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () => onCategoryClicked(categories[index]),
                  child: CategoryItems(index: index),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
