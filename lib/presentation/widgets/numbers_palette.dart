import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class NumbersPalette extends StatefulWidget {
  const NumbersPalette({super.key});

  @override
  State<NumbersPalette> createState() => _NumbersPaletteState();
}

class _NumbersPaletteState extends State<NumbersPalette> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding / 2),
      child: Column(
        children: [
          Row(
            children: [
              Number(number:'1'),
              SizedBox(width: AppSizes.verSpacesBetweenElements),
              Number(number:'2'),
              SizedBox(width: AppSizes.verSpacesBetweenElements),
              
              Number(number:'3'),

              SizedBox(width: AppSizes.verSpacesBetweenElements),
              Number(number:'0'),
            ],
          ),
          SizedBox(height: AppSizes.verSpacesBetweenElements),
         Row(
            children: [
              Number(number:'4'),
              SizedBox(width: AppSizes.verSpacesBetweenElements),
              Number(number:'5'),
              SizedBox(width: AppSizes.verSpacesBetweenElements),
              
              Number(number:'6'),

              SizedBox(width: AppSizes.verSpacesBetweenElements),
              Number(number:'Delete'),
            ],
          ),
          SizedBox(height: AppSizes.verSpacesBetweenElements),

          Row(
            children: [
              Number(number:'7'),
              SizedBox(width: AppSizes.verSpacesBetweenElements),
              Number(number:'8'),
              SizedBox(width: AppSizes.verSpacesBetweenElements),
              
              Number(number:'9'),

              SizedBox(width: AppSizes.verSpacesBetweenElements),
              Number(number:'Enter'),
            ],
          ),
        ],
      ),
    );
  }
  

}

class Number extends StatefulWidget {
  final String number;
  const Number({super.key, required this.number});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
    Color color = AppColors.lightPurple;

  @override
  Widget build(BuildContext context) {
 
  return Expanded(
    child: MouseRegion(
      onEnter: (event) {
        setState(() {
          color = AppColors.grey.withAlpha(200);
        });
      },
      onExit: (event) {
        setState(() {
          color = AppColors.lightPurple;
        });
      },
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSizes.textFieldRadius / 2),
        ),
        child: Center(
          child: Text(
          widget.number,
            style: TextStyle(
              color: AppColors.black,
              fontSize: AppSizes.fontSize2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  );

  }
}


