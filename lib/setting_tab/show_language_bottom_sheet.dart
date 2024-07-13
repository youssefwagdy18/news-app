import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/config/app_local_state_management.dart';
import 'package:news_app/config/my_theme.dart';
import 'package:provider/provider.dart';

class ShowLanguageBottomSheet extends StatefulWidget {
  const ShowLanguageBottomSheet({super.key});

  @override
  State<ShowLanguageBottomSheet> createState() => _ShowLanguageBottomSheetState();
}

class _ShowLanguageBottomSheetState extends State<ShowLanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var appLang = Provider.of<AppLocalStateManagement>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
              onTap: () {
                appLang.onChangeLang('en');
              },
              child: appLang.currentLang == 'en'
                  ? selectedItem(AppLocalizations.of(context)!.english)
                  : unSelectedItem(AppLocalizations.of(context)!.english)),
          const Spacer(),
          InkWell(
              onTap: () {
                appLang.onChangeLang('ar');
              },
          child: appLang.currentLang == 'ar'
              ? selectedItem(AppLocalizations.of(context)!.arabic)
              : unSelectedItem(AppLocalizations.of(context)!.arabic)),
        ],
      ),
    );
  }

  selectedItem(String selected) {
    return Row(
      children: [
        Text(
          selected,style: MyTheme.lightMode.textTheme.titleLarge
            !.copyWith(color: MyTheme.primaryLightColor),
        ),
        const Spacer(),
        const Icon(
          Icons.check,
          color: MyTheme.primaryLightColor,
        )
      ],
    );
  }

  unSelectedItem(String unSelected) {
    return Row(
      children: [
        Text(unSelected,style: MyTheme.lightMode.textTheme.titleLarge!
            .copyWith(color: Colors.black)),
      ],
    );
  }
}
