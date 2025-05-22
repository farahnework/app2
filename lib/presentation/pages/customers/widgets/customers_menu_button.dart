import 'package:app/presentation/pages/add_customer/add_customer_page.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomersMenuButton extends StatefulWidget {
  final IconData icon;
  const CustomersMenuButton({super.key, required this.icon});

  @override
  State<CustomersMenuButton> createState() => _CustomersMenuButtonState();
}

class _CustomersMenuButtonState extends State<CustomersMenuButton> {
 Color currentColor = AppColors.white;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          currentColor = AppColors.lightPurple;
        });
      },
      onExit: (event) {
        setState(() {
          currentColor = AppColors.white;
        });
      },
      child: SizedBox(
        width: 40,
        height: 40,
        child: IconButton(
          onPressed: () {
            final RenderBox button = context.findRenderObject() as RenderBox;
            final Offset position = button.localToGlobal(Offset.zero);
            final RelativeRect menuPosition = RelativeRect.fromLTRB(
              position.dx,
              position.dy + button.size.height,
              position.dx + button.size.width,
              0,
            );

            showMenu(
              color: AppColors.white,
              context: context,
              position: menuPosition,
              items: [
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(IconsaxPlusLinear.eye, size: AppSizes.iconSize,),
                          SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                          Text("Show" , style: TextStyle(fontSize: AppSizes.fontSize2) ),
                        ],
                      ),
                    ],
                  ),
                ),

                 PopupMenuItem(
                 onTap: () {
                   Get.to(AddCustomerPage());
                 }, 
                  child: Row(
                    children: [
                      Icon(IconsaxPlusLinear.edit_2, size: AppSizes.iconSize,),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                      Text("Edit", style: TextStyle(fontSize: AppSizes.fontSize2)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(IconsaxPlusLinear.trash, size: AppSizes.iconSize,),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                      Text("Delete", style: TextStyle(fontSize: AppSizes.fontSize2)),
                    ],
                  ),
                ),
              ],
            );
          },
focusColor: currentColor,

          icon: Icon(widget.icon, color: AppColors.darkPurple,),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            fixedSize:Size( AppSizes.widgetHeight,  AppSizes.widgetHeight),
            iconColor: AppColors.white,
            backgroundColor: currentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSizes.textFieldRadius),
              ),
            ),
          ),
        ),
      ),
    );
  }
}