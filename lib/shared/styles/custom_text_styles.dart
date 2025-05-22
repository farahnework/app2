import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';

class CustomTextStyles{
  static final tableHeader= TextStyle(color: AppColors.darkPurple,fontWeight: FontWeight.bold, fontSize:  AppSizes.fontSize2);
  static final header1= TextStyle(color: AppColors.black,fontWeight: FontWeight.w900, fontSize: AppSizes.fontSize1);
  static final header2= TextStyle(color: AppColors.black,fontWeight: FontWeight.w600, fontSize: AppSizes.fontSize2);
  static final body= TextStyle(color: AppColors.black, fontSize: AppSizes.fontSize2);
  static final buttonTextStyle= TextStyle(color: AppColors.white, fontSize: AppSizes.fontSize2);
}