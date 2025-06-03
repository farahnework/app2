import 'package:flutter/material.dart';

import '../../shared/utils/app_colors.dart';
import '../responsive/app_sizes.dart' show AppSizes;
import '../responsive/responsive_sizing.dart';
import 'font_weight_helper.dart';

class AppStyles {
  static var textStyle16;

  const AppStyles._();

  // Desktop specific styles
  static final tableHeader = TextStyle(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.bold,
      fontSize: AppSizes.fontSize2);

  static final header1 = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w900,
      fontSize: AppSizes.fontSize1);

  static final header2 = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w600,
      fontSize: AppSizes.fontSize2);

  static final body =
      TextStyle(color: AppColors.black, fontSize: AppSizes.fontSize2);

  static final buttonTextStyle =
      TextStyle(color: AppColors.white, fontSize: AppSizes.fontSize2);

  static final subtitle1 = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontSize: AppSizes.fontSize3);

  // Title styles
  static TextStyle titleLarge(BuildContext context) =>
      ResponsiveSizing.getResponsiveTextStyle(
        context: context,
        fontSize: 16,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle titleMedium(BuildContext context) =>
      ResponsiveSizing.getResponsiveTextStyle(
        context: context,
        fontSize: 14,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle titleSmall(BuildContext context) =>
      ResponsiveSizing.getResponsiveTextStyle(
        context: context,
        fontSize: 12,
        fontWeight: FontWeightHelper.medium,
      );

  // Body styles
  static TextStyle bodyLarge(BuildContext context) =>
      ResponsiveSizing.getResponsiveTextStyle(
        context: context,
        fontSize: 14,
        fontWeight: FontWeightHelper.regular,
      );

  static TextStyle bodyMedium(BuildContext context) =>
      ResponsiveSizing.getResponsiveTextStyle(
        context: context,
        fontSize: 12,
        fontWeight: FontWeightHelper.regular,
      );

  static TextStyle bodySmall(BuildContext context) =>
      ResponsiveSizing.getResponsiveTextStyle(
        context: context,
        fontSize: 10,
        fontWeight: FontWeightHelper.regular,
      );

  // Label styles
  static TextStyle labelLarge(BuildContext context) =>
      ResponsiveSizing.getResponsiveTextStyle(
        context: context,
        fontSize: 14,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle labelMedium(BuildContext context) =>
      ResponsiveSizing.getResponsiveTextStyle(
        context: context,
        fontSize: 12,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle labelSmall(BuildContext context) =>
      ResponsiveSizing.getResponsiveTextStyle(
        context: context,
        fontSize: 6,
        fontWeight: FontWeightHelper.semiBold,
      );
}
