import 'package:Boilerplate/controllers/AuthController.dart';
import 'package:Boilerplate/controllers/MaintenanceController.dart';
import 'package:Boilerplate/models/MyResponse.dart';
import 'package:Boilerplate/services/AppLocalizations.dart';
import 'package:Boilerplate/utils/SizeConfig.dart';
import 'package:Boilerplate/utils/UrlUtils.dart';
import 'package:Boilerplate/views/AppScreen.dart';
import 'package:Boilerplate/views/auth/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

//----------------------------- Maintenance Screen -------------------------------//

class MaintenanceScreen extends StatefulWidget {
  final bool isNeedUpdate;

  const MaintenanceScreen({Key key, this.isNeedUpdate = false})
      : super(key: key);

  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  //ThemeData
  ThemeData themeData;
  bool isInProgress = false;

  //Variables
  bool isNeedUpdate;

  @override
  void initState() {
    super.initState();
    isNeedUpdate = widget.isNeedUpdate;
  }

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _checkMaintenance() async {
    setState(() {
      isInProgress = true;
    });

    MyResponse myResponse = await MaintenanceController.checkMaintenance();

    if (myResponse.success) {
      if (await AuthController.isLoginUser()) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => AppScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(),
          ),
        );
      }
    } else {
      showMessage(message: "Please wait for some time");
    }

    setState(() {
      isInProgress = false;
    });
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: themeData.backgroundColor,
                  body: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MySize.size3,
                          child: isInProgress
                              ? LinearProgressIndicator(
                                  minHeight: MySize.size3,
                                )
                              : Container(
                                  height: MySize.size3,
                                ),
                        ),
                        Container(
                          child: Image(
                            image:
                                AssetImage('./assets/images/maintenance.png'),
                          ),
                        ),
                        !isNeedUpdate
                            ? Column(
                                children: [
                                  Container(
                                    margin: Spacing.top(24),
                                    child: Text(
                                      Translator.translate(
                                          "we_will_be_back_soon"),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600,
                                          letterSpacing: 0.2),
                                    ),
                                  ),
                                  Container(
                                    margin: Spacing.fromLTRB(24, 24, 24, 0),
                                    child: Text(
                                      "If you found bugs then uninstall app and re install application or contact to admin",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                      margin: Spacing.only(
                                          left: MySize.size56,
                                          right: MySize.size56,
                                          top: MySize.size24),
                                      child: FlatButton(
                                        onPressed: () {
                                          _checkMaintenance();
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MySize.size4)),
                                        color: themeData.colorScheme.primary,
                                        child: Text(
                                          Translator.translate("refresh"),
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                        ),
                                      ))
                                ],
                              )
                            : Column(
                                children: [
                                  Container(
                                    margin: Spacing.top(24),
                                    child: Text(
                                      Translator.translate(
                                          "you_need_update_application"),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600,
                                          letterSpacing: 0.2),
                                    ),
                                  ),
                                  Container(
                                    margin: Spacing.fromLTRB(24, 24, 24, 0),
                                    child: Text(
                                      "Please download our latest version and enjoy",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                      margin: Spacing.only(
                                          left: MySize.size56,
                                          right: MySize.size56,
                                          top: MySize.size24),
                                      child: FlatButton(
                                        onPressed: () {
                                          UrlUtils.openDocsDownloadPage();
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MySize.size4)),
                                        color: themeData.colorScheme.primary,
                                        child: Text(
                                          Translator.translate("download"),
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                        ),
                                      ))
                                ],
                              )
                      ],
                    ),
                  )),
            ));
      },
    );
  }

  void showMessage({String message = "Something wrong", Duration duration}) {
    if (duration == null) {
      duration = Duration(seconds: 3);
    }
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: duration,
        content: Text(message,
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                letterSpacing: 0.4, color: themeData.colorScheme.onPrimary)),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}
