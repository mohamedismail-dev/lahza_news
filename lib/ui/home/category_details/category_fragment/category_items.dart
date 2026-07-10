import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/core/providers/language_provider.dart';
import 'package:lahza_news/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/model/category_data.dart';
import 'package:provider/provider.dart';

class CategoryItems extends StatelessWidget {
  int index = 0;

  CategoryItems({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final languageProvider = Provider.of<LanguageProvider>(context);
    bool isEven = (index % 2) == 0;

    return Container(
      height: hight * 0.25,
      width: width * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: isEven
            ? AlignmentGeometry.centerLeft
            : AlignmentGeometry.centerRight,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),

            child: Image.asset(
              "assets/images/category${index + 1}.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: !isEven ? null : 0,
            left: isEven ? null : 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,

                spacing: hight * 0.05,
                children: [
                  Text(
                    categories[index].titleFor(languageProvider.language),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: hight * 0.06,

                    width: languageProvider.language == "ru"
                        ? width * 0.60
                        : languageProvider.language == "de"
                        ? width * 0.58
                        : languageProvider.language == "ur"
                        ? width * 0.50
                        : width * 0.44,
                    alignment: AlignmentGeometry.bottomRight,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      spacing: width * 0.02,
                      textDirection: isEven
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Container(
                          height: hight * 0.6,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: SvgPicture.asset(
                            color: Theme.of(context).colorScheme.onPrimary,
                            isEven
                                ? "assets/icons/arrow_right.svg"
                                : "assets/icons/arrow_left.svg",
                          ),
                        ),
                        Expanded(
                          child: Text(
                            S.of(context).ViewAll,
                            textAlign: isEven
                                ? TextAlign.right
                                : TextAlign.left,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
