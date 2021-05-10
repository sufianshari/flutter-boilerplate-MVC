import 'package:Boilerplate/AppTheme.dart';
import 'package:Boilerplate/AppThemeNotifier.dart';
import 'package:Boilerplate/api/api_util.dart';
import 'package:Boilerplate/controllers/AuthController.dart';
import 'package:Boilerplate/models/MyResponse.dart';
import 'package:Boilerplate/services/AppLocalizations.dart';
import 'package:Boilerplate/utils/SizeConfig.dart';
import 'package:Boilerplate/utils/Validator.dart';
import 'package:Boilerplate/views/auth/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //Theme Data
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  //Text Field Editing Controller
  TextEditingController emailTFController;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool isInProgress = false;
  @override
  void initState() {
    super.initState();
    emailTFController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailTFController.dispose();
  }

  _handleFP() async {
    String email = emailTFController.text;
    if (email.isEmpty) {
      showMessage(message: Translator.translate("please_fill_email"));
    } else if (Validator.isEmail(email)) {
      showMessage(message: Translator.translate("please_fill_email_proper"));
    } else {
      if (mounted) {
        setState(() {
          isInProgress = true;
        });
      }

      MyResponse myResponse = await AuthController.forgotPassword(email);

      if (myResponse.success) {
        showMessage(
            message: Translator.translate("password_reset_link_was_sent"));
      } else {
        ApiUtil.checkRedirectNavigation(context, myResponse.responseCode);
        showMessage(message: myResponse.errorText);
      }
      if (mounted) {
        setState(() {
          isInProgress = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: ListView(
                      padding: Spacing.top(180),
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            './assets/images/logo.png',
                            color: themeData.colorScheme.primary,
                            width: 54,
                            height: 54,
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: Spacing.top(24),
                            child: Text(
                              Translator.translate("reset_password")
                                  .toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 700,
                                  letterSpacing: 0.5),
                            ),
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 24, 24, 0),
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                                hintText: Translator.translate("email_address"),
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    letterSpacing: 0.1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: themeData.colorScheme.surface,
                                        width: 1.2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: themeData.colorScheme.surface,
                                        width: 1.2)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: themeData.colorScheme.surface,
                                        width: 1.2)),
                                prefixIcon: Icon(
                                  MdiIcons.emailOutline,
                                  size: MySize.size22,
                                ),
                                isDense: true,
                                contentPadding: Spacing.zero),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailTFController,
                          ),
                        ),
                        Container(
                            margin: Spacing.fromLTRB(24, 24, 24, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size48)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData.colorScheme.primary
                                        .withAlpha(100),
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(MySize.size8)),
                                color: themeData.colorScheme.primary,
                                highlightColor: themeData.colorScheme.primary,
                                splashColor: Colors.white.withAlpha(100),
                                padding: Spacing.only(top: 16, bottom: 16),
                                onPressed: () {
                                  if (!isInProgress) {
                                    _handleFP();
                                  }
                                },
                                child: Stack(
                                  overflow: Overflow.visible,
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        Translator.translate("reset")
                                            .toUpperCase(),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            letterSpacing: 0.8,
                                            fontWeight: 700),
                                      ),
                                    ),
                                    Positioned(
                                      right: 16,
                                      child: isInProgress
                                          ? Container(
                                              width: MySize.size16,
                                              height: MySize.size16,
                                              child: CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                              Color>(
                                                          themeData.colorScheme
                                                              .onPrimary),
                                                  strokeWidth: 1.4),
                                            )
                                          : ClipOval(
                                              child: Container(
                                                color: themeData
                                                    .colorScheme.primaryVariant,
                                                child: SizedBox(
                                                    width: MySize.size30,
                                                    height: MySize.size30,
                                                    child: Icon(
                                                      MdiIcons.arrowRight,
                                                      color: themeData
                                                          .colorScheme
                                                          .onPrimary,
                                                      size: MySize.size18,
                                                    )),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Center(
                          child: Container(
                            margin: Spacing.top(16),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                              child: Text(
                                Translator.translate("i_have_not_an_account"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ),
                        // AuthController.notice(themeData)
                      ],
                    ))));
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
