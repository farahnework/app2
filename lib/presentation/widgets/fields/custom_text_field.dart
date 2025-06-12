import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final  double width;
  final bool enabled;

  const CustomTextField({super.key, required this.hintText,required this.icon, required this.width, required this.enabled});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
        child: TextField( 
          enabled: widget.enabled,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            fillColor: AppColors.white,
            filled: true,
            prefixIcon: Icon(widget.icon, color: AppColors.darkPurple, size: context.responsiveIconSize(AppSizes.iconSize),),
            labelText: widget.hintText,
          labelStyle: CustomTextStyles.smallText(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
              borderRadius: BorderRadius.all(Radius.circular(context.responsiveBorderRadius(AppSizes.radius12)))
            ),
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.textFieldRadius))
            ),
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkPurple, width: AppSizes.borderSize),
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.textFieldRadius))
            ),
          ),
        ),
      ),
    );
  }
}