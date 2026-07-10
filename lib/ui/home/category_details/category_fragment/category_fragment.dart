import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
                  Expanded(
                    child: AnimatedSize(
                      key: ValueKey(
                        '${S.of(context).WelcomeText}_${Theme.of(context).textTheme.titleMedium}',
                      ),
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.fastLinearToSlowEaseIn,
                      alignment: Alignment.topCenter,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            S.of(context).WelcomeText,
                            textStyle: Theme.of(context).textTheme.titleMedium,
                            speed: const Duration(milliseconds: 100),
                            textAlign: TextAlign.start,

                            cursor: '|',
                          ),
                        ],
                        totalRepeatCount: 1,
                        isRepeatingAnimation: false,
                      ),
                    ),
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
