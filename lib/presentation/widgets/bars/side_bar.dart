import 'package:app/presentation/pages/customers/customers_page.dart';
import 'package:app/presentation/pages/products/products_page.dart';
import 'package:app/presentation/pages/sell/sell_page.dart';
import 'package:app/presentation/pages/signin_page.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightPurple2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.screenPadding,
        horizontal: AppSizes.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
                
          children: [
            Column(
              children: [
                SizedBox(
                  height: 45,
                  child: Image.asset('lib/assets/images/logo.png'),
                ),
                // Divider(color: AppColors.grey),
                SizedBox(height: AppSizes.verSpacesBetweenContainers*2,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomListTile(
                      icon: IconsaxPlusLinear.status,
                      text: 'Dashboard',
                      page: CustomersPage(),
                      to: true,
                    ),
                    CustomListTile(
                      icon: IconsaxPlusLinear.shop,
                      text: 'Start Selling',
                      page: SellPage(),
                      to: true,
                    ),
                    CustomListTile(
                      icon: IconsaxPlusLinear.user,
                      text: 'Customers',
                      page: CustomersPage(),
                      to: true,
                    ),
                    
                   
                  ],
                ),
              ],
            ),
            // Divider(color: AppColors.grey),
            // Column(
            //   children: [
            //     ListTile(
            //       leading: Icon(
            //         IconsaxPlusLinear.translate,
            //         size: AppSizes.iconSize,
            //       ),
            //       title: Text('Language', style: CustomTextStyles.body),
            //     ),
            //     ListTile(
            //       leading: Icon(
            //         IconsaxPlusLinear.moon,
            //         size: AppSizes.iconSize,
            //       ),
            //       title: Text('Dark Mode', style: CustomTextStyles.body),
            //       trailing: Switch(value: true, onChanged: (value) {}),
            //     ),
            //   ],
            // ),
            Column(
              children: [
                CustomListTile(
                  icon: IconsaxPlusLinear.info_circle,
                  text: 'Help',
                  page: SigninPage(),
                  to: false,
                ),
                CustomListTile(
                  icon: IconsaxPlusLinear.logout,
                  text: 'Log Out',
                  page: SigninPage(),
                  to: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatefulWidget {
  final IconData icon;
  final String text;
  final Widget page;
  final bool to;
  const CustomListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.page,
    required this.to,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.off(widget.page);
      },
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false;
          });
        },
        child: Container(
          margin: EdgeInsets.only(bottom: AppSizes.verSpacesBetweenElements),
          color: isHovered ? AppColors.white : AppColors.lightPurple2,
          child: ListTile(
            leading: Icon(
              widget.icon,
              size: AppSizes.iconSize,
              color: AppColors.darkGray,
            ),
            title: Text(widget.text, style: TextStyle(color: AppColors.darkGray, fontWeight: FontWeight.w900, fontSize: AppSizes.fontSize2)),
          ),
        ),
      ),
    );
  }
}
