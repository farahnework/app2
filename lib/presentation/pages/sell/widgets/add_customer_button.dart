import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AddCustomerButton extends StatefulWidget {
  final Color color;
  final Color iconColor;
  final double size;

  const AddCustomerButton({
    super.key,
    required this.color,
    required this.iconColor,
    required this.size,
  });

  @override
  State<AddCustomerButton> createState() => _AddCustomerButtonState();
}

class _AddCustomerButtonState extends State<AddCustomerButton> {
  void customDialog(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    showDialog(barrierColor: Colors.black.withOpacity(0.3),
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
        
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: AppColors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            color: AppColors.white,
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.4,

            child: Column(
              children: [
                Container(
                  height: AppSizes.widgetHeight,
                  width: width,
                  color: AppColors.lightPurple,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                      children: [Row(
                        children: [
                          Icon(IconsaxPlusLinear.close_circle),
                          SizedBox(width: AppSizes.horiSpacesBetweenElements,),
                                  Text("Add Customer", style: CustomTextStyles.header2,),
                        ],
                      ),

                              IconButton(onPressed:(){}, icon: Icon(IconsaxPlusLinear.save_2))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: AppSizes.screenPadding,
                      right: AppSizes.screenPadding,
                      bottom: AppSizes.screenPadding / 2,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Text("Customer Informaion", style: CustomTextStyles.header2,),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(child: Icon(IconsaxPlusLinear.user), )),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              hintText: 'Name',
                              icon: IconsaxPlusLinear.user,
                              width: width / 3.8,
                              enabled: true,
                            ),
                            CustomTextField(
                              hintText: 'Name in English',
                              icon: IconsaxPlusLinear.user,
                              width: width / 3.8,
                              enabled: true,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomDropDownButton(
                              title: 'Customer Group',
                              list: ['Group 1', 'Group 2', 'Group 3'],
                              selected: 'Group 1',
                              width: width / 3.8,
                              height: AppSizes.widgetHeight,
                              icon: IconsaxPlusLinear.user_tag,
                            ),
                            CustomTextField(
                              hintText: 'Address',
                              icon: IconsaxPlusLinear.location,
                              width: width / 3.8,
                              enabled: true,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              hintText: 'Street',
                              icon: IconsaxPlusLinear.location,
                              width: width / 3.8,
                              enabled: true,
                            ),
                            CustomTextField(
                              hintText: 'City',
                              icon: IconsaxPlusLinear.map,
                              width: width / 3.8,
                              enabled: true,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              hintText: 'Neighborhood',
                              icon: IconsaxPlusLinear.building,
                              width: width / 3.8,
                              enabled: true,
                            ),
                            CustomTextField(
                              hintText: 'Country',
                              icon: IconsaxPlusLinear.global,
                              width: width / 3.8,
                              enabled: true,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              hintText: 'Phone No.',
                              icon: IconsaxPlusLinear.call,
                              width: width / 3.8,
                              enabled: true,
                            ),
                            CustomTextField(
                              hintText: 'Email Address',
                              icon: IconsaxPlusLinear.sms,
                              width: width / 3.8,
                              enabled: true,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              hintText: 'Build No.',
                              icon: IconsaxPlusLinear.user,
                              width: width / 3.8,
                              enabled: true,
                            ),
                            CustomTextField(
                              hintText: 'Tax No.',
                              icon: IconsaxPlusLinear.bank,
                              width: width / 3.8,
                              enabled: true,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              hintText: 'Postal Code',
                              icon: IconsaxPlusLinear.document,
                              width: width / 3.8,
                              enabled: true,
                            ),
                            CustomTextField(
                              hintText: 'Company Commercial Record No.',
                              icon: IconsaxPlusLinear.archive_1,
                              width: width / 3.8,
                              enabled: true,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              hintText: 'Additional No.',
                              icon: IconsaxPlusLinear.hashtag_1,
                              width: width / 3.8,
                              enabled: true,
                            ),
                            CustomDropDownButton(
                              title: "Payment Method",
                              list: ['Cash', 'Debt'],
                              selected: "Cash",
                              width: width / 3.8,
                              height: AppSizes.widgetHeight,
                              icon: Icons.add_ic_call,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              hintText: 'Credit Limt',
                              icon: IconsaxPlusLinear.card,
                              width: width / 3.8,
                              enabled: true,
                            ),
                            CustomTextField(
                              hintText: 'Note',
                              icon: IconsaxPlusLinear.note_2,
                              width: width / 3.8,
                              enabled: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
          onPressed: () {
            customDialog(context);
          },
          icon: Icon(
            IconsaxPlusLinear.user_add,
            color: widget.iconColor,
            size: AppSizes.iconSize2,
          ),

          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            fixedSize: Size(40, 40),
            backgroundColor: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSizes.textFieldRadius),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
