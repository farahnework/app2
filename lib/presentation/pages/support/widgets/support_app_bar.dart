import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/core/theming/app_colors.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:easy_localization/easy_localization.dart';

class SupportAppBar extends StatelessWidget {
  const SupportAppBar({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      // decoration: BoxDecoration(
      //   color: AppColors.white,
      //   border: Border(
      //     bottom: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
      //   ),
      // ),
      decoration: CustomBoxDecoration.boxDecoration.copyWith(
        borderRadius: BorderRadius.circular(0),
        border: Border(bottom: BorderSide(width: AppSizes.borderSize, color: AppColors.grey))
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding,
        vertical: AppSizes.verticalPadding / 2,
      ),

      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             if (!context.isDesktop)
                InkWell(
                  onTap: () {
                    Get.back();
                    
                  },
                  child: const Icon(IconsaxPlusLinear.arrow_left_1),
                ),
              SizedBox(width: AppSizes.horiSpacesBetweenElements),
              
               SizedBox(width: AppSizes.horiSpacesBetweentTexts),
              
               Text(
                    StringTranslateExtension('customer_support').tr(),
                    style: TextStyle(
                      fontSize: context.responsiveFontSize(AppSizes.fontSize1,),
                      fontWeight: AppSizes.fontWeight1,
                      color: AppColors.darkPurple
                    ),
                  ),
              
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: AppSizes.horiSpacesBetweenElements),
              SizedBox(
                height: context.responsiveWidgetHeight,
                child: CircleAvatar(
                  child: Image.asset('assets/images/user.jpg'),
                ),
              ),

              SizedBox(width: AppSizes.horiSpacesBetweentTexts),
              if(!context.isMobile)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tareq Taha',
                    style: TextStyle(
                      fontSize: context.responsiveFontSize(AppSizes.fontSize3),
                      fontWeight: AppSizes.fontWeight1,
                    ),
                  ),
                  Text(
                    '${DateFormat.yMMMEd('en').format(DateTime.now())}',
                    style: TextStyle(
                      fontSize: context.responsiveFontSize(AppSizes.fontSize5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}