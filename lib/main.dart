import 'package:app/controllers/side_bar_controller.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/kitchen_display/kichen_display_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); 
   
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider<SideBarController>(create: (_) =>SideBarController(),)],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

