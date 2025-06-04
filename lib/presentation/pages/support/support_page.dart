import 'package:app/controllers/side_bar_controller.dart';
import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/support/widgets/support_app_bar.dart';
import 'package:app/presentation/widgets/bars/icon_side_bar.dart';
import 'package:app/presentation/widgets/bars/side_bar.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
void initState() {
  super.initState();
  Provider.of<SideBarController>(context, listen: false)
      .setScaffoldKey(scaffoldKey);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: context.isDesktop ? null : SideBar(),

      
      backgroundColor: AppColors.lightGrey,
      body: Row(
        children: [
          
          context.isDesktop?
          Expanded(flex:1 , child: SideBar()):
           context.isLargeTablet?
          IconSideBar():
           context.isSmallTablet?
          IconSideBar():
          Container(),


          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [SupportAppBar(), SupportBody()]),
          ),
        ],
      ),
    );
  }
}


class SupportBody extends StatelessWidget {
  const SupportBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalPadding,
            vertical: AppSizes.verticalPadding,
          ),
          child: CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('We are happy to assist you in enhancing your business management through our support team.', style: CustomTextStyles.titleText(context),),
              SizedBox(height: AppSizes.verSpacesBetweenContainers,),
              Center(child: Image.asset('lib/assets/images/support.png')),
              SizedBox(height: AppSizes.verSpacesBetweenContainers,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(IconsaxPlusLinear.mask_2, size: context.responsiveIconSize(AppSizes.iconSize), color: AppColors.darkPurple,),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts,),
                      Text('0583659392', style: CustomTextStyles.largeText(context),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(IconsaxPlusLinear.call, size: context.responsiveIconSize(AppSizes.iconSize), color: AppColors.darkPurple,),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts,),
                      Text('920012279', style: CustomTextStyles.largeText(context),),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(IconsaxPlusLinear.call, size: context.responsiveIconSize(AppSizes.iconSize), color: AppColors.darkPurple,),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts,),
                      Text('0557566573', style: CustomTextStyles.largeText(context),),
                    ],
                  ),
                   Row(
                    children: [
                      Icon(Icons.email_outlined, size: context.responsiveIconSize(AppSizes.iconSize), color: AppColors.darkPurple,),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts,),
                      Text('info@as-it.com.sa', style: CustomTextStyles.largeText(context),),
                    ],
                  ),
                ],
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}