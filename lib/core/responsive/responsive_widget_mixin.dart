import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:flutter/material.dart';

mixin ResponsiveWidgetMixin {
  /// Get a responsive dimension value based on screen size
  double getResponsiveSize(BuildContext context, double size,
      {double? min, double? max}) {
    final responsiveSize = context.responsivePadding(size);
    if (min != null && responsiveSize < min) return min;
    if (max != null && responsiveSize > max) return max;
    return responsiveSize;
  }

  /// Get responsive padding based on device type
  EdgeInsetsGeometry getResponsivePadding(
    BuildContext context, {
    double? horizontal,
    double? vertical,
    double? all,
  }) {
    if (all != null) {
      final padding = context.responsivePadding(all);
      return EdgeInsets.all(padding);
    }

    return EdgeInsets.symmetric(
      horizontal:
          horizontal != null ? context.responsivePadding(horizontal) : 0,
      vertical: vertical != null ? context.responsivePadding(vertical) : 0,
    );
  }

  /// Get responsive border radius
  BorderRadius getResponsiveBorderRadius(BuildContext context, double radius) {
    return BorderRadius.circular(context.responsiveBorderRadius(radius));
  }

  /// Get responsive font size
  double getResponsiveFontSize(BuildContext context, double fontSize) {
    return context.responsiveFontSize(fontSize);
  }

  /// Get responsive icon size
  double getResponsiveIconSize(BuildContext context, double iconSize) {
    return context.responsiveIconSize(iconSize);
  }

  /// Get responsive width as percentage of screen width
  double getResponsiveWidth(BuildContext context,
      {double percentage = 100, double? max}) {
    final width = context.responsiveWidth(percentage: percentage);
    return max != null && width > max ? max : width;
  }

  /// Get responsive height as percentage of screen height
  double getResponsiveHeight(BuildContext context,
      {double percentage = 100, double? max}) {
    final height = context.responsiveHeight(percentage: percentage);
    return max != null && height > max ? max : height;
  }

  /// Get responsive spacing
  double getResponsiveSpacing(BuildContext context, double spacing) {
    return context.responsiveSpacing(spacing);
  }

  /// Get default responsive values for common properties
  Map<String, dynamic> getDefaultResponsiveValues(BuildContext context) {
    return {
      'iconSize': context.responsiveIconSize(AppSizes.iconSize),
      'spacing': context.responsiveSpacing(AppSizes.spacing8),
      'padding': context.responsivePadding(AppSizes.spacing16),
      'borderRadius': context.responsiveBorderRadius(AppSizes.radius8),
      'fontSize': context.responsiveFontSize(AppSizes.fontSize3),
    };
  }
}
