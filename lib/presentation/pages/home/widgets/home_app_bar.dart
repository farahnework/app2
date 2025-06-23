import 'package:app/controllers/side_bar_controller.dart';
import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/widgets/fields/custom_search_field.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import 'package:easy_localization/easy_localization.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: AppColors.white,
      //   border: Border(
      //     bottom: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
      //   ),
      // ),
      decoration: CustomBoxDecoration.boxDecoration.copyWith(
        borderRadius: BorderRadius.circular(0),
        border: Border(
          bottom: BorderSide(width: AppSizes.borderSize, color: AppColors.grey),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding,
        vertical: AppSizes.verticalPadding / 2,
      ),

      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (context.isMobile)
                InkWell(
                  onTap: () {
                    final sidebarController = Provider.of<SideBarController>(
                      context,
                      listen: false,
                    );
                    sidebarController.toggleSidebar();
                  },
                  child: const Icon(Iconsax.menu),
                ),
                if (!context.isMobile)
              SizedBox(width: AppSizes.horiSpacesBetweenElements),
              if (!context.isMobile)
                Text(
                  StringTranslateExtension('dashboard').tr(),
                  style: TextStyle(
                    fontSize: context.responsiveFontSize(AppSizes.fontSize1),
                    fontWeight: AppSizes.fontWeight1,
                    color: AppColors.darkPurple,
                  ),
                ),
              SizedBox(width: context.responsiveSpacing(AppSizes.horiSpacesBetweentTexts)),

              CustomSearchField(text: StringTranslateExtension('search').tr(),),
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               InkWell(
                 onTap: () async {
                    final newLocale =
                        context.locale.languageCode == 'en'
                            ? const Locale('ar')
                            : const Locale('en');
                
                    await context.setLocale(
                      newLocale,
                    ); 
                    Get.updateLocale(newLocale); // Notifies GetX to rebuild
                  },
                child: Container(
                  height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
                  width: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
                  decoration: BoxDecoration(
                    color: AppColors.lightPurple,
                    borderRadius:BorderRadius.circular(context.responsiveBorderRadius(AppSizes.radius12),),
                  ),
                    child: Center(
                      child: Text(
                        context.locale.languageCode == 'en' ? 'ar' : 'en',
                        style: CustomTextStyles.buttonText(context).copyWith(color: AppColors.darkPurple, fontWeight: AppSizes.fontWeight1),
                      ),
                    ),
                ),
              ),
              SizedBox(width: AppSizes.horiSpacesBetweenElements),
              SizedBox(
                height: context.responsiveWidgetHeight,
                child: CircleAvatar(
                  child: Image.asset('assets/images/user.jpg'),
                ),
              ),
              if (!context.isMobile)
                SizedBox(width: AppSizes.horiSpacesBetweentTexts),
              if (!context.isMobile)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tareq Taha',
                      style: TextStyle(
                        fontSize: context.responsiveFontSize(
                          AppSizes.fontSize3,
                        ),
                        fontWeight: AppSizes.fontWeight1,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMEd('en').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: context.responsiveFontSize(
                          AppSizes.fontSize5,
                        ),
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
