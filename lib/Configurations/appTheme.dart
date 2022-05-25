import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_city/Configurations/color.dart';



class AppTheme {
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
  themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: AppColors.white),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      focusColor: AppColors.primaryColor,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    primaryVariant: AppColors.secondaryColor,
    secondary: AppColors.primaryColor,
    secondaryVariant: AppColors.primaryColor,
    background: Color(0xffF7F7F7),
    surface: Color(0xFFFAFBFB),
    onBackground: AppColors.primaryColor,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  // static const _superBold = FontWeight.w900;
  static const _bold = FontWeight.w500;
  // static const _semiBold = FontWeight.w600;
  // static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: 24,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline2: GoogleFonts.poppins(
      color: AppColors.black,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    headline3: GoogleFonts.poppins(
      color: AppColors.black,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    headline4: GoogleFonts.poppins(
      color: AppColors.black,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    headline5: GoogleFonts.poppins(
      color: AppColors.black,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    headline6: GoogleFonts.poppins(
      color: AppColors.black,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: GoogleFonts.poppins(
      fontSize: 17,
      color: AppColors.black,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: GoogleFonts.poppins(
      color: AppColors.black,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: GoogleFonts.poppins(
      color: AppColors.primaryText2,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: GoogleFonts.poppins(
      color: AppColors.black,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    button: GoogleFonts.poppins(
      color: AppColors.black,
      fontStyle: FontStyle.normal,
      fontWeight: _regular,
    ),
    caption: GoogleFonts.poppins(
      color: AppColors.primaryText1,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
  );
}