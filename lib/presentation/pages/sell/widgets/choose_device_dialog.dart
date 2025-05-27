import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/sell/widgets/close_dialog_button.dart';
import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/buttons/custom_outlined_button.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
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
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.25,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenPadding,
            vertical: AppSizes.screenPadding / 2,
          ),
          child: Column(
            children: [
              SizedBox(height: AppSizes.verSpacesBetweenContainers),
              Text('Select session details', style: CustomTextStyles.header1),
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
              SizedBox(height: AppSizes.verSpacesBetweenElements),

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
              SizedBox(height: AppSizes.verSpacesBetweenContainers),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CloseDialogButton(
                    text: 'Start the session',
                    radius: true,
                    width: 200,
                    context: dialogContext,
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements),
                  CustomOutlinedButton(text: 'Cancel', page: HomePage()),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
