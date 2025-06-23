import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/utils/app_colors.dart';

class OrderCard extends StatefulWidget {
  final double price;
  final String orderId;
  final String type;
  final String date;
   const OrderCard({super.key, required this.price, required this.orderId, required this.type, required this.date,});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
   Color getOrderColor() {
    switch (widget.type.toLowerCase()) {
     case 'dine in':
        return AppColors.lightYellow;
      case 'في المطعم':
        return AppColors.lightYellow;

      case 'delivery':
        return AppColors.lightBlue;
      case 'توصيل':
        return AppColors.lightBlue;
      case 'takeaway':
        return AppColors.lightGreen;
      case 'سفري':
        return AppColors.lightGreen;
      default:
        return AppColors.white;
    }
  }

  var currentColor = AppColors.white;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          currentColor = AppColors.lightPurple.withValues(alpha:  0.5);
        });
      },
      onExit: (event) {
        setState(() {
          currentColor = AppColors.white;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: AppSizes.verticalPadding),
        decoration: BoxDecoration(
          color: currentColor,
          border: Border.all(color: AppColors.grey, width: AppSizes.borderSize, ),
        ),
    
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.orderId,
              style: CustomTextStyles.meduimText(context),
            ),
            Text(
              widget.date,
              style: CustomTextStyles.meduimText(context),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  SvgPicture.asset(AppImages.rial, width: context.responsiveFontSize(AppSizes.fontSize6), 
                  colorFilter: ColorFilter.mode(AppColors.darkPurple, BlendMode.srcIn),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                  Text(
                    widget.price.toString(),
                    style: CustomTextStyles.meduimText(context).copyWith(color: AppColors.darkPurple, fontWeight: AppSizes.fontWeight1)
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding/2, vertical: AppSizes.verticalPadding/5),
              decoration:  BoxDecoration(
                color: getOrderColor(),
                borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
              ),
              child: Center(child: Text(widget.type, style: CustomTextStyles.meduimText(context))),
            )
          ],
        ),
      ),
    );
  }
}
