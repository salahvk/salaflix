import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _getTextStyle(double fontSize, Color color, FontWeight fontWeight) {
  return GoogleFonts.lexendDeca(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegularStyle({
  double fontSize = 12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.regular,
  );
}

TextStyle getLightStyle({
  double fontSize = 12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.light,
  );
}

TextStyle getMediumtStyle({
  double fontSize = 12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.medium,
  );
}

TextStyle getSemiBoldtStyle({
  double fontSize = 12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.semiBold,
  );
}

TextStyle getBoldtStyle({
  double fontSize = 12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.bold,
  );
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}
