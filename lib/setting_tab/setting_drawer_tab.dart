import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/config/app_local_state_management.dart';
import 'package:news_app/setting_tab/show_language_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../config/my_theme.dart';

class SettingDrawerTab extends StatefulWidget {
  const SettingDrawerTab({super.key});

  @override
  State<SettingDrawerTab> createState() => _SettingDrawerTabState();
}

class _SettingDrawerTabState extends State<SettingDrawerTab> {
  @override
  Widget build(BuildContext context) {
    var appLang = Provider.of<AppLocalStateManagement>(context);
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset(
          'assets/images/pattern.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: MyTheme.lightMode.textTheme.titleLarge!
                    .copyWith(color: Colors.black),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  languageBottomSheet();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: MyTheme.primaryLightColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLang.currentLang == 'en'
                            ? AppLocalizations.of(context)!.english
                            : AppLocalizations.of(context)!.arabic,
                        style: MyTheme.lightMode.textTheme.titleMedium,
                      ),
                      const Icon(Icons.arrow_downward)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }

  languageBottomSheet() {
    showModalBottomSheet(
      shape: const ContinuousRectangleBorder(),
        constraints: BoxConstraints.loose(Size(
    MediaQuery.of(context).size.width,
    MediaQuery.of(context).size.height *0.15)),
        context: context,
        builder: (context) =>  const ShowLanguageBottomSheet());
  }
}
