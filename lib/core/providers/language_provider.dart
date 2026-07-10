import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  // الكود الافتراضي عند أول تشغيل للتطبيق
  String language = 'en';

  // كل اللغات المدعومة، كل عنصر فيه:
  // code: الكود المستخدم في أسماء ملفات الترجمة وفي الـ Locale
  // nativeName: اسم اللغة مكتوب بلغتها هي نفسها (UX requirement)
  // isRtl: هل اللغة تتجه من اليمين لليسار
  static const List<LanguageOption> supportedLanguages = [
    LanguageOption(code: 'en', nativeName: 'English', isRtl: false),
    LanguageOption(code: 'ar', nativeName: 'العربية', isRtl: true),
    LanguageOption(code: 'de', nativeName: 'Deutsch', isRtl: false),
    LanguageOption(code: 'es', nativeName: 'Español', isRtl: false),
    LanguageOption(code: 'fr', nativeName: 'Français', isRtl: false),
    LanguageOption(code: 'he', nativeName: 'עברית', isRtl: true),
    LanguageOption(code: 'it', nativeName: 'Italiano', isRtl: false),
    LanguageOption(code: 'nl', nativeName: 'Nederlands', isRtl: false),
    LanguageOption(code: 'no', nativeName: 'Norsk', isRtl: false),
    LanguageOption(code: 'pt', nativeName: 'Português', isRtl: false),
    LanguageOption(code: 'ru', nativeName: 'Русский', isRtl: false),
    LanguageOption(code: 'sv', nativeName: 'Svenska', isRtl: false),
    LanguageOption(code: 'ur', nativeName: 'اردو', isRtl: true),
    LanguageOption(code: 'zh', nativeName: '中文', isRtl: false),
  ];

  Locale get locale => Locale(language);

  bool get isRtl => supportedLanguages
      .firstWhere(
        (lang) => lang.code == language,
        orElse: () => supportedLanguages.first,
      )
      .isRtl;

  LanguageOption get currentLanguage => supportedLanguages.firstWhere(
    (lang) => lang.code == language,
    orElse: () => supportedLanguages.first,
  );

  void setLanguage(String code) {
    final isSupported = supportedLanguages.any((lang) => lang.code == code);
    if (!isSupported || code == language) return;
    language = code;
    notifyListeners();
  }
}

class LanguageOption {
  final String code;
  final String nativeName;
  final bool isRtl;

  const LanguageOption({
    required this.code,
    required this.nativeName,
    required this.isRtl,
  });
}
