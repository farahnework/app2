# نظام التنسيق (Theming System) في Food Najeh Soft

نظام التنسيق في التطبيق يوفر مجموعة من الأدوات والفئات لضمان تنسيق موحد ومتناسق عبر التطبيق بأكمله. يتكون من عدة ملفات تعمل معًا لتوفير نظام ألوان وخطوط وأنماط قابل للتخصيص.

## 1. `font_weight_helper.dart`

### الغرض
يحدد أوزان الخطوط المختلفة المستخدمة في التطبيق بطريقة معبرة وسهلة القراءة. بدلاً من استخدام الأرقام المجردة مثل `FontWeight.w600`، يمكن استخدام أسماء معبرة مثل `FontWeightHelper.semiBold`.

### الاستخدام
يتم استخدام هذا الملف في أي مكان تحتاج فيه إلى تحديد وزن الخط في أنماط النصوص، مثل `TextStyle`.

### مثال
```dart
import 'package:foodnajehsoft/core/theming/font_weight_helper.dart';

final TextStyle myTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeightHelper.semiBold,
  color: Colors.black,
);
```

## 2. `app_colors.dart`

### الغرض
يحدد لوحة الألوان الأساسية للتطبيق، مما يضمن استخدام نفس الألوان باستمرار في جميع أنحاء التطبيق. يتضمن الألوان الرئيسية والثانوية وألوان النص والخلفية وغيرها.

### الاستخدام
يتم استدعاء الألوان من هذا الملف في أي مكان تحتاج فيه إلى استخدام لون معين في واجهة المستخدم.

### مثال
```dart
import 'package:flutter/material.dart';
import 'package:foodnajehsoft/core/theming/app_colors.dart';

Container(
  color: AppColors.lightPurple,
  child: Text(
    'مرحبًا بالعالم',
    style: TextStyle(
      color: AppColors.darkPurple,
      fontSize: 16,
    ),
  ),
);

// استخدام مرشح اللون
Image(
  image: AssetImage('assets/images/icon.png'),
  color: AppColors.primary,
  colorBlendMode: BlendMode.srcIn,
);

// أو بشكل أكثر ملاءمة
Image(
  image: AssetImage('assets/images/icon.png'),
  colorFilter: AppColors.colorFilter(AppColors.primary),
);
```

## 3. `app_style_helper.dart`

### الغرض
يوفر أنماط نصوص ثابتة باستخدام مكتبة `flutter_screenutil` للاستجابة للشاشة. هذه الأنماط تُستخدم غالبًا في إعدادات `ThemeData` وليست معتمدة على السياق (context).

### الاستخدام
يُستخدم عند تكوين سمة التطبيق أو عند الحاجة إلى أنماط ثابتة لا تعتمد على `BuildContext`. يجب تهيئة `ScreenUtil` قبل استخدام هذه الأنماط.

### مثال
```dart
import 'package:flutter/material.dart';
import 'package:foodnajehsoft/core/theming/app_style_helper.dart';
import 'package:foodnajehsoft/core/theming/app_colors.dart';

// عند تعريف سمة التطبيق
final ThemeData theme = ThemeData(
  textTheme: TextTheme(
    titleLarge: AppStyleHelper.titleLarge.copyWith(color: AppColors.black),
    bodyMedium: AppStyleHelper.bodyMedium,
    // المزيد من الأنماط...
  ),
);

// الاستخدام في واجهة المستخدم
Text(
  'عنوان كبير',
  style: AppStyleHelper.headlineLarge.copyWith(color: AppColors.primary),
);
```

## 4. `app_styles.dart`

### الغرض
يوفر أنماط نصوص استجابية تعتمد على `BuildContext` وتستخدم وظائف `ResponsiveSizing` لضبط الحجم بناءً على حجم الشاشة. يحتوي أيضًا على أنماط ثابتة لأغراض معينة مثل عناوين الجداول.

### الاستخدام
يُستخدم في مكونات واجهة المستخدم عندما تحتاج إلى أنماط نصوص تستجيب لحجم الشاشة والسياق الحالي.

### مثال
```dart
import 'package:flutter/material.dart';
import 'package:foodnajehsoft/core/theming/app_styles.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // استخدام نمط ثابت
        Text('عنوان الجدول', style: AppStyles.tableHeader),
        
        // استخدام نمط مستجيب يعتمد على السياق
        Text('عنوان كبير', style: AppStyles.titleLarge(context)),
        Text('نص عادي', style: AppStyles.bodyMedium(context)),
        
        // يمكن تخصيص النمط أيضًا
        Text(
          'نص مخصص',
          style: AppStyles.labelSmall(context).copyWith(
            color: Colors.red,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
```

## 5. `app_theme.dart`

### الغرض
يوفر تكوينًا كاملاً لسمة التطبيق (ThemeData) لكل من الوضع الفاتح والداكن. يقوم بتوحيد جميع جوانب التصميم: الألوان، الخطوط، أنماط النصوص، الأزرار، حقول الإدخال، البطاقات، وغيرها.

### الاستخدام
يستخدم عند تكوين التطبيق في `MaterialApp` أو عند الحاجة إلى الوصول إلى سمة التطبيق الحالية.

### مثال
```dart
import 'package:flutter/material.dart';
import 'package:foodnajehsoft/core/theming/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Najeh Soft',
      // تطبيق سمة الوضع الفاتح
      theme: AppTheme.lightTheme,
      // تطبيق سمة الوضع الداكن
      darkTheme: AppTheme.darkTheme,
      // تحديد الوضع الافتراضي
      themeMode: ThemeMode.system, // أو ThemeMode.light أو ThemeMode.dark
      home: HomePage(),
    );
  }
}

// استخدام السمة الحالية في مكون
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // الوصول إلى سمة التطبيق الحالية
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('الصفحة الرئيسية'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // استخدام أنماط النصوص من السمة
            Text('عنوان كبير', style: theme.textTheme.headlineMedium),
            Text('نص عادي', style: theme.textTheme.bodyMedium),
            
            // استخدام ألوان السمة
            Container(
              color: theme.colorScheme.surface,
              padding: EdgeInsets.all(16),
              child: Text(
                'نص على خلفية',
                style: TextStyle(color: theme.colorScheme.onSurface),
              ),
            ),
            
            // استخدام أزرار السمة
            ElevatedButton(
              onPressed: () {},
              child: Text('زر مرتفع'),
            ),
            
            TextButton(
              onPressed: () {},
              child: Text('زر نصي'),
            ),
            
            OutlinedButton(
              onPressed: () {},
              child: Text('زر محاط'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## نظرة عامة على العلاقات بين ملفات التنسيق

- `font_weight_helper.dart` يُستخدم في جميع ملفات الأنماط لتوفير أوزان خطوط معبرة.
- `app_colors.dart` يُستخدم في جميع ملفات الأنماط والسمات لتوفير لوحة ألوان موحدة.
- `app_style_helper.dart` يوفر أنماط ثابتة غير معتمدة على السياق.
- `app_styles.dart` يوفر أنماط استجابية تعتمد على سياق البناء.
- `app_theme.dart` يستخدم كل الملفات السابقة لبناء سمة التطبيق الشاملة.

## أفضل الممارسات

1. **استخدم دائمًا الثوابت والمساعدين**: بدلاً من تحديد الألوان والأنماط مباشرة، استخدم الفئات المساعدة.

2. **تجنب تكرار الأنماط**: استخدم الأنماط المحددة مسبقًا وقم بتخصيصها عند الحاجة.

3. **اختر النمط الصحيح**:
   - استخدم `AppStyleHelper` عند بناء سمة التطبيق أو عند الحاجة إلى أنماط ثابتة.
   - استخدم `AppStyles` عندما تحتاج إلى أنماط استجابية داخل مكونات واجهة المستخدم.
   - استخدم `Theme.of(context).textTheme` للوصول إلى أنماط النصوص المحددة في السمة الحالية.

4. **اتبع التسلسل الهرمي للأنماط**: استخدم الأنماط المناسبة لكل نوع من أنواع النصوص (عناوين، نصوص أساسية، تسميات).

5. **كن متسقًا في استخدام الألوان**: التزم بلوحة الألوان المحددة في `AppColors` للحفاظ على التناسق البصري.
