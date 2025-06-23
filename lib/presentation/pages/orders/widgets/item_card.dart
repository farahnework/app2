import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SellItemCard extends StatefulWidget {
  final double amount;
  final double price;
  final String productName;
  final String image;
  const SellItemCard({
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
          currentColor = AppColors.lightPurple.withValues(alpha: .3);
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
            horizontal: AppSizes.horizontalPadding,
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
                      borderRadius: BorderRadius.circular(context.responsiveBorderRadius(AppSizes.radius12)),
                      child: Image.asset(widget.image, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements * 2),
                  Text(
                    widget.amount.toString(),
                    style: CustomTextStyles.meduimText(context),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements * 2),
                  Text(
                    widget.productName,
                    style: CustomTextStyles.meduimText(context)
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImages.rial, width: context.responsiveFontSize(AppSizes.fontSize5),
                   colorFilter: ColorFilter.mode(AppColors.darkPurple, BlendMode.srcIn),
                   ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts,),
                  Text(
                    widget.price.toString(),
                    style: CustomTextStyles.tableHeader(context)
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
