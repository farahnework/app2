import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppSizes.widgetHeight,
      height: 1,
      margin: EdgeInsets.only(right: AppSizes.horiSpacesBetweenElements),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: CustomBoxDecoration.boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
              child: Image.asset(widget.image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: AppSizes.horiSpacesBetweenElements),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.categoryName, style: CustomTextStyles.header2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contains ',
                    style: TextStyle(
                      fontSize: AppSizes.fontSize3,
                      color: AppColors.darkGray,
                    ),
                  ),
                  Text(
                    widget.itemsNum.toString(),
                    style: TextStyle(
                      fontSize: AppSizes.fontSize3,
                      color: AppColors.darkGray,
                    ),
                  ),
                  Text(
                    ' Items',
                    style: TextStyle(
                      fontSize: AppSizes.fontSize3,
                      color: AppColors.darkGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
