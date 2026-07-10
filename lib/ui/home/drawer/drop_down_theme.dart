import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lahza_news/core/theme/app_colors.dart';
import 'package:lahza_news/core/providers/language_provider.dart';
import 'package:lahza_news/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DropDownTheme extends StatefulWidget {
  const DropDownTheme({super.key});

  @override
  State<DropDownTheme> createState() => _DropDownThemeState();
}

class _DropDownThemeState extends State<DropDownTheme> {
  // ترجمة "Dark"/"Light" لكل لغة مدعومة (نفس نمط CategoryData.titles)
  static const Map<String, List<String>> _themeLabels = {
    'en': ['Dark', 'Light'],
    'ar': ['داكـن', 'فاتــح'],
    'de': ['Dunkel', 'Hell'],
    'es': ['Oscuro', 'Claro'],
    'fr': ['Sombre', 'Clair'],
    'he': ['כהה', 'בהיר'],
    'it': ['Scuro', 'Chiaro'],
    'nl': ['Donker', 'Licht'],
    'no': ['Mørk', 'Lys'],
    'pt': ['Escuro', 'Claro'],
    'ru': ['Тёмная', 'Светлая'],
    'sv': ['Mörkt', 'Ljust'],
    'ur': ['گہرا', 'ہلکا'],
    'zh': ['深色', '浅色'],
  };

  late final ValueNotifier<String?> _valueListenable;

  @override
  void initState() {
    super.initState();
    final isDark = context.read<ThemeProvider>().isDarkMode;
    final languageCode = context.read<LanguageProvider>().language;
    final labels = _themeLabels[languageCode] ?? _themeLabels['en']!;
    _valueListenable = ValueNotifier<String?>(isDark ? labels[0] : labels[1]);
  }

  @override
  void dispose() {
    _valueListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = Provider.of<LanguageProvider>(context);

    final labels =
        _themeLabels[languageProvider.language] ?? _themeLabels['en']!;

    // لو الثيم تغيّر من مكان تاني في التطبيق، نزامن قيمة الدروب داون هنا
    _valueListenable.value = themeProvider.isDarkMode ? labels[0] : labels[1];

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        valueListenable: _valueListenable,

        // عناصر القائمة لما تكون مفتوحة (الـ expanded state)
        items: labels
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
          return labels
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
          final wantsDark = value == labels[0];
          if (wantsDark != themeProvider.isDarkMode) {
            themeProvider.changeTheme();
            Navigator.pop(context);
          }
        },

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
