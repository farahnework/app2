import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/sell/widgets/close_session_buton.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

class SessionAppBar extends StatelessWidget {
  const SessionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
        ),
      ),
      width: context.screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding,
          vertical: AppSizes.verticalPadding /2 ,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.responsiveWidgetHeight,
                  child: CircleAvatar(child: Image.asset('lib/assets/images/user.jpg'), )),
               
                SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tareq Taha', style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize2), fontWeight: AppSizes.fontWeight1),),
                    Text(
                      '${DateFormat('yyyy/mm/dd hh:mm').format(DateTime.now())}'
                      , style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize4)),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text('Current Session: ',  style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize2), fontWeight: AppSizes.fontWeight1),),
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
                SizedBox(width: AppSizes.horiSpacesBetweenElements),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
