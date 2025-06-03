import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart' show AppColors;
import 'package:app/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

void productInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColors.lightGrey,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          color: AppColors.white,
         width: context.screenWidth / (context.isDesktop ? 1.8 : 1.5),
            height: context.screenHeight / 1.4,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontalPadding,
                  vertical: AppSizes.verticalPadding / 2.5,
                ),
                color: AppColors.lightPurple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(IconsaxPlusLinear.close_circle),
                    ),
                    Text('Product Name', style: CustomTextStyles.tableHeader(context)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontalPadding,
                  vertical: AppSizes.verticalPadding / 2,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        infoCard('Total Stock', IconsaxPlusLinear.box, 256, context),
                        infoCard(
                          'Total pieces sold',
                          IconsaxPlusLinear.bag_2,
                          125,
                          context
                        ),
                        infoCard('Selling price', IconsaxPlusLinear.coin, 115, context),
                        infoCard('Purchase Price', IconsaxPlusLinear.coin, 100, context),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Product Information',
                          style: CustomTextStyles.meduimText(context),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenElements),

                    CustomContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        IconsaxPlusLinear.hashtag_1,
                                        color: AppColors.darkPurple,
                                        size: AppSizes.iconSize,
                                      ),
                                      SizedBox(
                                        width: AppSizes.horiSpacesBetweentTexts,
                                      ),
                                      Text(
                                        'SKU:',
                                        style: CustomTextStyles.meduimText(context),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSizes.verSpacesBetweenElements,
                                  ),

                                  Row(
                                    children: [
                                      Icon(
                                        IconsaxPlusLinear.barcode,
                                        color: AppColors.darkPurple,
                                        size: AppSizes.iconSize,
                                      ),
                                      SizedBox(
                                        width: AppSizes.horiSpacesBetweentTexts,
                                      ),
                                      Text(
                                        'Barcode:',
                                        style: CustomTextStyles.meduimText(context),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSizes.verSpacesBetweenElements,
                                  ),

                                  Row(
                                    children: [
                                      Icon(
                                        IconsaxPlusLinear.tag_2,
                                        color: AppColors.darkPurple,
                                        size: AppSizes.iconSize,
                                      ),
                                      SizedBox(
                                        width: AppSizes.horiSpacesBetweentTexts,
                                      ),
                                      Text(
                                        'Brand:',
                                        style: CustomTextStyles.meduimText(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: AppSizes.horiSpacesBetweenElements,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('55', style: CustomTextStyles.meduimText(context)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSizes.verSpacesBetweenElements,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '252555554',
                                        style: CustomTextStyles.meduimText(context),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSizes.verSpacesBetweenElements,
                                  ),

                                  Row(
                                    children: [
                                      Text(
                                        'Apple',
                                        style: CustomTextStyles.meduimText(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        IconsaxPlusLinear.tag,
                                        color: AppColors.darkPurple,
                                        size: AppSizes.iconSize,
                                      ),
                                      SizedBox(
                                        width: AppSizes.horiSpacesBetweentTexts,
                                      ),
                                      Text(
                                        'Category:',
                                        style: CustomTextStyles.meduimText(context),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSizes.verSpacesBetweenElements,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        IconsaxPlusLinear.document_1,
                                        color: AppColors.darkPurple,
                                        size: AppSizes.iconSize,
                                      ),
                                      SizedBox(
                                        width: AppSizes.horiSpacesBetweentTexts,
                                      ),
                                      Text(
                                        'Description:',
                                        style: CustomTextStyles.meduimText(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: AppSizes.horiSpacesBetweenElements,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Mobile',
                                        style: CustomTextStyles.meduimText(context),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSizes.verSpacesBetweenElements,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Iphone 16 ',
                                        style: CustomTextStyles.meduimText(context),
                                      ),
                                    ],
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
            ],
          ),
        ),
      );
    },
  );
}

Widget infoCard(String title, IconData icon, int number, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: AppSizes.horizontalPadding / 1.5,
      vertical: AppSizes.verticalPadding / 2,
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset(0, 0.5),
          color: AppColors.darkPurple.withOpacity(0.05),
          spreadRadius: 1,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.darkPurple, weight: context.responsiveIconSize(AppSizes.iconSize),),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),
            Text(number.toString(), style: CustomTextStyles.titleText(context)),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements / 2),
        Text(
          title,
          style: TextStyle(
            color: AppColors.darkGray,
            fontSize: context.responsiveFontSize(AppSizes.fontSize4),
          ),
        ),
      ],
    ),
  );
}
