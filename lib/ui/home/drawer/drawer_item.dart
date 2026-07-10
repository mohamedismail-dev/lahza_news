import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lahza_news/core/theme/app_colors.dart';
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
      mainAxisSize: MainAxisSize.min,
      spacing: width * 0.026,
      children: [
        Icon(icon, color: AppColors.primaryColorLight, size: 30),
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
                width: 30,
                color: AppColors.primaryColorLight,
              ),
      ],
    );
  }
}
