import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductsAppBar extends StatefulWidget {
  const ProductsAppBar({super.key});

  @override
  State<ProductsAppBar> createState() => _ProductsAppBarState();
}

class _ProductsAppBarState extends State<ProductsAppBar> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
     
      padding: EdgeInsets.only(
        top: AppSizes.verScreenPadding / 2,
        bottom: AppSizes.verScreenPadding / 2,
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
                Text(
                  'Manage Products',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: AppSizes.fontSize1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
                      DateFormat.yMMMEd('en').format(DateTime.now()),
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
