import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/core/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class DrawerItem extends StatelessWidget {
  String perfixIcon;
  String title;
  IconData icon;

  DrawerItem({
    super.key,
    required this.perfixIcon,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      spacing: width * 0.026,
      children: [
        Icon(icon, color: AppColors.primaryColorLight, size: width * 0.07),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: AppColors.primaryColorLight),
        ),
        Spacer(),
        perfixIcon == ""
            ? Container()
            : SvgPicture.asset(
                perfixIcon,
                width: width * 0.07,
                color: AppColors.primaryColorLight,
              ),
      ],
    );
  }
}
