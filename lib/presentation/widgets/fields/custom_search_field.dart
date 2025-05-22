import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomSearchField extends StatelessWidget {
  final String text;
  const CustomSearchField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height:AppSizes.widgetHeight,
      child: TextField(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hoverColor: AppColors.lightPurple,
          focusColor: AppColors.darkPurple,
          hintText: text,
          hintStyle: TextStyle(color: AppColors.darkGray, fontSize: AppSizes.fontSize3),
          alignLabelWithHint: true ,
          // prefixIcon: Container(
          //   height: 50,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     color: AppColors.darkPurple,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(AppSizes.textFieldRadius),
          //       bottomLeft: Radius.circular(AppSizes.textFieldRadius),
          //     ),
          //   ),
          //   child: Icon(Icons.search, color: AppColors.white),
          // ),
          prefixIcon: Icon(IconsaxPlusLinear.search_normal_1, color: AppColors.darkPurple, size: AppSizes.iconSize,),
          filled: true,
          fillColor: AppColors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkPurple, width: AppSizes.borderSize),
            borderRadius: BorderRadius.all(
              Radius.circular(AppSizes.textFieldRadius),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
            borderRadius: BorderRadius.all(
              Radius.circular(AppSizes.textFieldRadius),
            ),
          ),
        ),
      ),
    );
  }
}
