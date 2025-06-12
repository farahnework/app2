import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/customers/customers_page.dart';
import 'package:app/presentation/pages/customers/widgets/customers_app_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/buttons/custom_cancel_outlined_button.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        body: Column(children: [CustomersAppBar(), AddCustomerBody()]),
      ),
    );
  }
}

class AddCustomerBody extends StatefulWidget {
  const AddCustomerBody({super.key});

  @override
  State<AddCustomerBody> createState() => _AddCustomerBodyState();
}

class _AddCustomerBodyState extends State<AddCustomerBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          top: AppSizes.verticalPadding,
          left: AppSizes.horizontalPadding,
          right: AppSizes.horizontalPadding,
        ),
        child: 
        context.isMobile?
        SingleChildScrollView(
          child: Column(
            children: [
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Customer Information',
                          style: CustomTextStyles.titleText(context),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Customer Name',
                            width: context.screenWidth,
                            enabled: true,
                            icon: IconsaxPlusLinear.user,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Mobile',
                            width: context.screenWidth / 4.8,
                            enabled: true,
                            icon: IconsaxPlusLinear.mobile,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Tellphone',
                            width: context.screenWidth / 4.8,
                            enabled: true,
                            icon: IconsaxPlusLinear.call,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Country',
                            width: context.screenWidth / 4.8,
                            enabled: true,
                            icon: Iconsax.location,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'City',
                            width: context.screenWidth / 4.8,
                            enabled: true,
                            icon: IconsaxPlusLinear.location,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                      
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                                hintText: 'Street',
                                width: context.screenWidth / 4.8,
                                enabled: true,
                                icon: Iconsax.location,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.verSpacesBetweenContainers,),
                        
              CustomContainer(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Account Information',
                          style: CustomTextStyles.titleText(context),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Account No.',
                            width: context.screenWidth,
                            enabled: false,
                            icon: IconsaxPlusLinear.hashtag_1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Account creation date',
                            width: context.screenWidth,
                            enabled: false,
                            icon: IconsaxPlusLinear.calendar,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Notes',
                            width: context.screenWidth,
                            enabled: true,
                            icon: Iconsax.note,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                  
                  ],
                ),
              ),
              SizedBox(height: AppSizes.verSpacesBetweenContainers,),
              Row(
                children: [
                  CustomButton(text: 'Save', radius: true, width: 200, page: CustomersPage(), height: AppSizes.widgetHeight, color: AppColors.darkPurple, textColor: AppColors.white,),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements,),
                  CustomCancelOutlinedButton(text: 'Cancel')
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenContainers,),
            ],
          ),
        ):
        
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex:3,
                  child: CustomContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Customer Information',
                              style: CustomTextStyles.titleText(context),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Customer Name',
                                width: context.screenWidth,
                                enabled: true,
                                icon: IconsaxPlusLinear.user,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Mobile',
                                width: context.screenWidth / 4.8,
                                enabled: true,
                                icon: IconsaxPlusLinear.mobile,
                              ),
                            ),
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Tellphone',
                                width: context.screenWidth / 4.8,
                                enabled: true,
                                icon: IconsaxPlusLinear.call,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Country',
                                width: context.screenWidth / 4.8,
                                enabled: true,
                                icon: Iconsax.location,
                              ),
                            ),
                            Expanded(
                              child: CustomTextField(
                                hintText: 'City',
                                width: context.screenWidth / 4.8,
                                enabled: true,
                                icon: IconsaxPlusLinear.location,
                              ),
                            ),
                            
                          ],
                          
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
            
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                    hintText: 'Street',
                                    width: context.screenWidth / 4.8,
                                    enabled: true,
                                    icon: Iconsax.location,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.horizontalPadding),
            
                Expanded(
                  flex: 2,
                  child: CustomContainer(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Account Information',
                              style: CustomTextStyles.titleText(context),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Account No.',
                                width: context.screenWidth,
                                enabled: false,
                                icon: IconsaxPlusLinear.hashtag_1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Account creation date',
                                width: context.screenWidth,
                                enabled: false,
                                icon: IconsaxPlusLinear.calendar,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Notes',
                                width: context.screenWidth,
                                enabled: true,
                                icon: Iconsax.note,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                      
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.verSpacesBetweenContainers,),
            Row(
              children: [
                CustomButton(text: 'Save', radius: true, width: 200, page: CustomersPage(), height: AppSizes.widgetHeight, color: AppColors.darkPurple, textColor: AppColors.white,),
                SizedBox(width: AppSizes.horiSpacesBetweenElements,),
                CustomCancelOutlinedButton(text: 'Cancel')
              ],
            )
          ],
        ),
      ),
    );
  }
}
