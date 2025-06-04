import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart' show AppColors;
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
                  vertical: AppSizes.verticalPadding / 5,
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
                    Text(
                      'Product Name',
                      style: CustomTextStyles.tableHeader(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalPadding,
                      vertical: AppSizes.verticalPadding / 2,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: infoCard(
                                'Total Stock',
                                IconsaxPlusLinear.box,
                                256,
                                context,
                                AppColors.lightGreen,
                                AppColors.darkGreen,
                              ),
                            ),
                            SizedBox(width: AppSizes.horiSpacesBetweenElements),
                            Expanded(
                              child: infoCard(
                                'Total pieces sold',
                                IconsaxPlusLinear.bag_2,
                                125,
                                context,
                                AppColors.lightBlue,
                                AppColors.darkBlue,
                              ),
                            ),
                            SizedBox(width: AppSizes.horiSpacesBetweenElements),
                            Expanded(
                              child: infoCard(
                                'Selling price',
                                IconsaxPlusLinear.coin,
                                115,
                                context,
                                AppColors.lightYellow,
                                AppColors.yellow,
                              ),
                            ),
                            SizedBox(width: AppSizes.horiSpacesBetweenElements),
                            Expanded(
                              child: infoCard(
                                'Purchase Price',
                                IconsaxPlusLinear.coin,
                                100,
                                context,
                                AppColors.lightPurple,
                                AppColors.darkPurple,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Product Information',
                              style: CustomTextStyles.titleText(context),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenElements),

                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                offset: Offset(0, 0.5),
                                color: AppColors.darkPurple.withOpacity(0.05),
                                spreadRadius: 1,
                              ),
                            ],
                            color: AppColors.white,
                            border: Border.all(
                              color: AppColors.grey,
                              width: 0.4,
                            ),

                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSizes.textFieldRadius),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(context.responsiveBorderRadius(AppSizes.radius12)),
                                child: Image.asset(
                                  height: context.screenHeight / 4,
                              width: context.screenHeight / 4,
                                  'lib/assets/images/image7.jpg',
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            IconsaxPlusLinear.hashtag_1,
                                            color: AppColors.darkPurple,
                                            size: AppSizes.iconSize,
                                          ),
                                          SizedBox(
                                            width:
                                                AppSizes
                                                    .horiSpacesBetweentTexts,
                                          ),
                                          Text(
                                            'SKU:',
                                            style: CustomTextStyles.meduimText(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppSizes.verSpacesBetweenElements,
                                      ),

                                      Row(
                                        children: [
                                          Icon(
                                            IconsaxPlusLinear.barcode,
                                            color: AppColors.darkPurple,
                                            size: AppSizes.iconSize,
                                          ),
                                          SizedBox(
                                            width:
                                                AppSizes
                                                    .horiSpacesBetweentTexts,
                                          ),
                                          Text(
                                            'Barcode:',
                                            style: CustomTextStyles.meduimText(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppSizes.verSpacesBetweenElements,
                                      ),

                                      Row(
                                        children: [
                                          Icon(
                                            IconsaxPlusLinear.tag_2,
                                            color: AppColors.darkPurple,
                                            size: AppSizes.iconSize,
                                          ),
                                          SizedBox(
                                            width:
                                                AppSizes
                                                    .horiSpacesBetweentTexts,
                                          ),
                                          Text(
                                            'Brand:',
                                            style: CustomTextStyles.meduimText(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: AppSizes.horiSpacesBetweenElements,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '55',
                                            style: CustomTextStyles.meduimText(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppSizes.verSpacesBetweenElements,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '252555554',
                                            style: CustomTextStyles.meduimText(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppSizes.verSpacesBetweenElements,
                                      ),

                                      Row(
                                        children: [
                                          Text(
                                            'Apple',
                                            style: CustomTextStyles.meduimText(
                                              context,
                                            ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            IconsaxPlusLinear.tag,
                                            color: AppColors.darkPurple,
                                            size: AppSizes.iconSize,
                                          ),
                                          SizedBox(
                                            width:
                                                AppSizes
                                                    .horiSpacesBetweentTexts,
                                          ),
                                          Text(
                                            'Category:',
                                            style: CustomTextStyles.meduimText(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppSizes.verSpacesBetweenElements,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            IconsaxPlusLinear.document_1,
                                            color: AppColors.darkPurple,
                                            size: AppSizes.iconSize,
                                          ),
                                          SizedBox(
                                            width:
                                                AppSizes
                                                    .horiSpacesBetweentTexts,
                                          ),
                                          Text(
                                            'Description:',
                                            style: CustomTextStyles.meduimText(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: AppSizes.horiSpacesBetweenElements,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Mobile',
                                            style: CustomTextStyles.meduimText(
                                              context,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            AppSizes.verSpacesBetweenElements,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Iphone 16 ',
                                            style: CustomTextStyles.meduimText(
                                              context,
                                            ),
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
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget infoCard(
  String title,
  IconData icon,
  int number,
  BuildContext context,
  Color color,
  Color iconColor,
) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: AppSizes.verticalPadding),
    padding: EdgeInsets.symmetric(
      vertical: context.responsivePadding(AppSizes.horizontalPadding),
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(
        Radius.circular(context.responsiveIconSize(AppSizes.radius16)),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          size: context.responsiveIconSize(AppSizes.iconSize),
          icon,
          color: iconColor,
        ),
        SizedBox(width: AppSizes.horiSpacesBetweenElements),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  number.toString(),
                  style: TextStyle(
                    fontSize: context.responsiveFontSize(AppSizes.fontSize2),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Text(
              title,
              style: TextStyle(
                color: AppColors.darkGray,
                fontSize: context.responsiveFontSize(AppSizes.fontSize4),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
