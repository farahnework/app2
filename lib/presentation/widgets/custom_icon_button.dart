import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  const CustomIconButton({super.key, required this.icon});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){},
        icon: Icon(widget.icon,),
      // color: AppColors.darkPurple,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.darkPurple),
        iconColor: WidgetStateProperty.all(AppColors.white),
      ),
    );
  }
}
