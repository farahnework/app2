import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/buttons/custom_outlined_button.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CloseSessionButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final double size;

  const CloseSessionButton({super.key, required this.icon, required this.color, required this.iconColor, required this.size});

  @override
  State<CloseSessionButton> createState() => _CloseSessionButtonState();
}

class _CloseSessionButtonState extends State<CloseSessionButton> {
  void customDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.responsiveBorderRadius(AppSizes.radius16))),
        backgroundColor: AppColors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          color: AppColors.white,
          width: context.width * 0.5,
          height: context.height *0.5,
          padding: EdgeInsets.symmetric(
           horizontal:  AppSizes.horizontalPadding,
           vertical: AppSizes.verticalPadding/2,
           ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(IconsaxPlusLinear.close_circle)),
                ],
              ),
            Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Do you want to close this session?', style: TextStyle(fontSize: context.responsiveFontSize(AppSizes.fontSize1), fontWeight: AppSizes.fontWeight1)),
                  SizedBox(height: AppSizes.verSpacesBetweenContainers), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(text: 'Close this session', radius: true, width: 200, page: HomePage(), height: AppSizes.widgetHeight, color: AppColors.darkPurple, textColor: AppColors.white,),
                      SizedBox(width: AppSizes.horiSpacesBetweenElements,),
                      CustomOutlinedButton(text: 'Session pause', page: HomePage(),)
                    ],
                  ),
                ],
              ),
            Spacer(),

               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(IconsaxPlusLinear.close_circle, color: AppColors.white,)),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
  var currentColor = AppColors.grey;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // onEnter: (event) {
      //   setState(() {
      //     currentColor= AppColors.lightPurple;
      //   });
      // },
      // onExit: (event) {
      //   setState(() {
      //     currentColor= AppColors.lightGrey;
      //   });
      // },
      child: Container(
        width: widget.size,
        height: widget.size,
        child: IconButton(
            onPressed: (){
              customDialog(context);
            },
            icon: Icon(widget.icon, color: widget.iconColor, size: context.responsiveIconSize(AppSizes.iconSize2),),
  
          style: ElevatedButton.styleFrom(
            
            padding: EdgeInsets.zero,
            fixedSize: Size(40, 40),
            backgroundColor: widget.color,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)))
          )
        ),
      ),
    );
  }
}
