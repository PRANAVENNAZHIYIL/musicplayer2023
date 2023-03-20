import 'package:flutter/material.dart';

import 'colors.dart';

const bold = "Bold";
const italic = "ExtraLightItalic";

ourStyle({
  String? fontFamily = "bold",
  double? fontsize = 14,
  Color? color = whiteColor,
}) {
  return TextStyle(fontSize: fontsize, color: color, fontFamily: fontFamily);
}
