import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/sell/widgets/close_dialog_button.dart';
import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/buttons/custom_outlined_button.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void chooseDeviceDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColors.lightGrey,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          color: AppColors.lightGrey,
          width:
              context.screenWidth *
              (context.isDesktop
                  ? 0.5
                  : context.isTablet
                  ? 0.6
                  : 1),
          height:
              context.screenHeight *
              (context.isDesktop
                  ? 0.5
                  : context.isTablet
                  ? 0.6
                  : 0.5),
          padding: EdgeInsets.symmetric(
            horizontal:
                context.responsivePadding(AppSizes.horizontalPadding) * 4,
            vertical: context.responsivePadding(AppSizes.horizontalPadding) / 2,
          ),
          child: Column(
            children: [
              SizedBox(height: AppSizes.verSpacesBetweenContainers),
              Text(
                'Select session details',
                style: CustomTextStyles.titleText(context),
              ),
              SizedBox(height: AppSizes.verSpacesBetweenContainers),

              Row(
                children: [
                  Expanded(
                    child: CustomDropDownButton(
                      color: AppColors.white,
                      title: 'Shift',
                      list: ['Main Shift', 'Shift 2'],
                      selected: 'Main Shift',
                      width: 400,
                      height: AppSizes.widgetHeight,
                      icon: Iconsax.devices,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements * 2),

              Row(
                children: [
                  Expanded(
                    child: CustomDropDownButton(
                      color: AppColors.white,
                      title: 'Device',
                      list: ['Device 1', 'Device 2'],
                      selected: 'Device 1',
                      width: 400,
                      height: AppSizes.widgetHeight,
                      icon: Iconsax.devices,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenContainers * 1.5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Expanded(
                    child: CloseDialogButton(
                      text: 'Start the session',
                      radius: true,
                      context: dialogContext,
                    ),
                  ),
                  if (!context.isMobile)
                    SizedBox(width: AppSizes.horiSpacesBetweenElements),
                  if (!context.isMobile)
                    CustomOutlinedButton(text: 'Cancel', page: HomePage()),
                ],
              ),
              if (context.isMobile)
                SizedBox(height: AppSizes.verSpacesBetweenElements),
              if (context.isMobile)
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        text: 'Cancel',
                        page: HomePage(),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
    },
  );
}
