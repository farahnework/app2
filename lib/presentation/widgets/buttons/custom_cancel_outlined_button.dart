import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCancelOutlinedButton extends StatefulWidget {
  final String text;
  const CustomCancelOutlinedButton({super.key, required this.text,});

  @override
  State<CustomCancelOutlinedButton> createState() => _CustomCancelOutlinedButtonState();
}

class _CustomCancelOutlinedButtonState extends State<CustomCancelOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))) ),
        onPressed: (){ Get.back();}, child: Text(widget.text, style: CustomTextStyles.meduimText(context),)),
    );
  }
}