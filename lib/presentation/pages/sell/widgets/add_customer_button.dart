import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/sell/widgets/sell_drop_down_button.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:easy_localization/easy_localization.dart';

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
    String selectedOption = 'Individual';
    

    showDialog(
      barrierColor: Colors.black.withValues(alpha:  0.3),
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
                              StringTranslateExtension('add_customer').tr(),
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
                                StringTranslateExtension('customer_information').tr(),
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
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value.toString();
                                  });
                                },
                              ),
                              Text( StringTranslateExtension('individual').tr(), style: CustomTextStyles.meduimText(context),),
                                        
                              Radio(
                                value: 'Company',
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value.toString();
                                  });
                                },
                              ),
                              Text( StringTranslateExtension('company').tr(),style: CustomTextStyles.meduimText(context),),
                            ],
                          ),
                          SizedBox(height: AppSizes.verSpacesBetweenContainers),
          
                          selectedOption == 'Individual'
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
              hintText:  StringTranslateExtension('name').tr(),
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
              hintText: StringTranslateExtension('name_in_english').tr(),
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
              hintText:  StringTranslateExtension('phone_no').tr(),
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
              hintText: StringTranslateExtension('address').tr(),
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
              hintText:  StringTranslateExtension('street').tr(),
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
              hintText: StringTranslateExtension('country').tr(),
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
              hintText: StringTranslateExtension('city').tr(),
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
              hintText:  StringTranslateExtension('neighborhood').tr(),
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
              hintText: StringTranslateExtension('name').tr(),
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),
            CustomTextField(
              hintText:  StringTranslateExtension('name_in_english').tr(),
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
              hintText:  StringTranslateExtension('phone_no').tr(),
              icon: IconsaxPlusLinear.call,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText:  StringTranslateExtension('address').tr(),
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
              hintText: StringTranslateExtension('street').tr(),
              icon: IconsaxPlusLinear.location,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText:  StringTranslateExtension('country').tr(),
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
              hintText:  StringTranslateExtension('city').tr(),
              icon: IconsaxPlusLinear.building,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText:  StringTranslateExtension('neighborhood').tr(),
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
              hintText: StringTranslateExtension('name').tr(),
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
              hintText:  StringTranslateExtension('name_in_english').tr(),
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
                title: StringTranslateExtension('customers_group').tr(),
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
              hintText:StringTranslateExtension('address').tr(),
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
              hintText:StringTranslateExtension('street').tr(),
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
              hintText: StringTranslateExtension('city').tr(),
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
              hintText:StringTranslateExtension('neighborhood').tr(),
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
              hintText: StringTranslateExtension('country').tr(),
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
              hintText: StringTranslateExtension('phone_no').tr(),
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
              hintText:  StringTranslateExtension('email').tr(),
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
              hintText: StringTranslateExtension('building_no').tr(),
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
              hintText: StringTranslateExtension('tax_no').tr(),
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
              hintText: StringTranslateExtension('postal_code').tr(),
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
              hintText:  StringTranslateExtension('company_commercial').tr(),
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
              hintText:   StringTranslateExtension('additional_no').tr(),
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
                title:  StringTranslateExtension('payment_method').tr(),
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
              hintText: StringTranslateExtension('credit_limt').tr(),
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
              hintText:  StringTranslateExtension('note').tr(),
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
              hintText: StringTranslateExtension('name').tr(),
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),
            CustomTextField(
              hintText: StringTranslateExtension('name_in_english').tr(),
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
                title:StringTranslateExtension('customers_group').tr(),
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
              hintText:StringTranslateExtension('address').tr(),
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
              hintText: StringTranslateExtension('street').tr(),
              icon: IconsaxPlusLinear.location,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText:  StringTranslateExtension('city').tr(),
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
              hintText: StringTranslateExtension('neighborhood').tr(),
              icon: IconsaxPlusLinear.building,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: StringTranslateExtension('country').tr(),
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
              hintText:  StringTranslateExtension('phone_no').tr(),
              icon: IconsaxPlusLinear.call,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText:  StringTranslateExtension('email').tr(),
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
              hintText: StringTranslateExtension('building_no').tr(),
              icon: IconsaxPlusLinear.user,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: StringTranslateExtension('tax_no').tr(),
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
              hintText:  StringTranslateExtension('postal_code').tr(),
              icon: IconsaxPlusLinear.document,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText: StringTranslateExtension('company_commercial').tr(),
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
              hintText: StringTranslateExtension('additional_no').tr(),
              icon: IconsaxPlusLinear.hashtag_1,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),
            Expanded(
              child: SellDropDownButton(
                title: StringTranslateExtension('payment_method').tr(),
                list: [StringTranslateExtension('cash').tr(), StringTranslateExtension('debt').tr(),],
                selected: StringTranslateExtension('cash').tr(),
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
              hintText:  StringTranslateExtension('credit_limt').tr(),
              icon: IconsaxPlusLinear.card,
              width: context.screenWidth / 3.8,
              enabled: true,
            ),
            SizedBox(width: AppSizes.horiSpacesBetweenElements),

            CustomTextField(
              hintText:  StringTranslateExtension('note').tr(),
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
      child: SizedBox(
        width: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
        height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
        child: IconButton(
          onPressed: () {
            customDialog(context);
          },
          icon: Icon(
            IconsaxPlusLinear.user_add,
            color: widget.iconColor,
            size: context.responsiveIconSize(AppSizes.iconSize2),
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
