import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseDialogButton extends StatefulWidget {
  final String text;
  final BuildContext context;
  final bool radius;
  final double width;
  const CloseDialogButton({super.key, required this.text, required this.radius, required this.width, required this.context,});

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
      child: Container(
        height: 50,
        width: widget.width,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.darkPurple,
            shape:  widget.radius?
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ):
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            )
          ),
          onPressed: () {
             Navigator.pop(widget.context);
          },
          child: Text(widget.text, style: CustomTextStyles.buttonTextStyle),
        ),
      ),
    );
  }
}
