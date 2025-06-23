import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/restaurant_orders.dart/widgets/add_note_dialog.dart';
import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:app/shared/utils/app_images.dart';
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
  const SellProductCard({
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
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.only(bottom: AppSizes.verSpacesBetweenElements / 2),
        color: AppColors.lightPurple,
        alignment: Alignment.centerRight,
        
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(IconsaxPlusLinear.trash, color: AppColors.darkPurple, size: context.responsiveIconSize(AppSizes.iconSize),),
      ),

      key: Key('1'),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            currentColor = AppColors.lightYellow.withValues(alpha:  0.2);
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
              horizontal: AppSizes.horizontalPadding / 2,
              vertical: AppSizes.verticalPadding / 2,
            ),
            decoration: BoxDecoration(
              color: currentColor,
              border: Border(bottom: BorderSide(color: AppColors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.responsiveRelativeSize(
                    containerSize: context.screenHeight,
                    percentage: AppSizes.widgetHeight * 1.5,
                  ),
                  height: context.responsiveRelativeSize(
                    containerSize: context.screenHeight,
                    percentage: AppSizes.widgetHeight * 1.5,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppSizes.textFieldRadius,
                    ),
                    child: Image.asset(widget.image, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: context.responsiveSpacing(
                    AppSizes.horiSpacesBetweenElements,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.productName,
                            style: CustomTextStyles.meduimText(context),
                          ),
                          Text(
                            '52',
                            style: CustomTextStyles.meduimText(context),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.responsiveSpacing(
                          AppSizes.horiSpacesBetweenElements * 0.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  if (context.isDesktop)
                                    CustomIconButton(
                                      icon: Iconsax.minus,
                                      iconColor: AppColors.white,
                                      color: AppColors.grey,
                                      size: AppSizes.widgetHeight * 0.7,
                                      onPresse: addNoteDialog,
                                    ),
                                  if (context.isDesktop)
                                    SizedBox(
                                      width: AppSizes.horiSpacesBetweenElements,
                                    ),

                                  Text(
                                    widget.amount.toString(),
                                    style: CustomTextStyles.meduimText(context),
                                  ),
                                  if (context.isDesktop)
                                    SizedBox(
                                      width: AppSizes.horiSpacesBetweenElements,
                                    ),
                                  if (context.isDesktop)
                                    CustomIconButton(
                                      icon: Iconsax.add,
                                      iconColor: AppColors.darkPurple,
                                      size: AppSizes.widgetHeight * 0.7,
                                      color: AppColors.lightPurple,
                                      onPresse: addNoteDialog,
                                    ),
                                ],
                              ),
                              SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                              CustomDropDownButton(
                                icon: IconsaxPlusLinear.tag,
                                color: AppColors.white,
                                height: AppSizes.widgetHeight * 0.7,
                                title: "Unit",
                                list: ["Kilo", "Peace"],
                                selected: "Peace",
                                width: 100,
                              ),
                            ],
                          ),

                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.rial,
                                  width: context.responsiveFontSize(
                                    AppSizes.fontSize4,
                                  ),
                                  colorFilter: ColorFilter.mode(AppColors.darkPurple, BlendMode.srcIn),
                                ),
                                SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                                Text(
                                  widget.price.toString(),
                                  style: TextStyle(
                                    fontSize: context.responsiveFontSize(
                                      AppSizes.fontSize2,
                                    ),
                                    fontWeight: AppSizes.fontWeight2,
                                    color: AppColors.darkPurple,
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}
