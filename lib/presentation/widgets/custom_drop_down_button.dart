import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  final String title;
  final List<String> list;
  final String selected;
  final double width;
  const CustomDropDownButton({super.key, required this.title, required this.list, required this.selected, required this.width});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButton2(
        items: widget.list.map((item){
          return DropdownMenuItem(child: Text(item));
        }).toList(),
        isExpanded: true,
      ),
    );
  }
}
