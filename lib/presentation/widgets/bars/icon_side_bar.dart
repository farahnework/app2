import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/customers/customers_page.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/kitchen_display/kichen_display_page.dart';
import 'package:app/presentation/pages/restaurant_orders.dart/restaurant_orders_page.dart';
import 'package:app/presentation/pages/sell/sell_page.dart';
import 'package:app/presentation/pages/signin_page.dart';
import 'package:app/presentation/pages/support/support_page.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class IconSideBar extends StatefulWidget {
  const IconSideBar({super.key});

  @override
  State<IconSideBar> createState() => _IconSideBarState();
}

class _IconSideBarState extends State<IconSideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.darkPurple,

        border: Border(
          right: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.verticalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Column(
              children: [
                SizedBox(
                  width: 35,
                  child: Image.asset('lib/assets/images/logo_icon.png', fit: BoxFit.cover,),
                ),
                SizedBox(height: AppSizes.verSpacesBetweenContainers * 2),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: CustomListTile(
                        icon: IconsaxPlusLinear.status,
                      
                        page: HomePage(),
                        to: false,
                        selected: true,
                      ),
                    ),
                    CustomListTile(
                      icon: IconsaxPlusLinear.shop,
                      
                      page: SellPage(),
                      to: true,
                      selected: false,
                    ),
                    CustomListTile(
                      icon: IconsaxPlusLinear.keyboard_open,
                      page: RestaurantOrdersPage(),
                      to: true,
                      selected: false,
                    ),
                    CustomListTile(
                       icon: IconsaxPlusLinear.receipt_2_1,
                      page: KitchenDisplayPage(),
                      to: true,
                      selected: false,
                    ),
                    CustomListTile(
                      icon: IconsaxPlusLinear.user,
                      page: CustomersPage(),
                      to: true,
                      selected: false,
                    ),
                  ],
                ),
              ],
            ),
          
            Column(
              children: [
                CustomListTile(
                  icon: IconsaxPlusLinear.headphone,
             
                  page: SupportPage(),
                  to: true,
                  selected: false,
                ),
                CustomListTile(
                  icon: IconsaxPlusLinear.logout,
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
  final Widget page;
  final bool to;
  final bool selected;

  const CustomListTile({
    super.key,
    required this.icon,
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
                  margin: EdgeInsets.symmetric(
                    horizontal: AppSizes.horiSpacesBetweenElements,
                    vertical: AppSizes.verSpacesBetweenElements*1.5,),

                 
                  child:  Icon(
                      widget.icon,
                      size: context.responsiveIconSize(AppSizes.iconSize2),
                      color: AppColors.white,
                    ),
                   
                )
                : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppSizes.horiSpacesBetweenElements,
                    vertical: AppSizes.verSpacesBetweenElements*1.5,),
                  child: 
                   Icon(
                      widget.icon,
                      size: context.responsiveIconSize(AppSizes.iconSize2),
                      color: AppColors.grey,
                    ),
                ),
      ),
    );
  }
}
