import 'package:app/shared/app_colors.dart';
import 'package:app/shared/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height:50,
      child: TextField(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: 'بحث',
          alignLabelWithHint: true ,
          prefixIcon: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.darkPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.textFieldRadius),
                bottomLeft: Radius.circular(AppSizes.textFieldRadius),
              ),
            ),
            child: Icon(Icons.search, color: AppColors.white),
          ),
          filled: true,
          fillColor: AppColors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkPurple),
            borderRadius: BorderRadius.all(
              Radius.circular(AppSizes.textFieldRadius),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(AppSizes.textFieldRadius),
            ),
          ),
        ),
      ),
    );
  }
}
