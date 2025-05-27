import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../shared/utils/app_colors.dart';

class SellProductCard extends StatefulWidget {
  final double amount;
  final double price;
  final String productName;
  final String image;
  SellProductCard({
    super.key,
    required this.amount,
    required this.price,
    required this.productName,
    required this.image,
  });

  @override
  State<SellProductCard> createState() => _SellProductCardState();
}

class _SellProductCardState extends State<SellProductCard> {
  var currentColor = AppColors.white;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          currentColor = AppColors.lightYellow.withOpacity(0.2);
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
            vertical: AppSizes.screenPadding / 3,
          ),
          height: 100,
          decoration: BoxDecoration(
            color: currentColor,
            border: Border(bottom: BorderSide(color: AppColors.grey)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
                  child: Image.asset(widget.image, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: AppSizes.horiSpacesBetweenElements * 2),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            fontSize: AppSizes.fontSize2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.trash,
                            color: AppColors.red,
                            size: AppSizes.iconSize,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                CustomIconButton(
                                  icon: Iconsax.minus,
                                  iconColor: AppColors.white,
                                  color: AppColors.grey,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: AppSizes.horiSpacesBetweenElements,
                                ),

                                Text(
                                  widget.amount.toString(),
                                  style: CustomTextStyles.header2,
                                ),

                                SizedBox(
                                  width: AppSizes.horiSpacesBetweenElements,
                                ),
                                CustomIconButton(
                                  icon: Iconsax.add,
                                  iconColor: AppColors.darkPurple,
                                  size: 30,
                                  color: AppColors.lightPurple,
                                ),
                              ],
                            ),
                            SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                            CustomDropDownButton(
                              icon: IconsaxPlusLinear.tag,
                              color: AppColors.white,
                              height: 30,
                              title: "Unit",
                              list: ["Kilo", "Peace"],
                              selected: "Peace",
                              width: 100,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
