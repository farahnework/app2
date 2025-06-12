import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

class CustomersAppBar extends StatefulWidget {
  const CustomersAppBar({super.key});

  @override
  State<CustomersAppBar> createState() => _CustomersAppBarState();
}

class _CustomersAppBarState extends State<CustomersAppBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                    'Customers',
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
                  child: Image.asset('lib/assets/images/user.jpg'),
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
                    '${DateFormat('yyyy/mm/dd hh:mm').format(DateTime.now())}',
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