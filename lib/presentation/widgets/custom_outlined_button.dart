import 'package:app/shared/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String text;
  const CustomOutlinedButton({super.key, required this.text});

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))) ),
        onPressed: (){}, child: Text(widget.text,)),
    );
  }
}