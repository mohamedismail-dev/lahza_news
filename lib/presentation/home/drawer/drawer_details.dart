import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/core/theme/app_colors.dart';
import 'package:lahza_news/presentation/providers/language_provider.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/presentation/home/drawer/drawer_config.dart';
import 'package:lahza_news/presentation/home/drawer/drawer_item.dart';
import 'package:lahza_news/presentation/home/drawer/drop_down_lang.dart';
import 'package:lahza_news/presentation/home/drawer/drop_down_theme.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

class DrawerDetails extends StatelessWidget {
  VoidCallback onDrawerItemClicked;

  DrawerDetails({super.key, required this.onDrawerItemClicked});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      spacing: height * 0.024,
      children: [
        InkWell(
          onTap: () {
            onDrawerItemClicked();
          },
          child: DrawerItem(
            title: S.of(context).goHome,
            icon: Iconsax.home_24,
            perfixIcon: languageProvider.isRtl
                ? "assets/icons/arrow_left.svg"
                : "assets/icons/arrow_right.svg",
          ),
        ),
        Divider(thickness: 1, color: AppColors.primaryColorLight),
        DrawerItem(
          title: S.of(context).theme,
          icon: Iconsax.moon4,
          perfixIcon: "",
        ),
        DropDownTheme(),
        Divider(thickness: 1, color: AppColors.primaryColorLight),
        DrawerItem(
          title: S.of(context).language,
          icon: Iconsax.language_circle,
          perfixIcon: "",
        ),
        DropDownLang(),
      ],
    );
  }
}
