import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  Widget child;
   CustomContainer({super.key, required this.child});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 
        AppSizes.horiScreenPadding,
         vertical: AppSizes.verScreenPadding),
      decoration: CustomBoxDecoration.boxDecoration,
      child: widget.child,
    );
  }
}