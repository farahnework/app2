import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/core/responsive/responsive_sizing.dart';
import 'package:app/core/responsive/screen_layouts.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:easy_localization/easy_localization.dart';

void productInfoDialog(BuildContext context) {
  int crossAxisCount =
      context.isMobile
          ? ScreenLayouts.mobileCrossAxisCount
          : ResponsiveSizing.isTablet(context)
          ? ScreenLayouts.tabletCrossAxisCount
          : ScreenLayouts.desktopCrossAxisCount;

  double spacing =
      context.isMobile
          ? ScreenLayouts.mobileSpacing
          : ResponsiveSizing.isTablet(context)
          ? ScreenLayouts.tabletSpacing
          : ScreenLayouts.desktopSpacing;
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColors.lightGrey,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          color: AppColors.white,
          width:
              context.screenWidth /
              (context.isDesktop
                  ? 1.8
                  : context.isMobile
                  ? 1
                  : 1.5),
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
                      StringTranslateExtension('product_name').tr(),
                      style: CustomTextStyles.tableHeader(context),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.verticalPadding),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.responsivePadding(
                    AppSizes.horizontalPadding,
                  ),
                ),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: spacing,
                    mainAxisSpacing: spacing,
                    childAspectRatio:
                        context.isDesktop
                            ? 0.95
                            : context.isMobile
                            ? 2
                            : 1.4,
                  ),
                  children: [
                    Expanded(
                      child: infoCard(
                      StringTranslateExtension('total_stock').tr(),
                        IconsaxPlusLinear.box,
                        256,
                        context,
                        AppColors.lightGreen,
                        AppColors.darkGreen,
                      ),
                    ),
                    Expanded(
                      child: infoCard(
                      StringTranslateExtension('sold_items').tr(),
                        IconsaxPlusLinear.bag_2,
                        125,
                        context,
                        AppColors.lightBlue,
                        AppColors.darkBlue,
                      ),
                    ),
                    Expanded(
                      child: infoCard(
                       StringTranslateExtension('selling_price').tr(),
                        IconsaxPlusLinear.coin,
                        115,
                        context,
                        AppColors.lightYellow,
                        AppColors.yellow,
                      ),
                    ),
                    Expanded(
                      child: infoCard(
                       StringTranslateExtension('purchase_price').tr(),
                        IconsaxPlusLinear.coin,
                        100,
                        context,
                        AppColors.lightPurple,
                        AppColors.darkPurple,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.verticalPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: AppSizes.horizontalPadding,),
                  Text(
                    StringTranslateExtension('product_information').tr(),
                    style: CustomTextStyles.titleText(context),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalPadding,
                      vertical: AppSizes.verticalPadding / 2,
                    ),
                    child: Column(
                      children: [
                        context.isMobile
                            ? Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: Offset(0, 0.5),
                                    color: AppColors.darkPurple.withValues(
                                      alpha: 0.05,
                                    ),
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
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      context.responsiveBorderRadius(
                                        AppSizes.radius12,
                                      ),
                                    ),
                                    child: Image.asset(
                                      height: context.screenHeight / 4,
                                      width: context.screenHeight / 4,
                                      'assets/images/image7.jpg',
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppSizes.verSpacesBetweenElements,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                StringTranslateExtension('sku').tr(),
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
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
                                               StringTranslateExtension('barcode').tr(),
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
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
                                                StringTranslateExtension('brand').tr(),
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
                                          ),
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
                                                StringTranslateExtension('category').tr(),
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
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
                                                StringTranslateExtension('description').tr(),
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            AppSizes.horiSpacesBetweenElements,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '55',
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '252555554',
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Apple',
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Mobile',
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Iphone 16 ',
                                                style:
                                                    CustomTextStyles.meduimText(
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
                            )
                            : Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: Offset(0, 0.5),
                                    color: AppColors.darkPurple.withValues(
                                     alpha:  0.05,
                                    ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      context.responsiveBorderRadius(
                                        AppSizes.radius12,
                                      ),
                                    ),
                                    child: Image.asset(
                                      height: context.screenHeight / 4,
                                      width: context.screenHeight / 4,
                                      'assets/images/image7.jpg',
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                StringTranslateExtension('sku').tr(),
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
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
                                                StringTranslateExtension('barcode').tr(),
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
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
                                                StringTranslateExtension('brand').tr(),
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
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
                                                StringTranslateExtension('category').tr(),
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
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
                                               StringTranslateExtension('description').tr(),
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            AppSizes.horiSpacesBetweenElements,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '55',
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '252555554',
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
                                          ),

                                          Row(
                                            children: [
                                              Text(
                                                'Apple',
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Mobile',
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                AppSizes
                                                    .verSpacesBetweenElements,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Iphone 16 ',
                                                style:
                                                    CustomTextStyles.meduimText(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    width: AppSizes.horiSpacesBetweenElements,
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
    padding: EdgeInsets.symmetric(
      horizontal: context.responsivePadding(AppSizes.horizontalPadding / 2),
      vertical: context.responsivePadding(AppSizes.verticalPadding / 2),
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(
        Radius.circular(context.responsiveIconSize(AppSizes.radius16)),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          size: context.responsiveIconSize(AppSizes.iconSize),
          icon,
          color: iconColor,
        ),
        SizedBox(width: AppSizes.horiSpacesBetweenElements),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
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
