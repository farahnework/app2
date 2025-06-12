import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/sell/widgets/sell_drop_down_button.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    String _selectedOption = 'Individual';
    

    showDialog(
      barrierColor: Colors.black.withOpacity(0.3),
      context: context,
      
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
           
            return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: AppColors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              color: AppColors.white,
              width: context.screenWidth / (context.isMobile ? 1 : 1.5),
              height: context.screenHeight / 1.3,
              child: Column(
                children: [
                  Container(
                    color: AppColors.lightPurple,
                    padding:  EdgeInsets.symmetric(
                        horizontal: AppSizes.horizontalPadding,
                        // vertical: AppSizes.verticalPadding/3,
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                color: AppColors.darkPurple,
                                IconsaxPlusLinear.close_circle,
                                size: context.responsiveIconSize(
                                  AppSizes.iconSize,
                                  
                                ),
                              ),
                            ),
                            SizedBox(width: AppSizes.horiSpacesBetweenElements),
                            Text(
                              "Add Customer",
                              style: CustomTextStyles.titleText(context).copyWith(color: AppColors.darkPurple,),
                              
                            ),
                          ],
                        ),
                              
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconsaxPlusLinear.save_2,
                            size: context.responsiveIconSize(
                              AppSizes.iconSize2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        left: AppSizes.horizontalPadding,
                        right: AppSizes.horizontalPadding,
                        bottom: AppSizes.verticalPadding / 2,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: AppSizes.verSpacesBetweenContainers),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
          
                            children: [
                              Text(
                                "Customer Informaion",
                                style: CustomTextStyles.titleText(context),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSizes.verSpacesBetweenContainers,),

                        SizedBox(
                          width: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: 20),
                          height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: 20),
                          child: CircleAvatar(child: Icon(IconsaxPlusLinear.user),)),
                          SizedBox(height: AppSizes.verSpacesBetweenContainers,),
                          Row(
                            children: [
                              Radio(
                                value: 'Individual',
                                groupValue: _selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOption = value.toString();
                                  });
                                },
                              ),
                              Text('Individual', style: CustomTextStyles.meduimText(context),),
                                        
                              Radio(
                                value: 'Company',
                                groupValue: _selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOption = value.toString();
                                  });
                                },
                              ),
                              Text('Company', style: CustomTextStyles.meduimText(context),),
                            ],
                          ),
                          SizedBox(height: AppSizes.verSpacesBetweenContainers),
          
                          _selectedOption == 'Individual'
                              ? _buildIndividual()
                              : _buildCompany(),
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
      },
    );
  }

  Widget _buildIndividual() {
    return 
    context.isMobile?
    Column(
      children: [
        Row(
          children: [
            CustomTextField(
              hintText: 'Name',
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        Row(
          children: [
            CustomTextField(
              hintText: 'Name in English',
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        Row(
          children: [
            CustomTextField(
              hintText: 'Phone No.',
              icon: IconsaxPlusLinear.call,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        
        Row(
          children: [
            CustomTextField(
              hintText: 'Address',
              icon: IconsaxPlusLinear.location,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),

        Row(
          children: [
            CustomTextField(
              hintText: 'Street',
              icon: IconsaxPlusLinear.location,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        
        Row(
          children: [
            CustomTextField(
              hintText: 'Country',
              icon: IconsaxPlusLinear.map,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),

        Row(
          children: [
            CustomTextField(
              hintText: 'City',
              icon: IconsaxPlusLinear.building,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        
        Row(
          children: [
            CustomTextField(
              hintText: 'Neighborhood',
              icon: IconsaxPlusLinear.global,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),

       
      ],
    ):Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              hintText: 'Name',
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),
            CustomTextField(
              hintText: 'Name in English',
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
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
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: 'Address',
              icon: IconsaxPlusLinear.location,
              width: context.screenWidth / 3.8,
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
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: 'Country',
              icon: IconsaxPlusLinear.map,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenContainers),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              hintText: 'City',
              icon: IconsaxPlusLinear.building,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: 'Neighborhood',
              icon: IconsaxPlusLinear.global,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenContainers),

       
      ],
    );
  }

  Widget _buildCompany() {
    return 
    context.isMobile?
    Column(
      children: [
        Row(
          children: [
            CustomTextField(
              hintText: 'Name',
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        Row(
          children: [
            CustomTextField(
              hintText: 'Name in English',
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        Row(
          children: [
            Expanded(
              child: SellDropDownButton(
                title: 'Customer Group',
                list: ['Group 1', 'Group 2', 'Group 3'],
                selected: 'Group 1',
                width: context.screenWidth / 3.8,
                height: AppSizes.widgetHeight,
                icon: IconsaxPlusLinear.user_tag,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        
        Row(
          children: [
            CustomTextField(
              hintText: 'Address',
              icon: IconsaxPlusLinear.location,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),

        Row(
          children: [
            CustomTextField(
              hintText: 'Street',
              icon: IconsaxPlusLinear.location,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        
        Row(
          children: [
            CustomTextField(
              hintText: 'City',
              icon: IconsaxPlusLinear.map,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),

        Row(
          children: [
            CustomTextField(
              hintText: 'Neighborhood',
              icon: IconsaxPlusLinear.building,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
       SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        
        Row(
          children: [
            CustomTextField(
              hintText: 'Country',
              icon: IconsaxPlusLinear.global,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),

        Row(
          children: [
            CustomTextField(
              hintText: 'Phone No.',
              icon: IconsaxPlusLinear.call,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
       SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        
        Row(
          children: [
            CustomTextField(
              hintText: 'Email Address',
              icon: IconsaxPlusLinear.sms,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
       SizedBox(height: AppSizes.verSpacesBetweenElements*2),

        Row(
          children: [
            CustomTextField(
              hintText: 'Build No.',
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        
        Row(
          children: [
            CustomTextField(
              hintText: 'Tax No.',
              icon: IconsaxPlusLinear.bank,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),

        Row(
          children: [
            CustomTextField(
              hintText: 'Postal Code',
              icon: IconsaxPlusLinear.document,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        
        Row(
          children: [
            CustomTextField(
              hintText: 'Company Commercial Record No.',
              icon: IconsaxPlusLinear.archive_1,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),

        Row(
          children: [
            CustomTextField(
              hintText: 'Additional No.',
              icon: IconsaxPlusLinear.hashtag_1,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        Row(
          children: [
            Expanded(
              child: SellDropDownButton(
                title: "Payment Method",
                list: ['Cash', 'Debt'],
                selected: "Cash",
                width: context.screenWidth / 3.8,
                height: AppSizes.widgetHeight,
                icon: Icons.add_ic_call,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),

        Row(
          children: [
            CustomTextField(
              hintText: 'Credit Limt',
              icon: IconsaxPlusLinear.card,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
       SizedBox(height: AppSizes.verSpacesBetweenElements*2),
        
        Row(
          children: [
            CustomTextField(
              hintText: 'Note',
              icon: IconsaxPlusLinear.note_2,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenElements*2),
      ],
    ):Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              hintText: 'Name',
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),
            CustomTextField(
              hintText: 'Name in English',
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenContainers),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SellDropDownButton(
                title: 'Customer Group',
                list: ['Group 1', 'Group 2', 'Group 3'],
                selected: 'Group 1',
                width: context.screenWidth / 3.8,
                height: AppSizes.widgetHeight,
                icon: IconsaxPlusLinear.user_tag,
                color: AppColors.white,
              ),
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: 'Address',
              icon: IconsaxPlusLinear.location,
              width: context.screenWidth / 3.8,
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
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: 'City',
              icon: IconsaxPlusLinear.map,
              width: context.screenWidth / 3.8,
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
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: 'Country',
              icon: IconsaxPlusLinear.global,
              width: context.screenWidth / 3.8,
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
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: 'Email Address',
              icon: IconsaxPlusLinear.sms,
              width: context.screenWidth / 3.8,
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
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: 'Tax No.',
              icon: IconsaxPlusLinear.bank,
              width: context.screenWidth / 3.8,
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
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: 'Company Commercial Record No.',
              icon: IconsaxPlusLinear.archive_1,
              width: context.screenWidth / 3.8,
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
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),
            Expanded(
              child: SellDropDownButton(
                title: "Payment Method",
                list: ['Cash', 'Debt'],
                selected: "Cash",
                width: context.screenWidth / 3.8,
                height: AppSizes.widgetHeight,
                icon: Icons.add_ic_call,
                color: AppColors.white,
              ),
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
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: 'Note',
              icon: IconsaxPlusLinear.note_2,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
          ],
        ),
        SizedBox(height: AppSizes.verSpacesBetweenContainers),
      ],
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
        width: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
        height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
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
