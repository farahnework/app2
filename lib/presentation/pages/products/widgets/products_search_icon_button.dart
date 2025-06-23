import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class ProductsPageIconButton extends StatefulWidget {
  final IconData icon;
  const ProductsPageIconButton({super.key, required this.icon,});

  @override
  State<ProductsPageIconButton> createState() => _ProductsPageIconButtonState();
}

class _ProductsPageIconButtonState extends State<ProductsPageIconButton> {
  var currentColor = AppColors.lightGrey;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          currentColor= AppColors.lightPurple;
        });
      },
      onExit: (event) {
        setState(() {
          currentColor= AppColors.lightPurple;
        });
      },
      child: SizedBox(
        width: AppSizes.widgetHeight,
        height: AppSizes.widgetHeight,
        child: IconButton(
            onPressed: (){
              // Get.off();
            },
            icon: Icon(widget.icon, color: AppColors.darkPurple, size: 30,),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            fixedSize: Size(40, 40),
            iconColor: AppColors.white,
            backgroundColor: currentColor,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSizes.textFieldRadius)))
          )
        ),
      ),
    );
  }
}
