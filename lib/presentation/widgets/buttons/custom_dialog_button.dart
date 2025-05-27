import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomDialogButton extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final  dialog;
  final Color color;
  final Color textColor;
  const CustomDialogButton({super.key, required this.text,  required this.width,required this.dialog, required this.height, required this.color, required this.textColor});

  @override
  State<CustomDialogButton> createState() => _CustomDialogButtonState();
}

class _CustomDialogButtonState extends State<CustomDialogButton> {
  @override
  Widget build(BuildContext context) {
  Color color = widget.color;

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          color = AppColors.darkPurple2;
        });
      },
        onExit: (event) {
        setState(() {
          color = widget.color;
        });
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
            shape:  
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            ),
          
        
          onPressed: () {
           widget.dialog(context);
          },
          child: Text(widget.text, style: TextStyle(color: widget.textColor, fontSize: AppSizes.fontSize2)),
        ),
      ),
    );
  }
}
