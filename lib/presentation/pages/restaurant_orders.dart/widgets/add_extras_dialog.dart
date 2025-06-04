import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
          width: context.screenWidth * 0.6,
          height: context.screenHeight * 0.5,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontalPadding,
                ),
                color: AppColors.lightPurple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(IconsaxPlusLinear.close_circle, color: AppColors.black,),
                    ),
                    SizedBox(width: AppSizes.horiSpacesBetweentTexts,),
                    Text('Add Toppings', style: CustomTextStyles.titleText(context),)

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
                    SizedBox(height: AppSizes.verSpacesBetweenElements),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('Toppings', style: CustomTextStyles.titleText(context))],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenElements),
                    SizedBox(
                      height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          extraCard('Lettuce', 0.50, context),
                          extraCard('Tomato', 1, context),
                          extraCard('Cheese', 3.25, context),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('Add Note', style: CustomTextStyles.titleText(context))],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenElements,),
                    SizedBox(
                      width: context.screenWidth,
                      child: CustomTextField(hintText: 'Note', icon: IconsaxPlusLinear.note_2, width: 2, enabled: true))
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

Widget extraCard(String item, double price, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(right: AppSizes.horiSpacesBetweenElements),
    padding: EdgeInsets.symmetric(
      horizontal: AppSizes.horizontalPadding / 2.5,
      vertical: AppSizes.verticalPadding / 3.5,
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
      border: Border.all(color: AppColors.grey),
    ),
    child: Row(
      children: [
        Text(item, style: CustomTextStyles.meduimText(context)),
        SizedBox(width: AppSizes.horiSpacesBetweenElements),

        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding / 4),
          decoration: BoxDecoration(
            color: AppColors.yellow,
            borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
          ),

          child: Row(
            children: [
              Icon(IconsaxPlusLinear.add, size: context.responsiveIconSize(AppSizes.iconSize2)),
              SizedBox(width: AppSizes.horiSpacesBetweentTexts),
              Text(price.toString(), style: CustomTextStyles.meduimText(context)),
            ],
          ),
        ),
      ],
    ),
  );
}
