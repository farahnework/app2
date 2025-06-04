import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

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
          height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: widget.height),
          width: widget.width,
          child: 
          DropdownButton2(
            underline: SizedBox.shrink(),
            buttonStyleData: ButtonStyleData(
              
              decoration: BoxDecoration(
                color: widget.color,
                border: Border.all(
                  color: currentColor,
                  width: AppSizes.borderSize,
                ),
                borderRadius: BorderRadius.all(
                  
                  Radius.circular(context.responsiveBorderRadius(AppSizes.radius12)),
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(context.responsiveBorderRadius(AppSizes.radius12)),
                ),
              ),
            ),
            value: newSelect,
            hint: Text(widget.title,style: CustomTextStyles.smallText(context)),
            items:
                widget.list.map((item) {
                  return DropdownMenuItem(value: item, child: Text(item, style: CustomTextStyles.smallText(context)));
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
