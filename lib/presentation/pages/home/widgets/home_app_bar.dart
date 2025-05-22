import 'package:app/presentation/widgets/fields/custom_search_field.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.grey, width: AppSizes.borderSize)),
      ),
      padding: EdgeInsets.symmetric(
          horizontal:  AppSizes.screenPadding,
          vertical: AppSizes.screenPadding/3),

      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CustomMenuButton(icon: Icons.settings),
              Container(
                   height: AppSizes.iconButtonSize,
                  width: AppSizes.iconButtonSize,
                decoration: BoxDecoration(
                  color: AppColors.lightPurple,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSizes.textFieldRadius),
                  ),
                ),
                child: Center(child: Text('T', style: CustomTextStyles.header1)),
              ),
              SizedBox(width: AppSizes.horiSpacesBetweentTexts),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tareq Taha', style: CustomTextStyles.header2),
                  Text(
                    '${DateFormat('yyyy/mm/dd hh:mm').format(DateTime.now())}',
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              // CustomIconButton(icon: Icons.notifications, page: SellPage(),),
              SizedBox(width: AppSizes.horiSpacesBetweenElements),
              CustomSearchField(text: 'Search',),
            ],
          ),
        ],
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
