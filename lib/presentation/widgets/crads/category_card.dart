import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String category;
  final String image;
  final int itemsNum;
  const CategoryCard({super.key, required this.category, required this.image, required this.itemsNum});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
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
      child: 
      Container(
       
        padding: EdgeInsets.symmetric(
          horizontal: context.responsivePadding(AppSizes.horizontalPadding / 4),
        ),
         decoration: CustomBoxDecoration.boxDecoration.copyWith(border: Border.all(color: currentColor, width: AppSizes.borderSize)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: context.responsiveRelativeSize(
                containerSize: context.screenHeight,
                percentage: AppSizes.widgetHeight,
              ),
              height: context.responsiveRelativeSize(
                containerSize: context.screenHeight,
                percentage: AppSizes.widgetHeight,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  context.responsiveBorderRadius(AppSizes.radius16),
                ),
                child: Image.asset(widget.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: context.responsiveSpacing(AppSizes.horiSpacesBetweenElements),),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.category,
                      style: TextStyle(
                        fontSize:14,
                        color: AppColors.black,
                        fontWeight: AppSizes.fontWeight1,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Contain ',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.darkGray,
                      ),
                    ),
                    Text(
                      widget.itemsNum.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.darkGray,
                      ),
                    ),
                    Text(
                      ' item',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.darkGray,
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
