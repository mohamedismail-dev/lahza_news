import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lahza_news/core/app_theme.dart';
import 'package:lahza_news/core/providers/language_provider.dart';
import 'package:lahza_news/core/providers/theme_provider.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context).appTheme;

    // isRtl بقت بتدعم 3 لغات RTL (ar, he, ud) مش بس العربي
    final isRtl = languageProvider.isRtl;

    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: languageProvider.locale,
      theme: AppTheme.lightTheme(isArabic: isRtl),
      darkTheme: AppTheme.darkTheme(isArabic: isRtl),
      themeMode: themeProvider,
      home: HomeScreen(),
    );
  }
}
