import 'dart:async';

import 'package:app/controllers/side_bar_controller.dart';
import 'package:app/controllers/toggle_button_controller.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() {
  // Catches errors globally before crashing the app
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    
    // Ensures locale data is properly initialized (if using dates)
    await initializeDateFormatting('en', null);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        fallbackLocale: const Locale('en'),
        path: 'assets/languages',
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<SideBarController>(
              create: (_) => SideBarController(),
            ),
            ChangeNotifierProvider<SideToggleProvider>(
              create: (_) => SideToggleProvider(),
            ),
          ],
          child: const MyApp(),
        ),
      ),
    );
  }, (error, stackTrace) {
    // print("❌ Unhandled Error: $error");
    // print("🛠️ StackTrace: $stackTrace");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Builder(
  builder: (context) {
    return GetMaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
         debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      useInheritedMediaQuery: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  },
);

    // return GetMaterialApp(
    //   localizationsDelegates: context.localizationDelegates,
    //   supportedLocales: context.supportedLocales,
    //   locale: context.locale,
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   useInheritedMediaQuery: true,
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //   ),
    //   home: HomePage(),
    // );
  }
}












// import 'package:app/controllers/side_bar_controller.dart';
// import 'package:app/controllers/toggle_button_controller.dart';
// import 'package:app/presentation/pages/home/home_page.dart';
// import 'package:app/shared/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// void main() {
//    WidgetsFlutterBinding.ensureInitialized();
//   //  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); 
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: AppColors.white, 
//     statusBarIconBrightness: Brightness.dark,
//   ));

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider<SideBarController>(create: (_) =>SideBarController(),),
//         ChangeNotifierProvider<SideToggleProvider>(create: (_) => SideToggleProvider()),
//         ],
//       child: const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
 
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: HomePage(),
//     );
//   }
// }

