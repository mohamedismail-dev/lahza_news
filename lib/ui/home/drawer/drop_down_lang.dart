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
  late final ValueNotifier<String?> _valueListenable;

  @override
  void initState() {
    super.initState();
    final currentCode = context.read<LanguageProvider>().language;
    _valueListenable = ValueNotifier<String?>(currentCode);
  }

  @override
  void dispose() {
    _valueListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final languages = LanguageProvider.supportedLanguages;

    // لو اللغة تغيّرت من مكان تاني في التطبيق، نزامن قيمة الدروب داون هنا
    _valueListenable.value = languageProvider.language;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        valueListenable: _valueListenable,

        // عناصر القائمة لما تكون مفتوحة (الـ expanded state)
        items: languages
            .map(
              (lang) => DropdownItem<String>(
                value: lang.code,
                child: Row(
                  textDirection: lang.isRtl
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  children: [
                    Expanded(
                      child: Text(
                        lang.nativeName,
                        textDirection: lang.isRtl
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (lang.code == languageProvider.language)
                      const Icon(
                        Icons.check_rounded,
                        size: 18,
                        color: AppColors.onPrimaryColorDark,
                      ),
                  ],
                ),
              ),
            )
            .toList(),

        // الشكل اللي بيظهر في الزرار المقفول (مختلف عن شكل العنصر جوه القائمة)
        selectedItemBuilder: (context) {
          return languages
              .map(
                (lang) => Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.nativeName,
                    textDirection: lang.isRtl
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
              .toList();
        },

        onChanged: (code) {
          if (code == null) return;
          if (code != languageProvider.language) {
            languageProvider.setLanguage(code);
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
        // ارتفاع القائمة محدد عشان عندنا 14 عنصر دلوقتي مش 2
        dropdownStyleData: DropdownStyleData(
          maxHeight: 320,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // padding كل عنصر جوه القائمة
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}
