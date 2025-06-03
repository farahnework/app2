import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomSearchField extends StatelessWidget {
  final String text;
  const CustomSearchField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth /4,
      height:context.responsiveWidgetHeight,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
         isDense: true,
            hoverColor: AppColors.lightPurple,
            focusColor: AppColors.darkPurple,
            hintText: text,
            hintStyle: TextStyle(color: AppColors.darkGray, fontSize: context.responsiveFontSize(AppSizes.fontSize3)),
            alignLabelWithHint: false ,
            prefixIcon: Icon(IconsaxPlusLinear.search_normal_1, color: AppColors.darkPurple, size: context.responsiveIconSize(AppSizes.iconSize2)),
            filled: true,
            fillColor: AppColors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightPurple, width: AppSizes.borderSize),
              borderRadius: BorderRadius.all(
                Radius.circular(context.responsiveBorderRadius(AppSizes.radius12)),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white, width: AppSizes.borderSize),
              borderRadius: BorderRadius.all(
                Radius.circular(context.responsiveBorderRadius(AppSizes.radius12)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
