import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final Widget child;
   const CustomContainer({super.key, required this.child});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 
        context.responsivePadding(AppSizes.horiScreenPadding),
         vertical: context.responsivePadding(AppSizes.horiScreenPadding),
        ),
      decoration: CustomBoxDecoration.boxDecoration,
      child: widget.child,
    );
  }
}