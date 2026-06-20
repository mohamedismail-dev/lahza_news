import 'package:flutter/material.dart';
import 'package:lahza_news/core/app_colors.dart';

class DrawerConfig extends StatelessWidget {
  String name;
  IconData? icon;
  DrawerConfig({super.key, required this.name, required this.icon});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: hight * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColors.primaryColorLight),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(name, style: Theme.of(context).textTheme.titleMedium),
            Spacer(),
            Icon(icon, color: AppColors.primaryColorLight, size: width * 0.07),
          ],
        ),
      ),
    );
  }
}
