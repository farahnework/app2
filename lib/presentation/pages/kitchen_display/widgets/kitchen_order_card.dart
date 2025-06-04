import 'package:app/core/responsive/context_extension.dart';
import 'package:app/core/responsive/responsive_sizing.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/responsive/app_sizes.dart';

class KitchenOrderCard extends StatelessWidget {
  final String orderId;
  final String type;
  final List<Map<String, dynamic>> items;
  ScrollController _scrollController = ScrollController();

  KitchenOrderCard({
    super.key,
    required this.orderId,
    required this.type,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    Color getOrderColor() {
      switch (type.toLowerCase()) {
        case 'dine in':
          return AppColors.lightYellow;
        case 'delivery':
          return AppColors.lightBlue;
        case 'takeaway':
          return AppColors.lightGreen;
        default:
          return AppColors.white;
      }
    }
    Color getTextColor() {
      switch (type.toLowerCase()) {
        case 'dine in':
          return AppColors.yellow;
        case 'delivery':
          return AppColors.darkBlue;
        case 'takeaway':
          return AppColors.darkGreen;
        default:
          return AppColors.white;
      }
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
      child: Container(
        decoration: CustomBoxDecoration.boxDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: context.screenWidth,
              padding: EdgeInsets.symmetric(
                horizontal: context.responsivePadding(AppSizes.horizontalPadding),
                vertical: context.responsivePadding(AppSizes.verticalPadding/2),
              ),
              decoration: BoxDecoration(color: getOrderColor()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderId,
                    style: CustomTextStyles.titleText(context).copyWith(color: getTextColor())
                  ),
                  Text(
                    type,
                    style: CustomTextStyles.titleText(context).copyWith(color: getTextColor())
                  ),
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.responsivePadding(
                        AppSizes.horizontalPadding,
                      ),
                    ),
                    child: Column(
                      children:
                          items.map((item) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: context.responsivePadding(
                                  AppSizes.verticalPadding / 4,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "${item['quantity']}x",
                                    style: TextStyle(
                                      fontWeight: AppSizes.fontWeight2,
                                      fontSize:
                                          ResponsiveSizing.getResponsiveFontSize(
                                            context,
                                            AppSizes.fontSize3,
                                          ),
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: context.responsiveHorizontalSpacing,),
                                  Text(
                                    item['name'],
                                    style: TextStyle(
                                      fontSize:
                                          ResponsiveSizing.getResponsiveFontSize(
                                            context,
                                            AppSizes.fontSize3,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.responsivePadding(
                  AppSizes.horizontalPadding / 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Next',
                      radius: true,
                      width: MediaQuery.of(context).size.width,
                      height: AppSizes.widgetHeight,
                      color: getOrderColor(),
                      textColor: getTextColor(),
                    ),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements),
                  CustomButton(
                    text: 'Previos Step',
                    radius: true,
                    width: context.screenWidth,
                    height: AppSizes.widgetHeight,
                    color: AppColors.grey,
                    textColor: AppColors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.verSpacesBetweenElements),
          ],
        ),
      ),
    );
  }
}
