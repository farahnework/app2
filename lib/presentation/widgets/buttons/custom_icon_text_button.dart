import 'package:app/presentation/pages/sell/sell_page.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
        onPressed: (){Get.to(widget.page);},
        icon: Icon(widget.icon, color: AppColors.white ,),
       label: Text(widget.text, style: CustomTextStyles.buttonTextStyle),),
    );
  }
}