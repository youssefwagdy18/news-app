import 'package:flutter/material.dart';
import 'package:news_app/config/app_local_state_management.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/config/my_theme.dart';
import 'package:news_app/news/news_details.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider<AppLocalStateManagement>(
    create: (context) => AppLocalStateManagement(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalStateManagement appLang = Provider.of(context);
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      title: 'Localizations Sample App',
      locale: Locale(appLang.currentLang),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        NewsDetails.routeName: (context) => const NewsDetails()
      },
      theme: MyTheme.lightMode,
    );
  }
}
