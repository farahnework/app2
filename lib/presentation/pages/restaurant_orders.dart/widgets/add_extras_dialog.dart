import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart' show AppColors;
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

void addExtrasDialog(BuildContext context, String image) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColors.lightGrey,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          color: AppColors.lightGrey,
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.3,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horiScreenPadding,
                  vertical: AppSizes.verScreenPadding / 2.5,
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horiScreenPadding,
                  vertical: AppSizes.verScreenPadding / 2,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          AppSizes.textFieldRadius,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(image, fit: BoxFit.cover),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('Add', style: CustomTextStyles.header2)],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenElements),
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          extraCard('Lettuce', 0.50),
                          extraCard('Tomato', 1),
                          extraCard('Cheese', 3.25),
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

Widget extraCard(String item, double price) {
  return Container(
    margin: EdgeInsets.only(right: AppSizes.horiSpacesBetweenElements),
    padding: EdgeInsets.symmetric(
      horizontal: AppSizes.horiScreenPadding / 2.5,
      vertical: AppSizes.verScreenPadding / 3.5,
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
      border: Border.all(color: AppColors.grey),
    ),
    child: Row(
      children: [
        Text(item, style: CustomTextStyles.header2),
        SizedBox(width: AppSizes.horiSpacesBetweenElements),

        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.horiScreenPadding / 4),
          decoration: BoxDecoration(
            color: AppColors.yellow,
            borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
          ),

          child: Row(
            children: [
              Icon(IconsaxPlusLinear.add),
              SizedBox(width: AppSizes.horiSpacesBetweentTexts),
              Text(price.toString(), style: CustomTextStyles.header2),
            ],
          ),
        ),
      ],
    ),
  );
}
