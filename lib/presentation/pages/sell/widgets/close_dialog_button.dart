import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class CloseDialogButton extends StatefulWidget {
  final String text;
  final BuildContext context;
  final bool radius;
  const CloseDialogButton({super.key, required this.text, required this.radius, required this.context,});

  @override
  State<CloseDialogButton> createState() => _CloseDialogButtonState();
}

class _CloseDialogButtonState extends State<CloseDialogButton> {
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
      child: SizedBox(
        height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.darkPurple,
            shape:  widget.radius?
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.responsiveBorderRadius(AppSizes.radius12)),
            ):
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            )
          ),
          onPressed: () {
             Navigator.pop(widget.context);
          },
          child: Text(widget.text, style: CustomTextStyles.buttonText(context)),
        ),
      ),
    );
  }
}
