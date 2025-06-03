import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String image;
  final String categoryName;
  final int itemsNum;
  const CategoryCard({
    super.key,
    required this.image,
    required this.categoryName,
    required this.itemsNum,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
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
        height: AppSizes.widgetHeight *2,
        margin: EdgeInsets.only(right: AppSizes.horiSpacesBetweenElements),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 0.5),
              color: AppColors.lightPurple.withOpacity(0.05),
              spreadRadius: 1,
            ),
          ],
          color: currentColor,
          border: Border.all(color: AppColors.grey, width: 0.4),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.textFieldRadius),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSizes.widgetHeight *1.2,
              height: AppSizes.widgetHeight *1.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  context.responsiveBorderRadius(AppSizes.radius16),
                ),
                child: Image.asset(widget.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.categoryName,
                      style: TextStyle(
                        fontSize: context.responsiveFontSize(AppSizes.fontSize4),
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
                        fontSize: context.responsiveFontSize(
                          AppSizes.fontSize4,
                        ),
                        color: AppColors.darkGray,
                      ),
                    ),
                    Text(
                      widget.itemsNum.toString(),
                      style: TextStyle(
                        fontSize: context.responsiveFontSize(
                          AppSizes.fontSize4,
                        ),
                        color: AppColors.darkGray,
                      ),
                    ),
                    Text(
                      ' item',
                      style: TextStyle(
                        fontSize: context.responsiveFontSize(
                          AppSizes.fontSize4,
                        ),
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
