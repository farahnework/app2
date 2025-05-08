import 'package:app/presentation/widgets/custom_icon_button.dart';
import 'package:app/shared/app_colors.dart';
import 'package:app/shared/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBar(),
            Body(),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
      color: AppColors.lightPurple,
      boxShadow: [
      BoxShadow(
        color: Colors.grey.withAlpha(100),
        spreadRadius: 2,
        blurRadius: 10,
        offset: Offset(0, 1), // Changes position of shadow
      ),
    ],

      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tareq Erq'),
            Row(children: [
              Text('الوردية الرئيسية'),
              Text('الوردية الحالية:'),
            ],),
            CustomIconButton(text: '', icon: Icons.add),

          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(children: [
            
          ],),),
        Expanded(child: Column(children: [],),),
      ],
    );
  }
}