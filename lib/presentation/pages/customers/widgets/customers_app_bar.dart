import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
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
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.grey, width: AppSizes.borderSize)),
      ),
      padding: EdgeInsets.only(
        top: AppSizes.horiScreenPadding/2,
        bottom: AppSizes.verScreenPadding/2,
      ),

      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.horiScreenPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Customers', style: CustomTextStyles.header1,)
                
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CustomMenuButton(icon: Icons.settings),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.lightPurple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSizes.textFieldRadius),
                    ),
                  ),
                  child: Center(child: Text('T', style: CustomTextStyles.header1)),
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
            
          ],
        ),
      ),
    );
  }
}