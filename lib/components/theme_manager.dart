import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';
import 'styles_manager.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: GoogleFonts.lexendDeca().fontFamily,
      scaffoldBackgroundColor: ColorManager.background,
      primaryColor: ColorManager.primary,
      colorScheme: const ColorScheme.dark(
        primary: ColorManager.primary,
        secondary: ColorManager.secondary,
        surface: ColorManager.background,
        onSurface: ColorManager.whiteText,
      ),
      canvasColor: ColorManager.background,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        primary: ColorManager.primary,
        onPrimary: ColorManager.whiteText,
        textStyle: getRegularStyle(
          color: ColorManager.whiteText,
        ),
      )),
      textTheme: TextTheme(
        headline1: getBoldtStyle(
          color: ColorManager.whiteText,
          fontSize: 24,
        ),
        headline2: getMediumtStyle(
          color: ColorManager.primary,
          fontSize: 28,
        ),
        headline3: getMediumtStyle(
          color: ColorManager.whiteText,
          fontSize: 20,
        ),
        subtitle1: getMediumtStyle(
          color: ColorManager.grayLight,
          fontSize: 18,
        ),
        subtitle2: getRegularStyle(
          color: ColorManager.grayLight,
          fontSize: 16,
        ),
        bodyText1: getRegularStyle(
          color: ColorManager.grayLight,
          fontSize: 14,
        ),
        bodyText2: getRegularStyle(
          color: ColorManager.whiteText,
          fontSize: 14,
        ),
      ),
      disabledColor: ColorManager.disabledColor,
      inputDecorationTheme: InputDecorationTheme(
        // contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
        filled: true,
        fillColor: ColorManager.darkBackground,
        hintStyle: getSemiBoldtStyle(
            color: ColorManager.tertiary.withOpacity(.5), fontSize: 16),
        labelStyle:
            getSemiBoldtStyle(color: ColorManager.tertiary.withOpacity(.5)),
        floatingLabelStyle:
            getSemiBoldtStyle(color: ColorManager.primary.withOpacity(.8)),

        focusColor: ColorManager.primary,
        // contentPadding: EdgeInsets.only(
        //   left: 10,
        //   right: 10,
        // ),

        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: ColorManager.whiteColor, width: .5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorManager.whiteColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorManager.errorRed,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: ColorManager.grayLight,
        size: 18,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorManager.grayLight,
        foregroundColor: ColorManager.whiteText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));
}
