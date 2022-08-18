import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff1ac1dd);
const kSecondaryColor = Color(0xff11476c);
const kAlternativeColor = Color(0xff9d9d9d);
const kBackgroundColor = Color(0xffffffff);
const kDangerColor = Color(0xffde6554);

ThemeData customLightTheme() {
  final ThemeData lightTheme = ThemeData.light();

  return lightTheme.copyWith(
      textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
      primaryColor: kPrimaryColor,
      indicatorColor: kSecondaryColor,
      hintColor: kAlternativeColor,
      appBarTheme: const AppBarTheme(
        color: kPrimaryColor,
      ),
      scaffoldBackgroundColor: kBackgroundColor,
      primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
        color: Colors.white,
        // size: 20,
      ),
      iconTheme: lightTheme.iconTheme.copyWith(
          // color: Colors.white,
          ),
      backgroundColor: Colors.white,
      tabBarTheme: lightTheme.tabBarTheme.copyWith(
        labelColor: kPrimaryColor,
        unselectedLabelColor: kAlternativeColor,
      ),
      buttonTheme: _customButtomThemeData(),
      errorColor: kDangerColor,
      elevatedButtonTheme: _customElevatedButton());
}

// buttons
ButtonThemeData _customButtomThemeData() {
  return ThemeData.light().buttonTheme.copyWith(
        buttonColor: kPrimaryColor,
        textTheme: ButtonTextTheme.primary,
      );
}

ElevatedButtonThemeData _customElevatedButton() {
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    primary: kPrimaryColor,
    onPrimary: Colors.white,
  ));
}

// text
TextTheme _customLightThemesTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1?.copyWith(
      // fontFamily: 'Roboto',
      fontSize: 22.0,
      color: Colors.blueGrey[800],
    ),
    headline2: base.headline2?.copyWith(
      // fontFamily: 'Roboto',
      fontSize: 18.0,
      color: kSecondaryColor,
    ),
    headline3: base.headline3?.copyWith(
      // fontFamily: 'Roboto',
      fontSize: 25.0,
      fontWeight: FontWeight.w600,
      color: kSecondaryColor,
    ),
    headline5: base.headline5?.copyWith(
      // fontFamily: 'Roboto',
      fontSize: 28.0,
      color: kSecondaryColor,
    ),
    headline6: base.headline6?.copyWith(
      // fontFamily: 'Roboto',
      fontSize: 12.0,
      color: kSecondaryColor,
    ),
    bodyText1: base.bodyText1?.copyWith(
      color: kDangerColor,
      fontWeight: FontWeight.w600,
    ),
    subtitle1: base.subtitle1?.copyWith(
      color: kSecondaryColor,
      fontSize: 12,
    ),
    button: base.button?.copyWith(
      color: kAlternativeColor,
      fontWeight: FontWeight.w700,
    ),
  );
}
