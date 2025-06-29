import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/app_colors.dart';

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final double size;
  final dynamic onPresse;

  const CustomIconButton({super.key, required this.icon, required this.color, required this.iconColor, required this.size, required this.onPresse});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  var currentColor = AppColors.grey;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // onEnter: (event) {
      //   setState(() {
      //     currentColor= AppColors.lightPurple;
      //   });
      // },
      // onExit: (event) {
      //   setState(() {
      //     currentColor= AppColors.lightGrey;
      //   });
      // },
      child: SizedBox(
        width:  context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
        height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
        child: IconButton(
            onPressed: (){
              widget.onPresse(context);
            },
            icon: Icon(widget.icon, color: widget.iconColor, size: context.responsiveIconSize(AppSizes.iconSize),),
  
          style: ElevatedButton.styleFrom(
            
            padding: EdgeInsets.zero,
            fixedSize: Size(40, 40),
            backgroundColor: widget.color,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(context.responsiveBorderRadius(AppSizes.radius12))))
          )
        ),
      ),
    );
  }
}
