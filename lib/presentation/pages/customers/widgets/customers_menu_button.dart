import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/add_customer/add_customer_page.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            IconsaxPlusLinear.eye,
                            size: context.responsiveIconSize(
                              AppSizes.iconSize2,
                            ),
                          ),
                          SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                          Text(
                            "Show",
                            style: CustomTextStyles.meduimText(context),
                          ),
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
                      Icon(
                        IconsaxPlusLinear.edit_2,
                        size: context.responsiveIconSize(AppSizes.iconSize2),
                      ),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                      Text("Edit", style: CustomTextStyles.meduimText(context)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        IconsaxPlusLinear.trash,
                        size: context.responsiveIconSize(AppSizes.iconSize2),
                      ),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                      Text(
                        "Delete",
                        style: CustomTextStyles.meduimText(context),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          focusColor: currentColor,

          icon: Icon(widget.icon, color: AppColors.darkPurple),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            fixedSize: Size(AppSizes.widgetHeight, AppSizes.widgetHeight),
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
