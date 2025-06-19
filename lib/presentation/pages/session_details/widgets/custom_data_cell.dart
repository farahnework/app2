import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

DataCell customDataCell(String number, bool isNumber, bool isTotal, BuildContext context) {
  return DataCell(
    Row(
      children: [
        Directionality(
      textDirection: TextDirection.ltr,

          child: Row(
            children: [
              isNumber?
              SvgPicture.asset(AppImages.rial, height: context.responsiveFontSize(AppSizes.fontSize5)):Container(),
              SizedBox(width: AppSizes.horiSpacesBetweentTexts),
              isTotal&isNumber?
              Text(number, textAlign: TextAlign.center,
               style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize4,), fontWeight: AppSizes.fontWeight1, color: AppColors.black),
               ):
              !isTotal&isNumber?
              Text(number, textAlign: TextAlign.center,
               style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize4,), color: AppColors.black),):
              isTotal&!isNumber?
              Text(number, textAlign: TextAlign.center,
                       style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize3,), fontWeight: AppSizes.fontWeight1, color: AppColors.black),):
              Text(number, textAlign: TextAlign.center,style:TextStyle(fontSize:  context.responsiveFontSize(AppSizes.fontSize4,), color: AppColors.black),),
            ],
            
          ),
        ),
        Spacer(),
    
      ],
    ),
  );
}
