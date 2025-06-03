import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextStyles{
  static TextStyle tableHeader(BuildContext context) => TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.darkPurple);
  static TextStyle smallText(BuildContext context) => TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize4,),);
  static TextStyle meduimText(BuildContext context) => TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize4, ),fontWeight: AppSizes.fontWeight2);
  static TextStyle titleText(BuildContext context) => TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize2,), fontWeight: AppSizes.fontWeight1);
  static TextStyle buttonText(BuildContext context) => TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,),  color: AppColors.white);


  static final header1= TextStyle(color: AppColors.black,fontWeight: FontWeight.w900, fontSize: AppSizes.fontSize1);
  static final header2= TextStyle(color: AppColors.black,fontWeight: FontWeight.w600, fontSize: AppSizes.fontSize2);
  static final body= TextStyle(color: AppColors.black, fontSize: AppSizes.fontSize2);
  static final buttonTextStyle= TextStyle(color: AppColors.white, fontSize: AppSizes.fontSize2);
}