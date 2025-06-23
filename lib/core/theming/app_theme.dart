import 'package:flutter/material.dart';

import '../../shared/utils/app_colors.dart';
import '../responsive/app_sizes.dart' show AppSizes;
import 'font_weight_helper.dart';

/// مدير الثيمات للتطبيق
/// يوفر ثيمات متسقة للوضع الفاتح والداكن
class AppTheme {
  AppTheme._();

  /// ثيم الوضع الفاتح
  static ThemeData get lightTheme {
    return ThemeData(
      // ألوان أساسية
      primaryColor: AppColors.darkPurple,
      primaryColorLight: AppColors.lightPurple,
      scaffoldBackgroundColor: AppColors.lightGrey,
      cardColor: AppColors.white,
      dividerColor: AppColors.lightGrey,

      // ألوان التفاعل
      colorScheme: ColorScheme.light(
        primary: AppColors.darkPurple,
        secondary: AppColors.lightPurple,
        surface: AppColors.lightGrey,
        error: AppColors.red,
        onPrimary: AppColors.white,
        onSecondary: AppColors.darkPurple,
        onSurface: AppColors.black,
        onError: AppColors.white,
      ),

      // خط التطبيق
      fontFamily: 'Cairo',

      // أنماط النصوص
      textTheme: _buildTextTheme(),

      // أزرار التطبيق
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      textButtonTheme: _buildTextButtonTheme(),
      outlinedButtonTheme: _buildOutlinedButtonTheme(),

      // مدخلات النصوص
      inputDecorationTheme: _buildInputDecorationTheme(),

      // البطاقات
      cardTheme: CardTheme(
        color: AppColors.white,
        elevation: 2,
        margin: EdgeInsets.all(AppSizes.spacing8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius8),
        ),
      ),

      // شريط التطبيق
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.darkPurple,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.darkPurple,
          fontSize: AppSizes.fontSize3,
          fontWeight: FontWeightHelper.semiBold,
          fontFamily: 'Cairo',
        ),
        iconTheme: IconThemeData(
          color: AppColors.darkPurple,
          size: AppSizes.iconSize,
        ),
      ),

      // جدول البيانات
      dataTableTheme: DataTableThemeData(
        headingRowColor: WidgetStateProperty.all(AppColors.lightPurple),
        dataRowColor: WidgetStateProperty.all(AppColors.white),
        headingTextStyle: TextStyle(
          color: AppColors.darkPurple,
          fontWeight: FontWeightHelper.bold,
          fontSize: AppSizes.fontSize2,
        ),
        dataTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: AppSizes.fontSize2,
        ),
        dividerThickness: 1,
      ),

      // شريط التبويبات
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.darkPurple,
        unselectedLabelColor: AppColors.darkGray,
        indicatorColor: AppColors.darkPurple,
        labelStyle: TextStyle(
          fontSize: AppSizes.fontSize2,
          fontWeight: FontWeightHelper.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: AppSizes.fontSize2,
          fontWeight: FontWeightHelper.medium,
        ),
      ),

      // تبديل الوضع
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.darkPurple;
          }
          return AppColors.lightGrey;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.lightPurple;
          }
          return AppColors.grey;
        }),
      ),

      // دائرة التقدم
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.darkPurple,
        circularTrackColor: AppColors.lightPurple.withValues(alpha:  0.3),
      ),

      // مؤشر القائمة المنسدلة
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: _buildInputDecorationTheme(),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.white),
          elevation: WidgetStateProperty.all(4),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius8),
          )),
        ),
      ),
    );
  }

  /// ثيم الوضع الداكن
  static ThemeData get darkTheme {
    final lightThemeData = lightTheme;

    return lightThemeData.copyWith(
      // ألوان أساسية
      primaryColor: AppColors.lightPurple,
      scaffoldBackgroundColor: const Color(0xFF121212),
      cardColor: const Color(0xFF1E1E1E),
      dividerColor: const Color(0xFF323232),

      // ألوان التفاعل
      colorScheme: ColorScheme.dark(
        primary: AppColors.lightPurple,
        secondary: AppColors.darkPurple,
        surface: const Color(0xFF1E1E1E),
        error: AppColors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onError: Colors.white,
      ),

      // شريط التطبيق
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: AppSizes.fontSize3,
          fontWeight: FontWeightHelper.semiBold,
          fontFamily: 'Cairo',
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: AppSizes.iconSize,
        ),
      ),

      // البطاقات
      cardTheme: CardTheme(
        color: const Color(0xFF1E1E1E),
        elevation: 2,
        margin: EdgeInsets.all(AppSizes.spacing8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius8),
        ),
      ),
    );
  }

  /// بناء أنماط النصوص
  static TextTheme _buildTextTheme() {
    return TextTheme(
      // أنماط العرض
      displayLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 40,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.black,
      ),

      // أنماط العناوين
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeightHelper.semiBold,
        color: AppColors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeightHelper.semiBold,
        color: AppColors.black,
      ),

      // أنماط العناوين الفرعية
      titleLarge: TextStyle(
        fontSize: AppSizes.fontSize2 + 2,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.black,
      ),
      titleMedium: TextStyle(
        fontSize: AppSizes.fontSize2,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.black,
      ),
      titleSmall: TextStyle(
        fontSize: AppSizes.fontSize1,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.black,
      ),

      // أنماط النصوص الرئيسية
      bodyLarge: TextStyle(
        fontSize: AppSizes.fontSize2,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: AppSizes.fontSize1,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontSize: AppSizes.fontSize1 - 2,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.darkGray,
      ),

      // أنماط التسميات
      labelLarge: TextStyle(
        fontSize: AppSizes.fontSize1,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.darkGray,
      ),
      labelMedium: TextStyle(
        fontSize: AppSizes.fontSize1 - 1,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.darkGray,
      ),
      labelSmall: TextStyle(
        fontSize: AppSizes.fontSize1 - 2,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.darkGray,
      ),
    );
  }

  /// بناء أنماط الأزرار المرتفعة
  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPurple,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          fontSize: AppSizes.fontSize2,
          fontWeight: FontWeightHelper.bold,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.spacing16,
          vertical: AppSizes.spacing12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius8),
        ),
        elevation: 0,
      ),
    );
  }

  /// بناء أنماط أزرار النصوص
  static TextButtonThemeData _buildTextButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkPurple,
        textStyle: TextStyle(
          fontSize: AppSizes.fontSize2,
          fontWeight: FontWeightHelper.medium,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.spacing12,
          vertical: AppSizes.spacing8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius8),
        ),
      ),
    );
  }

  /// بناء أنماط الأزرار المحاطة
  static OutlinedButtonThemeData _buildOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkPurple,
        side: BorderSide(color: AppColors.darkPurple, width: 1),
        textStyle: TextStyle(
          fontSize: AppSizes.fontSize2,
          fontWeight: FontWeightHelper.medium,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.spacing16,
          vertical: AppSizes.spacing12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius8),
        ),
      ),
    );
  }

  /// بناء أنماط مدخلات النصوص
  static InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: EdgeInsets.all(AppSizes.spacing12),
      hintStyle: TextStyle(
        color: AppColors.darkGray,
        fontSize: AppSizes.fontSize2,
      ),
      labelStyle: TextStyle(
        color: AppColors.darkPurple,
        fontSize: AppSizes.fontSize2,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
        borderSide: BorderSide(
          color: AppColors.lightPurple,
          width: AppSizes.borderSize,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
        borderSide: BorderSide(
          color: AppColors.darkPurple,
          width: AppSizes.borderSize + 0.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
        borderSide: BorderSide(
          color: AppColors.red,
          width: AppSizes.borderSize,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
        borderSide: BorderSide(
          color: AppColors.red,
          width: AppSizes.borderSize + 0.5,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
        borderSide: BorderSide(
          color: AppColors.grey,
          width: AppSizes.borderSize,
        ),
      ),
    );
  }
}
