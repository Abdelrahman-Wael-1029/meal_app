import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontFamily: FontConstans.fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getLightStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSizeManager.size12,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

TextStyle getRegularStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSizeManager.size12,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

TextStyle getMediumStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSizeManager.size12,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

TextStyle getBoldStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSizeManager.size12,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}

TextStyle getExtraBoldStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSizeManager.size12,
    fontWeight: FontWeightManager.extraBold,
    color: color,
  );
}

TextStyle getThinStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSizeManager.size12,
    fontWeight: FontWeightManager.thin,
    color: color,
  );
}

TextStyle getExtraLightStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize ?? FontSizeManager.size12,
    fontWeight: FontWeightManager.extraLight,
    color: color,
  );
}

TextStyle getSemiboldStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSizeManager.size12,
      fontWeight: FontWeightManager.semiBold,
      color: color,
  );
}
