import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/restaurant_orders.dart/widgets/add_extras_dialog.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../../shared/utils/app_colors.dart';

class FoodCard extends StatefulWidget {
  final String image;
  final String productName;
  final double price;
  const FoodCard({
    super.key,
    required this.image,
    required this.productName,
    required this.price,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  Color currentColor = AppColors.white;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          currentColor = AppColors.lightYellow.withOpacity(0.3);
        });
      },
      onExit: (event) {
        setState(() {
          currentColor = AppColors.white;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 0.5),
              color: AppColors.darkPurple.withOpacity(0.05),
              spreadRadius: 1,
            ),
          ],
          color: currentColor,
          border: Border.all(color: AppColors.grey, width: 0.4),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.textFieldRadius),
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppSizes.textFieldRadius,
                    ),
                    child: Image.asset(widget.image, fit: BoxFit.cover),
                  ),
                ),
                InkWell(
                  onTap: () {
                    addExtrasDialog(context, 'lib/assets/images/food5.jpg');
                  },
                  child: CircleAvatar(
                    child: Icon(Iconsax.add, size: AppSizes.iconSize2),
                    backgroundColor: AppColors.yellow,
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSizes.verSpacesBetweenElements),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.productName, style: CustomTextStyles.meduimText(context)),
              ],
            ),
            // SizedBox(height: AppSizes.verSpacesBetweenElements),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Price: ", style: CustomTextStyles.meduimText(context),),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.rial, width: context.responsiveFontSize(AppSizes.fontSize6)),
                    SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                    Text(
                      widget.price.toString(),
                      style: CustomTextStyles.meduimText(context)
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
