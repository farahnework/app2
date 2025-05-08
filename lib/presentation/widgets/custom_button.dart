import 'package:app/shared/app_colors.dart';
import 'package:app/shared/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      // padding:EdgeInsets.all( AppSizes.screenPadding),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: AppColors.darkPurple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
        onPressed: (){}, child: Text('بحث', style: CustomTextStyles.tableHeader,)),
    );
  }
}