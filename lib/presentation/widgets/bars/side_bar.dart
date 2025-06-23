import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/customers/customers_page.dart';
import 'package:app/presentation/pages/kitchen_display/kichen_display_page.dart';
import 'package:app/presentation/pages/restaurant_orders.dart/restaurant_orders_page.dart';
import 'package:app/presentation/pages/sell/sell_page.dart';
import 'package:app/presentation/pages/signin_page.dart';
import 'package:app/presentation/pages/support/support_page.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:easy_localization/easy_localization.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: AppColors.white,

        border: Border(
          right: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.verticalPadding,
          horizontal: AppSizes.horizontalPadding /2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Column(
              children: [
                SizedBox(
                  height: 45,
                  child: Image.asset('assets/images/logo.png'),
                ),
                // Divider(color: AppColors.grey),
                SizedBox(height: AppSizes.verSpacesBetweenContainers * 2),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomListTile(
                      icon: IconsaxPlusLinear.status,
                      text: StringTranslateExtension('dashboard').tr(),
                      page: CustomersPage(),
                      to: false,
                      selected: true,
                    ),
                    CustomListTile(
                      icon: IconsaxPlusLinear.shop,
                      text: StringTranslateExtension('start_selling').tr(),
                      page: SellPage(),
                      to: true,
                      selected: false,
                    ),
                    CustomListTile(
                       icon: IconsaxPlusLinear.keyboard_open,
                      text: StringTranslateExtension('restaurant_orders').tr(),
                      page: RestaurantOrdersPage(),
                      to: true,
                      selected: false,
                    ),
                    CustomListTile(
                      icon: IconsaxPlusLinear.receipt_2_1,
                      text: StringTranslateExtension('kitchen_display').tr(),
                      page: KitchenDisplayPage(),
                      to: true,
                      selected: false,
                    ),
                    CustomListTile(
                      icon: IconsaxPlusLinear.user,
                      text: StringTranslateExtension('customers').tr(),
                      page: CustomersPage(),
                      to: true,
                      selected: false,
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
                  icon: IconsaxPlusLinear.headphone,
                  text: StringTranslateExtension('support').tr(),
                  page: SupportPage(),
                  to: true,
                  selected: false,
                ),
                CustomListTile(
                  icon: IconsaxPlusLinear.logout,
                  text: StringTranslateExtension('logout').tr(),
                  page: SigninPage(),
                  to: true,
                  selected: false,
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
  final bool selected;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.page,
    required this.to,
    required this.selected,
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
        widget.to?
        Get.to(widget.page):
        '';
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
        child:
            widget.selected
                ? Container(
                  margin: EdgeInsets.only(
                    bottom: AppSizes.verSpacesBetweenElements,
                  ),

                  decoration: BoxDecoration(
                    color: AppColors.darkPurple,
                    borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
                    ),
                  child: ListTile(
                    leading: Icon(
                      widget.icon,
                      size: context.responsiveIconSize(AppSizes.iconSize2),
                      color: AppColors.white,
                    ),
                    title: Text(
                      widget.text,
                      style: TextStyle(
                        letterSpacing: 1.1,
                        color: AppColors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: context.responsiveFontSize(AppSizes.fontSize4),
                      ),
                    ),
                  ),
                )
                : Container(
                  margin: EdgeInsets.only(
                    bottom: AppSizes.verSpacesBetweenElements,
                  ),
                  color: isHovered ? AppColors.lightPurple : AppColors.white,
                  child: ListTile(
                    leading: Icon(
                      widget.icon,
                      size: context.responsiveIconSize(AppSizes.iconSize2),
                      color: AppColors.darkGray,
                    ),
                    title: Text(
                      widget.text,
                      style: TextStyle(
                        color: AppColors.darkGray,
                        fontWeight: FontWeight.w500,
                        fontSize: context.responsiveFontSize(AppSizes.fontSize4),
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}
