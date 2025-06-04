import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddCaurseButton extends StatefulWidget {
  const AddCaurseButton({super.key});

  @override
  State<AddCaurseButton> createState() => _AddCaurseButtonState();
}

class _AddCaurseButtonState extends State<AddCaurseButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: CustomButton(text: 'Caurse', radius: true, width: 100, height: AppSizes.widgetHeight, color: AppColors.darkPurple, textColor: AppColors.white,));
  }
}