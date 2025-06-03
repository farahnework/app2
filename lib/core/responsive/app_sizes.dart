import 'package:flutter/material.dart';

class AppSizes {
  const AppSizes._();

  static const Size screenSize = Size(373, 810);

  //======================================= Padding ==========================================
  static const double horizontalPadding = 20.0;
  static const double verticalPadding = 20.0;
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    horizontal: horizontalPadding,
    vertical: verticalPadding,
  );

  //======================================= Radius ==========================================
  static const double radius4 = 2.0;
  static const double radius8 = 6.0;
  static const double radius12 = 10.0;
  static const double radius16 = 14.0;
  static const double radius24 = 22.0;
  static const double radius32 = 30.0;

  //======================================= Spacing ==========================================
  static const double spacing2 = 1.0;
  static const double spacing4 = 2.0;
  static const double  spacing8 = 6.0;
  static const double spacing12 = 10.0;
  static const double spacing16 = 14.0;
  static const double spacing24 = 22.0;
  static const double spacing32 = 30.0;
  static const double spacing40 = 38.0;
  static const double spacing48 = 46.0;
  static const double spacing56 = 54.0;
  static const double spacing64 = 62.0;
  static const double spacing72 = 70.0;
  static const double spacing80 = 78.0;

  //======================================= Elevation ==========================================
  static const double elevation1 = -1.0;
  static const double elevation2 = 0.0;
  static const double elevation3 = 1.0;
  static const double elevation4 = 2.0;
  static const double elevation6 = 4.0;
  static const double elevation8 = 6.0;

  //======================================= Button ==========================================
  static const double buttonHeight = 40.0;
  static const double buttonHeightSmall = 34.0;

  //======================================= Desktop Specific ==========================================
  // Desktop specific measurements for larger screens
  static const double textFieldRadius = 16.0;

  // Desktop paddings[]
  static const double cardPadding = 16.0;

  // Desktop spaces
  static const double verSpacesBetweenElements = 10.0;
  static const double horiSpacesBetweenElements = 10.0;
  static const double horiSpacesBetweentTexts = 5.0;
  static const double verSpacesBetweenContainers = 32.0;

  // Desktop heights
  static const double widgetHeight = 50.0;

  // Desktop sizes
  static const double iconSize = 20.0;
  static const double iconSize2 = 15.0;
  static const double iconButtonSize = 40.0;
  static const double borderSize = 0.5;
  static const double fontSize1 = 4.5;
  static const double fontSize2 = 4.0;
  static const double fontSize3 = 3.5;
  static const double fontSize4 = 3.2;
  static const double fontSize5 = 2.0;
  static const double fontSize6 = 0.5;
  static const FontWeight fontWeight1 = FontWeight.w700;
  static const FontWeight fontWeight2 = FontWeight.w600;

  // Desktop action buttons
  static const double actionButtonWidth = 120.0;
  static const double actionButtonHeight = 40.0;
  static const double actionButtonSpacing = 8.0;

  //======================================= Screen ==========================================
  static BorderRadius standardBorderRadius = BorderRadius.circular(radius16);
}
