import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/presentation/pages/customers/widgets/customers_menu_button.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatefulWidget {
  final String name;
  final String country;
  final String city;
  const CustomerCard({
    super.key,
    required this.name,
    required this.country,
    required this.city,
  });

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  Color currentColor = AppColors.white;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          currentColor = AppColors.lightPurple;
        });
      },
      onExit: (event) {
        setState(() {
          currentColor = AppColors.white;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: currentColor,
          border: Border(
            bottom: BorderSide(
              color: AppColors.grey,
              width: AppSizes.borderSize,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding,
          vertical: 10,
        ),
        margin: EdgeInsets.only(bottom: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.name, style: CustomTextStyles.largeText(context)),
                Row(children: [Text('${widget.city}, ', style: CustomTextStyles.meduimText(context), ), Text(widget.country, style: CustomTextStyles.meduimText(context),)]),
              ],
            ),
            CustomersMenuButton(icon: Icons.more_vert_outlined),
          ],
        ),
      ),
    );
  }
}
