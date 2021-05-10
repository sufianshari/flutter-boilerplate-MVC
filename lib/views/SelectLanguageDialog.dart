import 'package:Boilerplate/services/AppLocalizations.dart';
import 'package:Boilerplate/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class SelectLanguageDialog extends StatefulWidget {
  @override
  _SelectLanguageDialogState createState() => _SelectLanguageDialogState();
}

class _SelectLanguageDialogState extends State<SelectLanguageDialog> {
  ThemeData themeData;

  String langCode = 'en';

  @override
  initState() {
    super.initState();
    _loadLanguage();
  }

  _loadLanguage() async {
    String language = await AllLanguage.getLanguage();
    setState(() {
      langCode = language;
    });
  }

  Future<void> _handleRadioValueChange(String langCode) async {
    await Translator.load(langCode);
    Navigator.pop(context);
    Provider.of<AppThemeNotifier>(context, listen: false).notify();
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.only(top: MySize.size16, bottom: MySize.size16),
            child: Column(
                mainAxisSize: MainAxisSize.min, children: _buildOptions()),
          ),
        );
      },
    );
  }

  _buildOptions() {
    List<Widget> list = [];

    for (int i = 0; i < AllLanguage.supportedLanguagesCode.length; i++) {
      list.add(InkWell(
        onTap: () {
          _handleRadioValueChange(AllLanguage.supportedLanguagesCode[i]);
        },
        child: Container(
          padding: EdgeInsets.only(left: MySize.size16, right: MySize.size16),
          child: Row(
            children: <Widget>[
              Radio(
                onChanged: (value) {
                  _handleRadioValueChange(value);
                },
                groupValue: langCode,
                value: AllLanguage.supportedLanguagesCode[i],
                activeColor: themeData.colorScheme.primary,
              ),
              Text(AllLanguage.supportedLanguages[i],
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      fontWeight: 600)),
            ],
          ),
        ),
      ));
    }

    return list;
  }
}
