# نظام التصميم المتجاوب (Responsive Design System)

هذا الدليل يشرح نظام التصميم المتجاوب في تطبيق FoodNajehSoft. يتضمن شرحًا مفصلاً لكل ملف ودوره في النظام، وكيفية استخدامه، مع أمثلة عملية.

## نظرة عامة على النظام

نظام التصميم المتجاوب يتكون من مجموعة من الملفات المنظمة التي تعمل معًا لتوفير واجهة مستخدم متجاوبة تعمل بشكل مثالي على مختلف أحجام الشاشات. يعتمد النظام على هيكل متماسك:

1. **تحديد نوع الجهاز**: التعرف على نوع الجهاز (جوال، لوحي، سطح مكتب)
2. **حسابات الأحجام المتجاوبة**: حساب الأحجام والمسافات بناءً على نوع الجهاز
3. **امتدادات السياق**: توفير وصول سهل للوظائف المتجاوبة عبر `BuildContext`
4. **مساعدات التخطيط**: أدوات لإنشاء تخطيطات متجاوبة حسب نوع الجهاز والاتجاه

## الملفات والوظائف

### 1. `responsive_helper.dart`

**الغرض الأساسي**:
يحدد أنواع الأجهزة الأساسية ويوفر وظائف التعرف على نوع الجهاز. هذا الملف هو حجر الأساس لنظام التصميم المتجاوب.

**دوره في النظام**:
- يعرّف تعداد `DeviceScreenType` (mobile, tablet, desktop)
- يوفر مكون `ScreenTypeLayout` لعرض محتوى مختلف حسب نوع الجهاز
- يحتوي على دالة `getDeviceType` لتحديد نوع جهاز المستخدم

**كيفية الاستخدام**:
يمكن استخدام هذا الملف مباشرة عند الحاجة إلى:
1. التعرف على نوع الجهاز
2. إنشاء واجهات مختلفة حسب نوع الجهاز

**مثال استخدام**:

```dart
import 'package:foodnajehsoft/core/responsive/responsive_helper.dart';

// التعرف على نوع الجهاز
DeviceScreenType deviceType = getDeviceType(context);
if (deviceType == DeviceScreenType.mobile) {
  // منطق خاص بالجوال
}

// إنشاء تخطيط متجاوب
Widget build(BuildContext context) {
  return ScreenTypeLayout(
    mobile: MobileLayout(),
    tablet: TabletLayout(),
    desktop: DesktopLayout(),
  );
}

// استخدام دالة مساعدة للحصول على قيمة حسب نوع الجهاز
double padding = getValueForScreenType<double>(
  context: context,
  mobile: 8.0,
  tablet: 16.0,
  desktop: 24.0,
);
```

### 2. `responsive_sizing.dart`

**الغرض الأساسي**:
يحتوي على كلاس `ResponsiveSizing` الذي يوفر جميع عمليات حساب القياسات المتجاوبة. هذا الكلاس هو المسؤول عن تحديد أحجام العناصر المختلفة (النصوص، الهوامش، المسافات) بناءً على حجم الشاشة.

**دوره في النظام**:
- يحدد نقاط الفصل القياسية بين أنواع الأجهزة (600 للوحي، 1024 لسطح المكتب)
- يحسب أحجام النصوص المتجاوبة مع مراعاة كثافة البكسل
- يوفر طرقًا لحساب الهوامش والمسافات المتجاوبة
- يوفر طرقًا للتعرف على نوع الجهاز

**كيفية الاستخدام**:
يتم استخدام هذا الكلاس غالبًا من خلال الامتدادات في `context_extension.dart`، ولكن يمكن استخدامه مباشرة إذا لزم الأمر.

**مثال استخدام**:

```dart
import 'package:foodnajehsoft/core/responsive/responsive_sizing.dart';

// حساب حجم نص متجاوب
double fontSize = ResponsiveSizing.getResponsiveFontSize(context, 16.0);

// التحقق من نوع الجهاز
bool isTablet = ResponsiveSizing.isTablet(context);

// حساب هامش متجاوب
double padding = ResponsiveSizing.getResponsivePadding(context, 16.0);

// الحصول على عرض متجاوب كنسبة من عرض الشاشة
double width = ResponsiveSizing.getResponsiveWidth(context, percentage: 50);

// إنشاء حاوية متجاوبة حسب نوع الجهاز
Widget container = ResponsiveSizing.responsiveBuilder(
  context: context,
  mobile: MobileContainer(),
  tablet: TabletContainer(),
  desktop: DesktopContainer(),
);
```

### 3. `context_extension.dart` (في مجلد responsive)

**الغرض الأساسي**:
يوفر امتدادات لكلاس `BuildContext` تسهل الوصول إلى وظائف التصميم المتجاوب. هذا الملف هو نقطة الدخول الرئيسية للتعامل مع النظام المتجاوب.

**دوره في النظام**:
- يوفر وصولًا سهلًا لخصائص `MediaQuery` ونوع الجهاز
- يوفر طرقًا مختصرة للقياسات المتجاوبة (النصوص، الهوامش، المسافات، الأيقونات)
- يحتوي على طريقة `responsiveWidget` لإنشاء واجهات متجاوبة حسب نوع الجهاز

**كيفية الاستخدام**:
هذا الملف هو الواجهة الرئيسية للتعامل مع النظام المتجاوب، ويجب استيراده في أي صفحة تحتاج إلى تصميم متجاوب.

**مثال استخدام**:

```dart
import 'package:foodnajehsoft/core/responsive/context_extension.dart';

Widget build(BuildContext context) {
  // الوصول إلى معلومات حجم الشاشة
  double screenWidth = context.screenWidth;
  double screenHeight = context.screenHeight;
  
  // التحقق من نوع الجهاز
  bool isTablet = context.isTablet;
  
  // التحقق من اتجاه الشاشة
  bool isLandscape = context.isLandscape;
  
  // استخدام القياسات المتجاوبة
  double fontSize = context.responsiveFontSize(16.0);
  double padding = context.responsivePadding(16.0);
  double spacing = context.responsiveSpacing(8.0);
  double iconSize = context.responsiveIconSize(24.0);
  
  // إنشاء هوامش متجاوبة
  EdgeInsets insets = context.responsiveEdgeInsets(
    horizontal: 16.0,
    vertical: 8.0,
  );
  
  // إنشاء واجهة متجاوبة حسب نوع الجهاز
  return context.responsiveWidget(
    mobile: Text('جوال', style: TextStyle(fontSize: fontSize)),
    tablet: Row(children: [Icon(Icons.tablet), Text('لوحي')]),
    desktop: DesktopLayout(),
  );
}
```

### 4. `orientation_layout.dart`

**الغرض الأساسي**:
يوفر مكون `OrientationLayout` الذي يعرض محتوى مختلفًا بناءً على اتجاه الشاشة (أفقي أو عمودي).

**دوره في النظام**:
- يكمل عمل `ScreenTypeLayout` عن طريق التعامل مع اتجاه الشاشة
- يسمح بإنشاء واجهات مخصصة للاتجاه العمودي والأفقي

**كيفية الاستخدام**:
يستخدم هذا المكون غالبًا داخل مكون `ScreenTypeLayout` لإنشاء واجهات متجاوبة بشكل كامل مع نوع الجهاز واتجاه الشاشة.

**مثال استخدام**:

```dart
import 'package:foodnajehsoft/core/responsive/orientation_layout.dart';
import 'package:foodnajehsoft/core/responsive/responsive_helper.dart';

Widget build(BuildContext context) {
  return ScreenTypeLayout(
    mobile: OrientationLayout(
      portrait: MobilePortraitLayout(),
      landscape: MobileLandscapeLayout(),
    ),
    tablet: OrientationLayout(
      portrait: TabletPortraitLayout(),
      landscape: TabletLandscapeLayout(),
    ),
    desktop: DesktopLayout(), // عادة ما يكون سطح المكتب أفقيًا فقط
  );
}

// يمكن استخدامه بشكل منفصل أيضًا
Widget buildMobileLayout(BuildContext context) {
  return OrientationLayout(
    portrait: Column(children: [/* ... */]),
    landscape: Row(children: [/* ... */]),
  );
}
```

### 5. `screen_layouts.dart`

**الغرض الأساسي**:
يوفر ثوابت لقياسات التخطيط لمختلف أنواع الأجهزة، خاصة للشبكات والقوائم.

**دوره في النظام**:
- يحافظ على اتساق قياسات التخطيط عبر التطبيق
- يوفر قيم افتراضية لعدد الأعمدة ونسب الأبعاد والمسافات للشبكات

**كيفية الاستخدام**:
يستخدم هذا الملف عند إنشاء شبكات وقوائم متجاوبة، حيث يوفر قيمًا موحدة بناءً على نوع الجهاز.

**مثال استخدام**:

```dart
import 'package:foodnajehsoft/core/responsive/screen_layouts.dart';
import 'package:foodnajehsoft/core/responsive/context_extension.dart';

Widget buildGrid(BuildContext context) {
  // تحديد عدد الأعمدة بناءً على نوع الجهاز
  int crossAxisCount = context.isMobile
      ? ScreenLayouts.mobileCrossAxisCount
      : context.isTablet
          ? ScreenLayouts.tabletCrossAxisCount
          : ScreenLayouts.desktopCrossAxisCount;
          
  // تحديد نسبة الأبعاد بناءً على نوع الجهاز
  double childAspectRatio = context.isMobile
      ? ScreenLayouts.mobileChildAspectRatio
      : context.isTablet
          ? ScreenLayouts.tabletChildAspectRatio
          : ScreenLayouts.desktopChildAspectRatio;
          
  // تحديد المسافة بين العناصر بناءً على نوع الجهاز
  double spacing = context.isMobile
      ? ScreenLayouts.mobileSpacing
      : context.isTablet
          ? ScreenLayouts.tabletSpacing
          : ScreenLayouts.desktopSpacing;
  
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: childAspectRatio,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
    ),
    itemCount: 20,
    itemBuilder: (context, index) => ProductCard(),
  );
}
```

### 6. `responsive_widget_mixin.dart`

**الغرض الأساسي**:
يوفر مزيج (mixin) يمكن إضافته إلى الويدجتس لتسهيل استخدام وظائف التصميم المتجاوب.

**دوره في النظام**:
- يغلف طرق امتدادات السياق لتسهيل استخدامها داخل الويدجتس
- يضيف وظائف إضافية مثل تحديد الحد الأدنى والأقصى للقيم
- يوفر طرقًا مختصرة للعمليات المتجاوبة الشائعة

**كيفية الاستخدام**:
يتم إضافة هذا المزيج إلى أي ويدجت يحتاج إلى قياسات متجاوبة، وذلك باستخدام الكلمة المفتاحية `with`.

**مثال استخدام**:

```dart
import 'package:flutter/material.dart';
import 'package:foodnajehsoft/core/responsive/responsive_widget_mixin.dart';

class ProductCard extends StatelessWidget with ResponsiveWidgetMixin {
  @override
  Widget build(BuildContext context) {
    // استخدام طرق المزيج للحصول على قياسات متجاوبة
    final padding = getResponsivePadding(
      context,
      horizontal: 16.0,
      vertical: 12.0,
    );
    
    final borderRadius = getResponsiveBorderRadius(context, 8.0);
    
    final fontSize = getResponsiveFontSize(context, 14.0);
    
    final iconSize = getResponsiveIconSize(context, 20.0);
    
    // تحديد عرض بحد أقصى (وهي ميزة غير متوفرة في امتدادات السياق العادية)
    final containerWidth = getResponsiveWidth(
      context,
      percentage: 80,
      max: 300.0, // لن يتجاوز العرض 300 بكسل حتى على الشاشات الكبيرة
    );
    
    // استخدام القيم في بناء الواجهة
    return Container(
      width: containerWidth,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.white,
        boxShadow: [BoxShadow(
          blurRadius: 4.0,
          color: Colors.black.withOpacity(0.1),
        )],
      ),
      child: Column(
        children: [
          Icon(Icons.shopping_cart, size: iconSize),
          Text('منتج', style: TextStyle(fontSize: fontSize)),
          
          // استخدام قيم افتراضية موحدة
          const SizedBox(height: 8.0),
          Text(
            'وصف المنتج',
            style: TextStyle(
              fontSize: getDefaultResponsiveValues(context)['fontSize'],
            ),
          ),
        ],
      ),
    );
  }
}
```


### 1. اعتماد المنهج التدريجي من أسفل إلى أعلى


```dart
Widget build(BuildContext context) {
  // تصميم الجوال الأساسي
  Widget content = MobileLayout();
  
  // إذا كان الجهاز لوحيًا أو سطح مكتب، استخدم تخطيطًا مختلفًا
  if (context.isTablet || context.isDesktop) {
    content = AdvancedLayout();
  }
  
  return content;
}
```

### 2. استخدام ScreenTypeLayout لتبسيط المنطق المشروط

بدلاً من استخدام العبارات الشرطية المتداخلة، استخدم `ScreenTypeLayout` لتحديد واجهات مختلفة بشكل واضح.

```dart
// بدلاً من:
Widget build(BuildContext context) {
  if (context.isMobile) {
    return MobileLayout();
  } else if (context.isTablet) {
    return TabletLayout();
  } else {
    return DesktopLayout();
  }
}

// استخدم:
Widget build(BuildContext context) {
  return ScreenTypeLayout(
    mobile: MobileLayout(),
    tablet: TabletLayout(),
    desktop: DesktopLayout(),
  );
}
```

### 3. التعامل مع الاتجاه في الأجهزة المحمولة

غالبًا ما يتغير تخطيط الواجهة بشكل كبير بين الاتجاه الأفقي والعمودي في الأجهزة المحمولة واللوحية. استخدم `OrientationLayout` للتعامل مع هذه الحالة.

```dart
Widget buildMobileLayout() {
  return OrientationLayout(
    portrait: Column(
      children: [
        ProductImage(isLarge: false),
        ProductDetails(),
        ActionButtons(isStacked: true),
      ],
    ),
    landscape: Row(
      children: [
        Expanded(flex: 1, child: ProductImage(isLarge: true)),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              ProductDetails(),
              ActionButtons(isStacked: false),
            ],
          ),
        ),
      ],
    ),
  );
}
```

### 4. استخدام النسب المئوية بدلاً من القيم الثابتة

استخدم القيم النسبية عند تحديد أبعاد العناصر لضمان التجاوب مع مختلف أحجام الشاشات.

```dart
Container(
  // بدلاً من استخدام قيمة ثابتة: width: 300,
  width: context.responsiveWidth(percentage: 80),
  
  // استخدام هوامش متجاوبة
  padding: context.responsiveEdgeInsets(
    horizontal: 16,
    vertical: 8,
  ),
  child: /* ... */,
)
```

### 5. التحقق من نوع الجهاز لتغيير ترتيب العناصر

في بعض الأحيان، قد ترغب في تغيير ترتيب العناصر بناءً على نوع الجهاز، خاصة عند الانتقال من الجوال إلى الأجهزة الأكبر.

```dart
Widget build(BuildContext context) {
  List<Widget> children = [
    ProductImage(),
    ProductDetails(),
    ReviewsSection(),
    RelatedItems(),
  ];
  
  if (context.isMobile) {
    // ترتيب عمودي بسيط على الجوال
    return Column(children: children);
  } else {
    // ترتيب أكثر تعقيدًا على الأجهزة الأكبر
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: children[0]), // الصورة
            Expanded(flex: 2, child: children[1]), // التفاصيل
          ],
        ),
        Row(
          children: [
            Expanded(flex: 1, child: children[2]), // المراجعات
            Expanded(flex: 1, child: children[3]), // العناصر ذات الصلة
          ],
        ),
      ],
    );
  }
}
```

### 6. استخدام المزيج ResponsiveWidgetMixin للمكونات المخصصة

عند إنشاء مكونات مخصصة قابلة لإعادة الاستخدام، استخدم مزيج `ResponsiveWidgetMixin` للاستفادة من الميزات المتجاوبة.

```dart
class CustomButton extends StatelessWidget with ResponsiveWidgetMixin {
  final String text;
  final VoidCallback onPressed;
  
  const CustomButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: getResponsivePadding(
          context,
          horizontal: 16,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: getResponsiveBorderRadius(context, 8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: getResponsiveFontSize(context, 14),
        ),
      ),
    );
  }
}
```

