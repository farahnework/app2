import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/orders/widgets/item_card.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class OrderDetails extends StatefulWidget {
  final double price;
  final String orderId;
  final String type;
  final String date;
  const OrderDetails({
    super.key,
    required this.price,
    required this.orderId,
    required this.type,
    required this.date,
  });

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  Color getOrderColor() {
    switch (widget.type.toLowerCase()) {
      case 'dine_in':
        return AppColors.yellow;
      case 'في المطعم':
        return AppColors.yellow;

      case 'delivery':
        return AppColors.darkBlue;
      case 'توصيل':
        return AppColors.yellow;
      case 'takeaway':
        return AppColors.darkGreen;
      case 'سفري':
        return AppColors.yellow;
      default:
        return AppColors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(right: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
              ),
            ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(bottom: BorderSide(color: AppColors.grey)),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalPadding,
              vertical: AppSizes.verticalPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Iconsax.user,
                      color: AppColors.darkPurple,
                      size: context.responsiveIconSize(AppSizes.iconSize2),
                    ),
                    SizedBox(width: AppSizes.horiSpacesBetweenElements),
      
                    Text(
                     StringTranslateExtension('general_customer').tr(),
                      style: CustomTextStyles.meduimText(context),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.verSpacesBetweenElements),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.type,
                      style: CustomTextStyles.smallText(context).copyWith(
                        color: getOrderColor(),
                        fontWeight: AppSizes.fontWeight2,
                      ),
                    ),
      
                    Text(
                      widget.orderId,
                      style: CustomTextStyles.smallText(context),
                    ),
                    Text(widget.date, style: CustomTextStyles.smallText(context)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizes.verSpacesBetweenElements),
      
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
      
              children: [
                SellItemCard(
                  image: 'assets/images/food5.jpg',
                  amount: 1,
                  price: 15,
                  productName: "Rice with checken",
                ),
                SellItemCard(
                  image: 'assets/images/food3.jpg',
                  amount: 2,
                  price: 30,
                  productName: "Checken",
                ),
                SellItemCard(
                  image: 'assets/images/food2.jpg',
                  amount: 2,
                  price: 30,
                  productName: "Bluebary sweet",
                ),
                SellItemCard(
                  image: 'assets/images/food10.jpg',
                  amount: 1,
                  price: 25,
                  productName: "Frid Checken",
                ),
                SellItemCard(
                  image: 'assets/images/food12.jpg',
                  amount: 2,
                  price: 10,
                  productName: "Fast Food",
                ),
              ],
            ),
          ),
      
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                top: BorderSide(
                  color: AppColors.darkPurple,
                  width: AppSizes.borderSize,
                ),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontalPadding,
                    vertical: AppSizes.widgetHeight / 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringTranslateExtension('total').tr(), style: CustomTextStyles.titleText(context)),
      
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                      Directionality(
                        textDirection: ui.TextDirection.ltr,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.rial,
                              width: context.responsiveFontSize(AppSizes.fontSize5),
                              color: AppColors.darkPurple,
                            ),
                            SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                        
                            Text(
                              '2000',
                              style: CustomTextStyles.titleText(
                                context,
                              ).copyWith(color: AppColors.darkPurple),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: StringTranslateExtension('done').tr(),
                        radius: false,
                        width: 200,
                        height: AppSizes.widgetHeight,
                        color: AppColors.darkPurple,
                        textColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
