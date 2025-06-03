
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/responsive/app_sizes.dart';

class CustomIconTextButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Widget page;
  
  const CustomIconTextButton({super.key, required this.text, required this.icon, required this.page});

  @override
  State<CustomIconTextButton> createState() => _CustomIconTextButtonState();
}

class _CustomIconTextButtonState extends State<CustomIconTextButton> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.verSpacesBetweenElements),
      height: AppSizes.widgetHeight,
      child: ElevatedButton.icon(
        style: TextButton.styleFrom(backgroundColor: AppColors.darkPurple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(context.responsiveBorderRadius(AppSizes.radius16))))),
        onPressed: (){Get.to(widget.page);},
        icon: Icon(widget.icon, color: AppColors.white , size: context.responsiveIconSize(AppSizes.iconSize2),),
       label: Text(widget.text, style: TextStyle(color: AppColors.white, fontSize: context.responsiveFontSize(AppSizes.fontSize3)
       )),),
    );
  }
}