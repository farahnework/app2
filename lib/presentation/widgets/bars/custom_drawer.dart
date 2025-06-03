import 'package:app/presentation/pages/customers/customers_page.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/sell/sell_page.dart';
import 'package:app/presentation/pages/signin_page.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomDrawer extends StatefulWidget {

  const CustomDrawer({super.key,});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: Container(
         height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppColors.lightPurple2,
          border: Border(
            right: BorderSide(
              color: AppColors.grey,
              width: AppSizes.borderSize,
            ),
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
           horizontal:  AppSizes.horiScreenPadding /2,
           vertical: AppSizes.textFieldRadius /2),
          child: Column(
            mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: AppSizes.verSpacesBetweenElements,),
                  SizedBox(
                    height: 45,
                    child: Image.asset('lib/assets/images/logo.png'),
                  ),
                  SizedBox(height: AppSizes.verSpacesBetweenElements*5,),

                  Column(
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text('data'),
                      CustomListTile(
                        icon: IconsaxPlusLinear.status,
                        text: 'DashBoard',
                        page: HomePage(),
                        to: true,
                        selected: true,
                      ),
                      CustomListTile(
                        icon: IconsaxPlusLinear.shop,
                        text: 'Start Selling',
                        page: SellPage(),
                        to: true,
                        selected: false,
                            
                      ),
                      CustomListTile(
                        icon: IconsaxPlusLinear.user,
                        text: 'Customers',
                        page: CustomersPage(),
                        to: true,
                        selected: false,
                            
                      ),
                      // CustomListTile(
                      //   icon: IconsaxPlusLinear.receipt_1,
                      //   text: 'Invoices',
                      //   page: CustomersPage(),
                      //   to: true,
                      // ),
                      // CustomListTile(
                      //   icon: IconsaxPlusLinear.box,
                      //   text: 'Products',
                      //   page: ProductsPage(),
                      //   to: true,
                      // ),
                      // CustomListTile(
                      //   icon: Icons.computer_rounded,
                      //   text: 'Registers',
                      //   page: CustomersPage(),
                      //   to: true,
                      // ),
                    ],
                  ),
                ],
              ),
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
              // Divider(color: AppColors.grey),
              Column(
                children: [
                  CustomListTile(
                    icon: IconsaxPlusLinear.info_circle,
                    text: 'Help',
                    page: SigninPage(),
                    to: false,
                    selected: false,
                  ),
                  CustomListTile(
                    icon: IconsaxPlusLinear.logout,
                    text: 'Log Out',
                    page: SigninPage(),
                    to: false,
                    selected: false,
                  ),
                ],
              ),
            ],
          ),
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
    required this.to, required this.selected,
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
        Get.off(widget.page.toString());
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
          decoration: widget.selected? BoxDecoration(
            color: AppColors.darkPurple,
            borderRadius: BorderRadius.circular(AppSizes.textFieldRadius)
          ):BoxDecoration(),
          child: ListTile(
            leading: widget.selected? Icon(
              widget.icon,
              size: AppSizes.iconSize,
              color: AppColors.white,
            ) : Icon(
              widget.icon,
              size: AppSizes.iconSize,
              color: AppColors.darkGray,
            ),
            title: Text(
              widget.text,
              style: widget.selected? TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w900,
                fontSize: AppSizes.fontSize2,
              ):TextStyle(
                color: AppColors.darkGray,
                fontWeight: FontWeight.w900,
                fontSize: AppSizes.fontSize2,
              ),
            ),
          ),
        ),
      ),
    );
  }


}

class CustomSideBarItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String page;
  const CustomSideBarItem({super.key, required this.icon, required this.name, required this.page,});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
           InkWell(
            // onTap: () => controller.menuOnTap(page),
            onTap: () {
              Get.off(page);
            },
            child: Padding(
              padding:  EdgeInsets.only(bottom: AppSizes.verSpacesBetweenElements),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.darkPurple,
                  borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(
                        left: AppSizes.horiSpacesBetweenElements *2,
                        right: AppSizes.horiSpacesBetweenElements,
                        top: AppSizes.horiSpacesBetweenElements,
                        bottom: AppSizes.horiSpacesBetweenElements,
                        ),
                      child: Icon(icon, color: AppColors.lightGrey,),
                    ),
                    Text(name, style: TextStyle(
                      fontSize: AppSizes.fontSize2,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white
                    ),)
                  ],
                ),
              ),
            ),
          ),
        
      ],
    );
  }
}
