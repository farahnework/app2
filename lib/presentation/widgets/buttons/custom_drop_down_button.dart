import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomDropDownButton extends StatefulWidget {
  final String title;
  final List<String> list;
  final String selected;
  final double width;
  final double height;
  final IconData icon;
  final Color color;

  const CustomDropDownButton({
    super.key,
    required this.title,
    required this.list,
    required this.selected,
    required this.width,
    required this.height,
    required this.icon, required this.color,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  var newSelect;
  var currentColor = AppColors.grey;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            currentColor = AppColors.darkPurple;
          });
        },
        onExit: (event) {
          setState(() {
            currentColor = AppColors.grey;
          });
        },
        child: Container(
          height: widget.height,
          width:  widget.width,
          child: DropdownButton2(
            underline: SizedBox.shrink(),
            buttonStyleData: ButtonStyleData(
              
              decoration: BoxDecoration(
                color: widget.color,
                border: Border.all(
                  color: currentColor,
                  width: AppSizes.borderSize,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.textFieldRadius),
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.textFieldRadius),
                ),
              ),
            ),
            value: newSelect,
            hint: Text(widget.title),
            items:
                widget.list.map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
            isExpanded: true,
            onChanged: (value) {
              setState(() {
                newSelect = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
