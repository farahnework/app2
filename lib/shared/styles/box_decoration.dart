import 'package:app/shared/app_colors.dart';
import 'package:app/shared/app_sizes.dart';
import 'package:flutter/cupertino.dart';

class CustomBoxDecoration{
  static final BoxDecoration boxDecoration = BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
      );
}