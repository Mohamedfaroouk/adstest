import 'package:flutter/material.dart';
import 'package:newads/constants.dart';

Text defaultText(String text,
    {TextAlign? align,
    TextStyle? style,
    Color? color,
    double? fontsize,
    String? fontFamily,
    FontWeight? weight}) {
  return Text(
    text,
    textAlign: align ?? TextAlign.center,
    style: style ??
        TextStyle(
          color: color ?? mainFontColor,
          fontWeight: weight,
          fontSize: fontsize,
        ),
  );
}
