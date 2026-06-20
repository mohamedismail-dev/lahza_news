import 'package:flutter/material.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/ui/home/category_details/category_fragment/category_items.dart';

class CategoryFragment extends StatelessWidget {
  const CategoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => CategoryItems(index: index),
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
