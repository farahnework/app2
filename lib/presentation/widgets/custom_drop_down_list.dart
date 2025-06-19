import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  final String title;
  final List<String> list;
  final String selected;
  final double width;

  const CustomDropDownList({
    super.key,
    required this.title,
    required this.list,
    required this.selected,
    required this.width,
  });

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  var newSelect;
  var currentColor = AppColors.white;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            currentColor = AppColors.lightPurple;
          });
        },
        onExit: (event) {
          setState(() {
            currentColor = AppColors.white;
          });
        },
        child: Container(
          width: widget.width,
          child: DropdownButton2(
         

             alignment: AlignmentDirectional.centerStart,
            customButton: Text(widget.title, style: CustomTextStyles.header2,),
            underline: SizedBox.shrink(),
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(color: currentColor),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.textFieldRadius),
                ),
               boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 2), // Adjust shadow position
      ),
    ],

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
