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
  final Widget page;
  const CustomButton({super.key, required this.text, required this.radius, required this.width, required this.page, required this.height});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color color = AppColors.darkPurple;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          color = AppColors.darkPurple2;
        });
      },
        onExit: (event) {
        setState(() {
          color = AppColors.darkPurple;
        });
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
            shape:  widget.radius?
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ):
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            )
          ),
        
          onPressed: () {
            Get.to(widget.page);
          },
          child: Text(widget.text, style: CustomTextStyles.buttonTextStyle),
        ),
      ),
    );
  }
}
