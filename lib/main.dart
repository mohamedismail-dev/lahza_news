import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lahza_news/core/theme/app_theme.dart';
import 'package:lahza_news/core/providers/language_provider.dart';
import 'package:lahza_news/core/providers/theme_provider.dart';
import 'package:lahza_news/generated/l10n.dart';
import 'package:lahza_news/ui/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeObj = ThemeProvider();
  final langObj = LanguageProvider();
  await themeObj.isDark();
  await langObj.loadLanguage();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => themeObj),
        ChangeNotifierProvider(create: (context) => langObj),
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
    final themeProvider = Provider.of<ThemeProvider>(context).appTheme;
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
      themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
