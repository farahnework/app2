import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class OrderNumberCard extends StatefulWidget {
  final String orderNumber;
  final bool isActive;
  const OrderNumberCard({super.key, required this.orderNumber, required this.isActive});

  @override
  State<OrderNumberCard> createState() => _OrderNumberCardState();
}

class _OrderNumberCardState extends State<OrderNumberCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: AppSizes.horiSpacesBetweentTexts),
      decoration: widget.isActive?
       BoxDecoration(
        color: AppColors.lightGrey,
       ): BoxDecoration(
        color: AppColors.lightPurple,
        border: Border(
          right: BorderSide(color: AppColors.white),
          left: BorderSide(color: AppColors.white),
          )
       ),
      width: AppSizes.widgetHeight +20,
      height: AppSizes.widgetHeight,
      child: Center(
        child: Text('# ${widget.orderNumber}', style: CustomTextStyles.smallText(context)),
      ),
    );
  }
}
