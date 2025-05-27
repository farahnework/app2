import 'package:app/presentation/pages/sell/widgets/product_info_dialog.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../shared/utils/app_colors.dart';

class OrderCard extends StatefulWidget {
  final double price;
  final String orderId;
  final String type;
  final String date;
  const OrderCard({super.key, required this.price, required this.orderId, required this.type, required this.date});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
   Color getOrderColor() {
    switch (widget.type.toLowerCase()) {
      case 'dine in':
        return AppColors.yellow;
      case 'delivery':
        return Colors.lightBlueAccent.withAlpha(150);
      case 'takeaway':
        return Colors.lightGreenAccent;
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
          currentColor = AppColors.lightPurple.withOpacity(0.5);
        });
      },
      onExit: (event) {
        setState(() {
          currentColor = AppColors.white;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding, vertical: AppSizes.screenPadding/2),
        decoration: BoxDecoration(
          color: currentColor,
          border: Border.all(color: AppColors.grey, width: AppSizes.borderSize, ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.orderId,
              style: TextStyle(fontSize: AppSizes.fontSize2),
            ),
            Text(
              widget.date,
              style: TextStyle(fontSize: AppSizes.fontSize2),
            ),
            Row(
              children: [
                SvgPicture.asset(AppImages.rial, width: AppSizes.fontSize3, color: AppColors.darkPurple,),
                SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                Text(
                  widget.price.toString(),
                  style: TextStyle(
                    color: AppColors.darkPurple,
                    fontWeight: FontWeight.w900,
                    fontSize: AppSizes.fontSize2,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding/2, vertical: AppSizes.screenPadding/5),
              decoration:  BoxDecoration(
                color: getOrderColor(),
                borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
              ),
              child: Center(child: Text(widget.type, style: TextStyle(fontSize: AppSizes.fontSize2),)),
            )
          ],
        ),
      ),
    );
  }
}
