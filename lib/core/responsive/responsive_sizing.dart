
import 'package:app/core/responsive/app_sizes.dart';
import 'package:flutter/material.dart';

/// مساعد للتصميم المتجاوب بناءً على أبعاد الشاشة
class ResponsiveSizing {
  /// الحد الأدنى لعرض الشاشة للأجهزة اللوحية
  static const double tabletBreakpoint = 600;

  /// الحد الأدنى لعرض الشاشة لأجهزة سطح المكتب
  static const double desktopBreakpoint = 1024;

  /// معامل قياس للتصميم المتجاوب
  static const double defaultScaleFactor = 0.0025;

  /// أقصى عرض للمحتوى على الشاشات الكبيرة
  static const double maxContentWidth = 2400;

  /// الحصول على حجم نص متجاوب بناء على أبعاد الشاشة وكثافة البكسل
  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final pixelRatio = mediaQuery.devicePixelRatio;
    final adjustedWidth =
        screenWidth / pixelRatio; // العرض المعدل بناءً على كثافة البكسل

    // استخدام النقاط المحددة في الكود الأصلي
    const double mobileMaxWidth = tabletBreakpoint; // 600
    const double tabletMaxWidth = desktopBreakpoint; // 1024

    // حساب معامل القياس بناءً على عرض الشاشة
    double scaleFactor;

    if (adjustedWidth < mobileMaxWidth) {
      // للجوال: مقياس خطي من 0.8 إلى 1.0 بناءً على العرض
      scaleFactor = 1.7 + (adjustedWidth / mobileMaxWidth) * 2;
    } else if (adjustedWidth < tabletMaxWidth) {
      // للأجهزة اللوحية: مقياس خطي من 1.0 إلى 1.2
      scaleFactor = 1.0 +
          ((adjustedWidth - mobileMaxWidth) /
                  (tabletMaxWidth - mobileMaxWidth)) *
              2; //////////////////////old value was 0.2
    } else {
      // لسطح المكتب والشاشات الكبيرة: مقياس ديناميكي مع حد أقصى
      final effectiveWidth =
          adjustedWidth.clamp(tabletMaxWidth, maxContentWidth / pixelRatio);
      scaleFactor = 1.2 +
          ((effectiveWidth - tabletMaxWidth) /
                  (maxContentWidth / pixelRatio - tabletMaxWidth)) *
              0.2;
      // تقليل معامل القياس للشاشات الكبيرة جداً
      if (adjustedWidth > maxContentWidth / pixelRatio) {
        scaleFactor *= 0.85;
      }
    }

    // تطبيق معامل القياس الافتراضي لضبط دقيق
    scaleFactor *= (1 + defaultScaleFactor * adjustedWidth);

    // حساب الحجم النهائي
    const double minFontSize = 12.0; // الحد الأدنى للحجم
    const double maxFontSize = 28.0; // الحد الأقصى للحجم
    final responsiveSize = baseSize * scaleFactor;

    // التأكد من أن الحجم ضمن النطاق المسموح
    return responsiveSize.clamp(minFontSize, maxFontSize);
  }

  /// الحصول على نمط نص متجاوب
  static TextStyle getResponsiveTextStyle({
    required BuildContext context,
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize),
      fontWeight: fontWeight,
      color: color,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  /// التحقق مما إذا كانت الشاشة تعتبر شاشة جوال
  static bool isMobile(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < tabletBreakpoint;
  }

  /// التحقق مما إذا كانت الشاشة تعتبر شاشة جهاز لوحي
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= tabletBreakpoint && width < desktopBreakpoint;
  }

  /// التحقق مما إذا كانت الشاشة تعتبر شاشة سطح مكتب
  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= desktopBreakpoint;
  }

  /// الحصول على حجم وسادة متجاوب بناء على عرض الشاشة وحجم الأساس
  static double getResponsivePadding(BuildContext context, double basePadding) {
    if (isDesktop(context)) {
      return basePadding * 1.5;
    } else if (isTablet(context)) {
      return basePadding * 1.2;
    } else {
      return basePadding *0.7;
    }
  }

  /// الحصول على حجم تباعد متجاوب بناء على عرض الشاشة وحجم الأساس
  static double getResponsiveSpacing(BuildContext context, double baseSpacing) {
    if (isDesktop(context)) {
      return baseSpacing * 2;
    } else if (isTablet(context)) {
      return baseSpacing * 1.5;
    } else {
      return baseSpacing;
    }
  }

  /// الحصول على عرض حاوية متجاوب بناء على عرض الشاشة والنسبة المئوية
  static double getResponsiveWidth(BuildContext context,
      {double percentage = 100}) {
    final width = MediaQuery.of(context).size.width * (percentage / 100);

    if (isDesktop(context) && width > maxContentWidth) {
      return maxContentWidth;
    }

    return width;
  }

  /// الحصول على ارتفاع حاوية متجاوب بناء على ارتفاع الشاشة والنسبة المئوية
  static double getResponsiveHeight(BuildContext context,
      {double percentage = 100}) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  /// الحصول على حجم أيقونة متجاوب
  static double getResponsiveIconSize(BuildContext context, double baseSize) {
    if (isDesktop(context)) {
      return baseSize * 1.5;
    } else if (isTablet(context)) {
      return baseSize * 1;
    } else {
      return baseSize *1.1;
    }
  }

  /// الحصول على قيمة نصف قطر الحواف المتجاوب
  static double getResponsiveBorderRadius(
      BuildContext context, double baseRadius) {
    if (isDesktop(context)) {
      return baseRadius * 1.5;
    } else if (isTablet(context)) {
      return baseRadius * 1.2;
    } else {
      return baseRadius;
    }
  }


  /// حساب حجم العنصر بالنسبة للحاوية التي تحتويه
  /// يستخدم لتحديد حجم الأزرار وحقول الإدخال بشكل نسبي للحاوية وليس الشاشة
  ///
  /// [containerSize]: حجم الحاوية (العرض أو الارتفاع)
  /// [percentage]: النسبة المئوية من حجم الحاوية
  /// [baseSize]: الحجم الأساسي للعنصر إذا كان الحساب النسبي صغيرًا جدًا
  /// [maxSize]: الحد الأقصى لحجم العنصر
  static double getRelativeToContainerSize({
    required double containerSize,
    required double percentage,
    double baseSize = 40,
    double? maxSize,
  }) {
    // حساب الحجم النسبي للعنصر داخل الحاوية
    final calculatedSize = containerSize * (percentage / 100);

    // استخدام القيمة الأكبر بين الحجم المحسوب والحجم الأساسي
    double result = calculatedSize > baseSize ? calculatedSize : baseSize;

    // التأكد من أن الحجم لا يتجاوز الحد الأقصى إذا تم تحديده
    if (maxSize != null && result > maxSize) {
      result = maxSize;
    }

    return result;
  }

  /// حساب أبعاد العناصر بشكل نسبي للحاوية الأب مع مراعاة نوع الجهاز
  ///
  /// [context]: سياق البناء للوصول إلى معلومات الشاشة
  /// [containerSize]: حجم الحاوية (العرض أو الارتفاع)
  /// [percentage]: النسبة المئوية من حجم الحاوية
  /// [minSize]: الحد الأدنى لحجم العنصر
  /// [maxSize]: الحد الأقصى لحجم العنصر
  static double getResponsiveRelativeSize({
    required BuildContext context,
    required double containerSize,
    required double percentage,
    double? minSize,
    double? maxSize,
  }) {
    // ضبط النسبة المئوية بناء على نوع الجهاز
    double adjustedPercentage = percentage;

    if (isDesktop(context)) {
      // تقليل النسبة للشاشات الكبيرة لتجنب العناصر الكبيرة جدًا
      adjustedPercentage = percentage * 0.77;
    } else if (isTablet(context)) {
      // ضبط طفيف للأجهزة اللوحية
      adjustedPercentage = percentage * 0.9;
    } else if (isMobile(context)) {
      adjustedPercentage = percentage * 0.7;
    }

    // حساب الحجم النسبي
    double size = containerSize * (adjustedPercentage / 100);

    // تطبيق الحدود الدنيا والقصوى إذا تم تحديدها
    if (minSize != null && size < minSize) {
      size = minSize;
    }

    if (maxSize != null && size > maxSize) {
      size = maxSize;
    }

    return size;
  }

  /// الحصول على قيمة ارتفاع الزر المتجاوب
  static double getResponsiveButtonHeight(BuildContext context) {
    if (isDesktop(context)) {
      return AppSizes.buttonHeight * 1.2;
    } else if (isTablet(context)) {
      return AppSizes.buttonHeight * 1;
    } else {
      return AppSizes.buttonHeight;
    }
  }

  /// الحصول على قيمة عرض الزر المتجاوب
  static double getResponsiveButtonWidth(
    BuildContext context, {
    double percentage = 100,
    double minWidth = 120,
    double maxWidth = 300,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final calculatedWidth = screenWidth * (percentage / 100);

    if (isDesktop(context)) {
      return calculatedWidth.clamp(minWidth * 1.5, maxWidth);
    } else if (isTablet(context)) {
      return calculatedWidth.clamp(minWidth * 1.2, maxWidth * 0.8);
    } else {
      return calculatedWidth.clamp(minWidth, maxWidth * 0.6);
    }
  }

  /// إنشاء مكون متجاوب بناء على حجم الشاشة
  static Widget responsiveBuilder({
    required BuildContext context,
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }

  /// الحصول على EdgeInsets متجاوب بناء على حجم الشاشة
  static EdgeInsets getResponsiveEdgeInsets(
    BuildContext context, {
    double horizontal = AppSizes.horizontalPadding,
    double vertical = AppSizes.verticalPadding,
  }) {
    return EdgeInsets.symmetric(
      horizontal: getResponsivePadding(context, horizontal),
      vertical: getResponsivePadding(context, vertical),
    );
  }
}
