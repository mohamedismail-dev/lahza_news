import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lahza_news/core/app_colors.dart';
import 'package:lahza_news/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DropDownTheme extends StatefulWidget {
  const DropDownTheme({super.key});

  @override
  State<DropDownTheme> createState() => _DropDownThemeState();
}

class _DropDownThemeState extends State<DropDownTheme> {
  static const List<String> _list = ['Dark', 'Light'];
  late final ValueNotifier<String?> _valueListenable;

  @override
  void initState() {
    super.initState();
    final isDark = context.read<ThemeProvider>().isDarkMode;
    _valueListenable = ValueNotifier<String?>(isDark ? _list[0] : _list[1]);
  }

  @override
  void dispose() {
    _valueListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    // لو الثيم تغيّر من مكان تاني في التطبيق، نزامن قيمة الدروب داون هنا
    _valueListenable.value = themeProvider.isDarkMode ? _list[0] : _list[1];

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        valueListenable: _valueListenable,

        // عناصر القائمة لما تكون مفتوحة (الـ expanded state)
        items: _list
            .map(
              (item) => DropdownItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    color: Colors.black, // لون الآيتمز جوه القائمة المفتوحة
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
            .toList(),

        // الشكل اللي بيظهر في الزرار المقفول (مختلف عن شكل العنصر جوه القائمة)
        selectedItemBuilder: (context) {
          return _list
              .map(
                (item) => Text(
                  item,
                  style: const TextStyle(
                    color: Colors.white, // لون النص في الزرار المقفول
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
              .toList();
        },

        onChanged: (value) {
          if (value == null) return;
          final wantsDark = value == _list[0];
          if (wantsDark != themeProvider.isDarkMode) {
            themeProvider.changeTheme();
          }
        },

        // ستايل الزرار المقفول (الصندوق نفسه، مش النص)
        buttonStyleData: ButtonStyleData(
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColors.onPrimaryColorDark, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // أيقونة السهم
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.onPrimaryColorDark,
            size: 28,
          ),
          openMenuIcon: Icon(
            Icons.keyboard_arrow_up_rounded,
            color: AppColors.onPrimaryColorDark,
            size: 28,
          ),
        ),

        // ستايل القائمة المفتوحة (الصندوق نفسه، مش النص)
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // padding كل عنصر جوه القائمة
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}
