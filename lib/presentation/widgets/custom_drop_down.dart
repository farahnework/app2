import 'package:app/shared/app_colors.dart';
import 'package:app/shared/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String title;
  final List<String> list;
  final String selected;
  const CustomDropDown({super.key, required this.title, required this.list, required this.selected});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: DropdownButtonFormField(
                isExpanded: true,
                decoration:InputDecoration(
                   alignLabelWithHint: true ,
              filled: true,
              fillColor: AppColors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkPurple),
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.textFieldRadius),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.textFieldRadius),
                ),
              ),
                ) ,
                value: widget.selected,
                items:
                    widget.list.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value));
                    }).toList(),
                onChanged: (newValue){
                  setState((){
              
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
