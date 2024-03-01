import 'package:flutter/material.dart';
import 'package:sekawan_media_test/core/app_color.dart';

/// FONT SIZE
const double fontSize64 = 64.0;
const double fontSize54 = 54.0;
const double fontSize48 = 48.0;
const double fontSize40 = 40.0;
const double fontSize32 = 32.0;
const double fontSize24 = 24.0;
const double fontSize20 = 20.0;
const double fontSize16 = 16.0;
const double fontSize14 = 14.0;
const double fontSize12 = 12.0;
const double fontSize10 = 10.0;

/// FONT WEIGHT
const FontWeight fontWeightRegular = FontWeight.w400;
const FontWeight fontWeightMedium = FontWeight.w500;
const FontWeight fontWeightSemiBold = FontWeight.w600;
const FontWeight fontWeightBold = FontWeight.w700;
const FontWeight fontWeightExtraBold = FontWeight.w800;

// TEXT DECORATION
const TextDecoration txtDecorNone = TextDecoration.none;
const TextDecoration txtDecorUnderline = TextDecoration.underline;
const TextDecoration txtDecorLineThrough = TextDecoration.lineThrough;

// DISPLAY
const TextStyle display1 = TextStyle(
  fontSize: fontSize64,
  height: 82 / fontSize64,
  fontWeight: fontWeightRegular,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);
const TextStyle display2 = TextStyle(
  fontSize: fontSize54,
  height: 54 / fontSize54,
  fontWeight: fontWeightRegular,
  decoration: txtDecorUnderline,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);
const TextStyle display3 = TextStyle(
  fontSize: fontSize48,
  height: 48 / fontSize48,
  fontWeight: fontWeightRegular,
  decoration: txtDecorLineThrough,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);

// HEADING
const TextStyle heading1 = TextStyle(
  fontSize: fontSize40,
  height: 52 / fontSize40,
  fontWeight: fontWeightBold,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);
const TextStyle heading2 = TextStyle(
  fontSize: fontSize32,
  height: 40 / fontSize32,
  fontWeight: fontWeightBold,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);
const TextStyle heading3 = TextStyle(
  fontSize: fontSize24,
  height: 32 / fontSize24,
  fontWeight: fontWeightBold,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);
const TextStyle heading4 = TextStyle(
  fontSize: fontSize20,
  height: 28 / fontSize20,
  fontWeight: fontWeightSemiBold,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);
const TextStyle heading5 = TextStyle(
  fontSize: fontSize16,
  height: 20 / fontSize16,
  fontWeight: fontWeightSemiBold,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);
const TextStyle heading6 = TextStyle(
  fontSize: fontSize14,
  height: 18 / fontSize14,
  fontWeight: fontWeightSemiBold,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);

// PARAGRAPH
const TextStyle paragraph1 = TextStyle(
  fontSize: fontSize16,
  height: 24 / fontSize16,
  fontWeight: fontWeightRegular,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);
const TextStyle paragraph2 = TextStyle(
  fontSize: fontSize14,
  height: 22 / fontSize14,
  fontWeight: fontWeightRegular,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);

// CAPTION
const TextStyle caption1 = TextStyle(
  fontSize: fontSize12,
  height: 18 / fontSize12,
  fontWeight: fontWeightRegular,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);
const TextStyle caption2 = TextStyle(
  fontSize: fontSize10,
  height: 15 / fontSize10,
  fontWeight: fontWeightRegular,
  decoration: txtDecorNone,
  leadingDistribution: TextLeadingDistribution.even,
  color: AppColor.darkBlue,
);
