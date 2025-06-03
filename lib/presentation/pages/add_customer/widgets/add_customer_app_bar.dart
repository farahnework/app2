import 'package:app/presentation/pages/customers/customers_page.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

class AddCustomerAppBar extends StatefulWidget {
  const AddCustomerAppBar({super.key});

  @override
  State<AddCustomerAppBar> createState() => _AddCustomerAppBarState();
}

class _AddCustomerAppBarState extends State<AddCustomerAppBar> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
        ),
      ),
      padding: EdgeInsets.only(
        top: AppSizes.horiScreenPadding / 2,
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
                InkWell(
                  onTap: () {
                    Get.off(CustomersPage());
                  },
                  onHover: (value) {
                    setState(() {
                      hover = value;
                    });
                  },
                  hoverColor: AppColors.darkPurple,
                  child: Text(
                    'Customers',
                    style: TextStyle(
                      color: hover ? AppColors.darkPurple : AppColors.black,
                      fontSize: AppSizes.fontSize2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.horiSpacesBetweenElements),

                Icon(IconsaxPlusLinear.arrow_right_3, color: AppColors.black, size: AppSizes.iconSize,),
                SizedBox(width: AppSizes.horiSpacesBetweenElements),
                Text('Add Customer', style: TextStyle(
                      color: AppColors.black,
                      fontSize: AppSizes.fontSize2,
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
