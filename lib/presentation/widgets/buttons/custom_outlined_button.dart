import 'package:app/core/responsive/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/responsive/app_sizes.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String text;
  final Widget page;
  const CustomOutlinedButton({super.key, required this.text, required this.page});

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
     height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))), ),
        onPressed: (){ Get.off(widget.page);}, child: Text(widget.text, style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize3)),)),
    );
  }
}