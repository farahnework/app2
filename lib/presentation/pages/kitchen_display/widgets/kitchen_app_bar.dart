import 'package:app/presentation/pages/sell/widgets/close_session_buton.dart';
import 'package:app/presentation/pages/session_details/session_details_page.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

class KitchenAppBar extends StatelessWidget {
  const KitchenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.screenPadding,
          vertical: AppSizes.screenPadding / 3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CustomMenuButton(icon: Icons.settings),
                Container(
                  height: AppSizes.iconButtonSize,
                  width: AppSizes.iconButtonSize,

                  decoration: BoxDecoration(
                    color: AppColors.lightPurple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSizes.textFieldRadius),
                    ),
                  ),
                  child: Center(
                    child: Text('T', style: CustomTextStyles.header1),
                  ),
                ),
                SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tareq Taha', style: CustomTextStyles.header2),
                    Text(
                      '${DateFormat('yyyy/mm/dd hh:mm').format(DateTime.now())}',
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text('Current Session: ', style: CustomTextStyles.header2),
                Text(
                  'Main shift',
                  style: TextStyle(fontSize: AppSizes.fontSize2),
                ),
                Text(', ', style: TextStyle(fontSize: AppSizes.fontSize2)),
                Text(
                  'Device 1',
                  style: TextStyle(fontSize: AppSizes.fontSize2),
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

                CustomButton(
                  text: 'Session Details',
                  radius: true,
                  width: 150,
                  page: SessionDetailsPage(),
                  height: AppSizes.iconButtonSize,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
