import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/sell/widgets/product_info_dialog.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:iconsax/iconsax.dart';
import '../../../shared/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class ProductCard extends StatefulWidget {
  final String image;
  final String productName;
  final double price;
  const ProductCard({
    super.key,
    required this.image,
    required this.productName, required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  var currentColor = AppColors.grey;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          currentColor = AppColors.darkPurple;
        });
      },
      onExit: (event) {
        setState(() {
          currentColor = AppColors.grey;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: CustomBoxDecoration.boxDecoration.copyWith(border: Border.all(color: currentColor, width: AppSizes.borderSize)),
    
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: context.width,
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
                    productInfoDialog(context);
                  },
                  child: CircleAvatar(
    
                    child: Icon(Iconsax.info_circle, size: context.responsiveIconSize(AppSizes.iconSize),),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(StringTranslateExtension('price').tr(),style: CustomTextStyles.smallText(context)),
                Text(':', style: CustomTextStyles.smallText(context)),
                SizedBox(width: AppSizes.horiSpacesBetweentTexts,),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImages.rial, width:  context.responsiveFontSize(AppSizes.fontSize6,), color: AppColors.darkPurple,),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts,),
                      Text(
                        widget.price.toString(),
                        style: CustomTextStyles.smallText(context).copyWith(color: AppColors.darkPurple, fontWeight: AppSizes.fontWeight1)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
