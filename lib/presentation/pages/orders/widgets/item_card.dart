import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SellItemCard extends StatefulWidget {
  final double amount;
  final double price;
  final String productName;
  final String image;
  SellItemCard({
    super.key,
    required this.amount,
    required this.price,
    required this.productName,
    required this.image,
  });

  @override
  State<SellItemCard> createState() => _SellItemCardState();
}

class _SellItemCardState extends State<SellItemCard> {
  var currentColor = AppColors.white;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          currentColor = AppColors.lightPurple.withOpacity(0.3);
        });
      },
      onExit: (event) {
        setState(() {
          currentColor = AppColors.white;
        });
      },
      child: InkWell(
        highlightColor: AppColors.lightPurple,
        focusColor: AppColors.lightPurple,
        hoverColor: AppColors.lightPurple,
        child: Container(
          margin: EdgeInsets.only(
            bottom: AppSizes.verSpacesBetweenElements / 2,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenPadding / 2,
            vertical: 5,
          ),
          height: 60,
          decoration: BoxDecoration(
            color: currentColor,
            border: Border(bottom: BorderSide(color: AppColors.grey)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
                      child: Image.asset(widget.image, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements * 2),
                  Text(
                    widget.amount.toString(),
                    style: CustomTextStyles.header2,
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements * 2),
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontSize: AppSizes.fontSize2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: AppSizes.fontSize2,
                    height: AppSizes.fontSize2,
                    child: SvgPicture.asset(
                      AppImages.rial,
                      color: AppColors.darkPurple,
                    ),
                  ),
                  Text(
                    widget.price.toString(),
                    style: TextStyle(
                      color: AppColors.darkPurple,
                      fontSize: AppSizes.fontSize1,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
