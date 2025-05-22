import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
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
    return SizedBox(
      width:widget.width,
      child: TextField( 
        enabled: widget.enabled,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          fillColor: AppColors.white,
          filled: true,
          prefixIcon: Icon(widget.icon, color: AppColors.darkPurple,),
          labelText: widget.hintText,
        labelStyle: TextStyle(color: AppColors.darkGray, fontSize: AppSizes.fontSize2),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.textFieldRadius))
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
    );
  }
}