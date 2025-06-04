import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/responsive_helper.dart';
import 'package:app/core/responsive/responsive_sizing.dart';
import 'package:flutter/material.dart';



extension ContextExtension on BuildContext {
  // MediaQuery related
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomNavBarHeight => mediaQuery.padding.bottom;
  double get appBarHeight => AppBar().preferredSize.height;

  //======================================= Orientation related ==========================================
  Orientation get orientation => mediaQuery.orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  //======================================= Device type related ==========================================
  DeviceScreenType get deviceScreenType => getDeviceType(this);
  bool get isMobile => deviceScreenType == DeviceScreenType.mobile;
  bool get isTablet => deviceScreenType == DeviceScreenType.tablet;
  bool get isDesktop => deviceScreenType == DeviceScreenType.desktop;

  //======================================= Responsive Widget Builder ==========================================
  /// Helper method to build responsive layouts based on device type
  Widget responsiveWidget({
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) {
    if (isDesktop && desktop != null) {
      return desktop;
    } else if (isTablet && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }

  // Responsive spacing
  double get responsiveHorizontalSpacing => isMobile
      ? AppSizes.spacing8
      : isTablet
          ? AppSizes.spacing12
          : AppSizes.spacing16;

  double get responsiveVerticalSpacing => isMobile
      ? AppSizes.spacing8
      : isTablet
          ? AppSizes.spacing16
          : AppSizes.spacing24;

  // Responsive sizing
  double responsiveFontSize(double size) =>
      ResponsiveSizing.getResponsiveFontSize(this, size);
  double responsivePadding(double padding) =>
      ResponsiveSizing.getResponsivePadding(this, padding);
  double responsiveSpacing(double spacing) =>
      ResponsiveSizing.getResponsiveSpacing(this, spacing);
  double responsiveWidth({double percentage = 100}) =>
      ResponsiveSizing.getResponsiveWidth(this, percentage: percentage);
  double responsiveHeight({double percentage = 100}) =>
      ResponsiveSizing.getResponsiveHeight(this, percentage: percentage);
  double responsiveIconSize(double size) =>
      ResponsiveSizing.getResponsiveIconSize(this, size);
  double responsiveBorderRadius(double radius) =>
      ResponsiveSizing.getResponsiveBorderRadius(this, radius);
  double get responsiveWidgetHeight =>
      ResponsiveSizing.getResponsiveButtonHeight(this);

  EdgeInsets responsiveEdgeInsets({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      ResponsiveSizing.getResponsiveEdgeInsets(
        this,
        horizontal: horizontal,
        vertical: vertical,
      );

/// حساب حجم العنصر نسبة إلى الحاوية الأب
  /// يُستخدم لضبط حجم الأزرار وحقول الإدخال داخل الحاويات
  ///
  /// [containerSize]: حجم الحاوية (عرض أو ارتفاع)
  /// [percentage]: النسبة المئوية من حجم الحاوية
  /// [baseSize]: الحجم الأساسي إذا كان الحساب النسبي صغيرًا جدًا
  /// [maxSize]: الحد الأقصى للحجم
  double relativeToContainerSize({
    required double containerSize,
    required double percentage,
    double baseSize = 40,
    double? maxSize,
  }) =>
      ResponsiveSizing.getRelativeToContainerSize(
        containerSize: containerSize,
        percentage: percentage,
        baseSize: baseSize,
        maxSize: maxSize,
      );

  /// حساب الحجم النسبي للحاوية مع مراعاة نوع الجهاز
  ///
  /// [containerSize]: حجم الحاوية (عرض أو ارتفاع)
  /// [percentage]: النسبة المئوية من حجم الحاوية
  /// [minSize]: الحد الأدنى للحجم
  /// [maxSize]: الحد الأقصى للحجم
  double responsiveRelativeSize({
    required double containerSize,
    required double percentage,
    double? minSize,
    double? maxSize,
  }) =>
      ResponsiveSizing.getResponsiveRelativeSize(
        context: this,
        containerSize: containerSize,
        percentage: percentage,
        minSize: minSize,
        maxSize: maxSize,
      );

  // Theme related
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  bool get isDarkMode => theme.brightness == Brightness.dark;
  bool get isLightMode => theme.brightness == Brightness.light;

  //======================================= Navigation related ==========================================
  NavigatorState get navigator => Navigator.of(this);
}
