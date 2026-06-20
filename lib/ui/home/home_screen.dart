import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/core/app_colors.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/ui/home/category_details/category_fragment/category_fragment.dart';
import 'package:lahza_news/ui/home/drawer/drawer_details.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CategoryFragment(),
      drawer: Drawer(
        backgroundColor: AppColors.primaryColorDark,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: hight * 0.025),
              width: double.infinity,
              height: hight * 0.30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(16),
                ),
                color: AppColors.onPrimaryColorDark,
              ),
              child: Image.asset(
                "assets/images/logo_splash_light.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: DrawerDetails(),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: Text(S.of(context).home),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),

            child: IconButton(
              enableFeedback: false,

              splashColor: Colors.transparent,

              onPressed: () {},

              icon: Icon(Iconsax.search_normal, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
