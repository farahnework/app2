import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

DataCell customDataCell(String number, bool isNumber, bool isTotal,) {
  return DataCell(
    Row(
      children: [
        isNumber?
        SvgPicture.asset(AppImages.rial, height: AppSizes.fontSize3):Container(),
        SizedBox(width: AppSizes.horiSpacesBetweentTexts),

        isTotal&isNumber?
        Text(number, textAlign: TextAlign.center, style: CustomTextStyles.header2):
        !isTotal&isNumber?
        Text(number, textAlign: TextAlign.center, style: CustomTextStyles.body):
        isTotal&!isNumber?
        Text(number, textAlign: TextAlign.center, style: CustomTextStyles.header2):
        Text(number, textAlign: TextAlign.center, style: CustomTextStyles.body),

      ],
    ),
  );
}
