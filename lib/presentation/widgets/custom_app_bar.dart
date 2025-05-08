import 'package:app/presentation/widgets/custom_search_field.dart';
import 'package:app/shared/app_colors.dart';
import 'package:app/shared/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // return AppBar(
    //   backgroundColor: AppColors.lightPurple,
    //   title: SearchField(),
    // );
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
            CustomSearchField(),
            SizedBox(
              height: 50,
              child: Image(image: AssetImage('lib/assets/images/logo.png'))),
          ],
        ),
      ),
    );
  }
}