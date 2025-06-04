import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final bool radius;
  final double width;
  final double height;
  final Widget? page;
  final Color color;
  final Color textColor;
  const CustomButton({super.key, required this.text, required this.radius, required this.width, this.page, required this.height, required this.color, required this.textColor});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  
  @override
  Widget build(BuildContext context) {
    Color color = widget.color;
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          color = AppColors.darkPurple2;
        });
      },
        onExit: (event) {
        setState(() {
          color = widget.color;
        });
      },
      child: Container(
        height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: widget.height),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
            shape:  widget.radius?
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.radius16)),
            ):
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            )
          ),
        
          onPressed: () {
            Get.to(widget.page);
          },
          child: Center(child: Text(widget.text, style: CustomTextStyles.buttonText(context).copyWith(color: widget.textColor),)),
        ),
      ),
    );
  }
}
