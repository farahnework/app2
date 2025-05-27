import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart' show AppColors;
import 'package:app/shared/utils/app_sizes.dart';
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
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.screenPadding,
                  vertical: AppSizes.screenPadding / 2.5,
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
                    Text('Product Name', style: CustomTextStyles.header2),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.screenPadding,
                  vertical: AppSizes.screenPadding / 2,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        infoCard('Total Stock', IconsaxPlusLinear.box, 256),
                        infoCard(
                          'Total pieces sold',
                          IconsaxPlusLinear.bag_2,
                          125,
                        ),
                        infoCard('Selling price', IconsaxPlusLinear.coin, 115),
                        infoCard('Purchase Price', IconsaxPlusLinear.coin, 100),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Product Information',
                          style: CustomTextStyles.header2,
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
                                        style: CustomTextStyles.header2,
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
                                        style: CustomTextStyles.header2,
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
                                        style: CustomTextStyles.header2,
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
                                      Text('55', style: CustomTextStyles.body),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSizes.verSpacesBetweenElements,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '252555554',
                                        style: CustomTextStyles.body,
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
                                        style: CustomTextStyles.body,
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
                                        style: CustomTextStyles.header2,
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
                                        style: CustomTextStyles.header2,
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
                                        style: CustomTextStyles.body,
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
                                        style: CustomTextStyles.body,
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

Widget infoCard(String title, IconData icon, int number) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: AppSizes.screenPadding / 1.5,
      vertical: AppSizes.screenPadding / 2,
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
            Icon(icon, color: AppColors.darkPurple),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),
            Text(number.toString(), style: CustomTextStyles.header2),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements / 2),
        Text(
          title,
          style: TextStyle(
            color: AppColors.darkGray,
            fontSize: AppSizes.fontSize3,
          ),
        ),
      ],
    ),
  );
}
