import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String text;
  final Widget page;
  const CustomOutlinedButton({super.key, required this.text, required this.page});

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
        style: OutlinedButton.styleFrom(
          
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))), ),
        onPressed: (){ Get.off(widget.page);}, child: Text(widget.text,)),
    );
  }
}