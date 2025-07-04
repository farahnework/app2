import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/sell/widgets/close_session_buton.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:easy_localization/easy_localization.dart';

class KitchenAppBar extends StatelessWidget {
  const KitchenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: CustomBoxDecoration.boxDecoration.copyWith(
        borderRadius: BorderRadius.circular(0),
        border: Border(bottom: BorderSide(width: AppSizes.borderSize, color: AppColors.grey))
      ),
      width: context.screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding,
          vertical: AppSizes.verticalPadding/2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.responsiveWidgetHeight,
                  child: CircleAvatar(child: Image.asset('assets/images/user.jpg'), )),
               
                SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                if(!context.isMobile)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tareq Taha', style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize2), fontWeight: AppSizes.fontWeight1),),
                    Text(
                      DateFormat.yMMMEd('en').format(DateTime.now())
                      , style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize4)),
                    ),
                  ],
                ),
              ],
            ),
            if(!context.isMobile)
            Row(
              children: [
                Text(StringTranslateExtension('current_session').tr(), style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize2), fontWeight: AppSizes.fontWeight1),),
                Text(': ', style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize2), fontWeight: AppSizes.fontWeight1),),
                Text(
                  'Main shift',
                   style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize2)),
                ),
                Text(', ',  style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize2)),),
                Text(
                  'Device 1',
                   style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize2)),
                ),
              ],
            ),
            Row(
              children: [
                CloseSessionButton(
                  icon: IconsaxPlusLinear.logout,
                  color: AppColors.darkPurple,
                  iconColor: AppColors.lightPurple,
                  size: AppSizes.iconButtonSize,
                ),
                // SizedBox(width: AppSizes.horiSpacesBetweenElements),

                // CustomButton(
                //   text: 'Session Details',
                //   radius: true,
                //   width: 150,
                //   page: SessionDetailsPage(),
                //   height: AppSizes.widgetHeight,
                //   color: AppColors.darkPurple,
                //   textColor: AppColors.white,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
