import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lahza_news/core/app_colors.dart';
import 'package:lahza_news/core/providers/language_provider.dart';
import 'package:provider/provider.dart';

class DropDownLang extends StatefulWidget {
  const DropDownLang({super.key});

  @override
  State<DropDownLang> createState() => _DropDownLangState();
}

class _DropDownLangState extends State<DropDownLang> {
  // القيم الداخلية المطابقة لما هو مخزن في LanguageProvider (en/ar)
  static const List<String> _codes = ['en', 'ar'];

  // الأسماء المعروضة للمستخدم
  static const Map<String, String> _displayNames = {
    'en': 'English',
    'ar': 'العربية',
  };

  late final ValueNotifier<String?> _valueListenable;

  @override
  void initState() {
    super.initState();
    final currentCode = context.read<LanguageProvider>().language;
    _valueListenable = ValueNotifier<String?>(
      _displayNames[currentCode] ?? _displayNames[_codes.first],
    );
  }

  @override
  void dispose() {
    _valueListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();

    // لو اللغة تغيّرت من مكان تاني في التطبيق، نزامن قيمة الدروب داون هنا
    _valueListenable.value =
        _displayNames[languageProvider.language] ?? _displayNames[_codes.first];

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        valueListenable: _valueListenable,

        // عناصر القائمة لما تكون مفتوحة (الـ expanded state)
        items: _codes
            .map(
              (code) => DropdownItem<String>(
                value: _displayNames[code],
                child: Text(
                  _displayNames[code]!,
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
          return _codes
              .map(
                (code) => Text(
                  _displayNames[code]!,
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
          final wantsCode = _displayNames.entries
              .firstWhere((entry) => entry.value == value)
              .key;
          if (wantsCode != languageProvider.language) {
            languageProvider.changeLanguage();
            Navigator.pop(context);
          }
        },

        // ستايل الزرار المقفول (الصندوق نفسه، مش النص)
        buttonStyleData: ButtonStyleData(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
