import 'package:app/shared/utils/app_images.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../../shared/utils/app_colors.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String productName;
  const ProductCard({super.key, required this.image, required this.productName});

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
        margin: EdgeInsets.only(right: AppSizes.horiSpacesBetweenElements),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: CustomBoxDecoration.boxDecoration,

        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Stack(
            children: [
               SizedBox(
              width: MediaQuery.of(context).size.width,
            height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
                child: Image.asset(widget.image, fit: BoxFit.cover,))),
              CircleAvatar(child: Icon(Iconsax.info_circle), 
              backgroundColor: Colors.amberAccent,
              ),

        ]),
          
            SizedBox(height: AppSizes.verSpacesBetweenElements),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(widget.productName, style: CustomTextStyles.header2)],
            ),
            // SizedBox(height: AppSizes.verSpacesBetweenElements),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Price: "),
                Row(
                  children: [
                    SizedBox(
                    height: AppSizes.fontSize2,
                    width: AppSizes.fontSize2,
                    child: SvgPicture.asset(AppImages.rial)),
                    Text(
                      '2555',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: AppSizes.fontSize2,
                      ),
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
