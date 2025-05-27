import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';

class CustomBoxDecoration{
  static final BoxDecoration boxDecoration = BoxDecoration(
    boxShadow: [BoxShadow(blurRadius: 10,
    offset: Offset(0, 0.5), 
    color: AppColors.darkPurple.withOpacity(0.05),
       spreadRadius: 1,
    ),
    ],
        color: AppColors.white,
        border: Border.all(color: AppColors.grey, width: 0.4),

        borderRadius: BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)),
      );
}