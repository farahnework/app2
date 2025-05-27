import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/buttons/custom_cancel_outlined_button.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

void addNoteDialog(BuildContext context) {
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
          height: MediaQuery.of(context).size.width * 0.15,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.screenPadding,
                  vertical: AppSizes.screenPadding / 2,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Add Note', style: CustomTextStyles.header2),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers,),

                    CustomTextField(
                      hintText: 'Note',
                      icon: IconsaxPlusLinear.note_2,
                      width: MediaQuery.of(context).size.width,
                      enabled: true,
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers,),
                    Row(
                      children: [
                        CustomButton(text: 'Save', radius: true, width: 200, height: AppSizes.widgetHeight),
                        SizedBox(width: AppSizes.horiSpacesBetweenElements,),
                        CustomCancelOutlinedButton(text: 'Cancel'),
                      ],
                    )
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
