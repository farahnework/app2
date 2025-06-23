import 'package:app/presentation/pages/customers/widgets/customers_menu_button.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final int stock;
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.stock,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
      child: Container(
        decoration: BoxDecoration(
          color: currentColor,
          border: Border(
            bottom: BorderSide(
              color: AppColors.grey,
              width: AppSizes.borderSize,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          // horizontal: AppSizes.screenPadding,
          vertical: 10,
        ),
        margin: EdgeInsets.only(bottom: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppSizes.widgetHeight,
                  height: AppSizes.widgetHeight,
                  child: Image.asset(widget.image),
                ),
                SizedBox(width: AppSizes.horiSpacesBetweenElements),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.name, style: CustomTextStyles.header2),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImages.rial,
                              height: 15,
                              width: 15,
                            ),
                            SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                            Text(
                              widget.price,
                              style: TextStyle(
                                fontSize: AppSizes.fontSize2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: AppSizes.horiSpacesBetweenElements*4,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              IconsaxPlusLinear.box,
                              size: AppSizes.iconSize,
                            ),
                            SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                            Text(
                             ' ${widget.stock}',
                              style: TextStyle(
                                fontSize: AppSizes.fontSize2,
                                fontWeight: FontWeight.bold,
                                color: widget.stock < 5  ? AppColors.red : AppColors.lightGreen
                              ),
                            ),
                            SizedBox(width: AppSizes.horiSpacesBetweentTexts,),
                             Text(
                             'Available',
                              style: TextStyle(
                                fontSize: AppSizes.fontSize3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            CustomersMenuButton(icon: Icons.more_vert_outlined),
          ],
        ),
      ),
    );
  }
}
