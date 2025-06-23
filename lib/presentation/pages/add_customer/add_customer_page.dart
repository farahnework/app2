import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/add_customer/widgets/add_customer_app_bar.dart';
import 'package:app/presentation/pages/customers/customers_page.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/buttons/custom_cancel_outlined_button.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'package:easy_localization/easy_localization.dart';

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
        body: Column(children: [AddCustomerAppBar(), AddCustomerBody()]),
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
                          StringTranslateExtension('customer_information',).tr(),
                          style: CustomTextStyles.titleText(context),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText:  StringTranslateExtension('customer_name',).tr(),
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
                            hintText:StringTranslateExtension('phone_no',).tr(),
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
                            hintText: StringTranslateExtension('tellphone',).tr(),
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
                            hintText: StringTranslateExtension('country',).tr(),
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
                            hintText: StringTranslateExtension('city',).tr(),
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
                                hintText: StringTranslateExtension('street',).tr(),
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
                          StringTranslateExtension('account_information',).tr(),
                          style: CustomTextStyles.titleText(context),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.verSpacesBetweenContainers),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText:StringTranslateExtension('account_no',).tr(),
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
                            hintText: StringTranslateExtension('account_creation_date',).tr(),
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
                            hintText: StringTranslateExtension('notes',).tr(),
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
                  CustomButton(text:  StringTranslateExtension('save',).tr(), radius: true, width: 200, page: CustomersPage(), height: AppSizes.widgetHeight, color: AppColors.darkPurple, textColor: AppColors.white,),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements,),
                  CustomCancelOutlinedButton(text: StringTranslateExtension('cancel',).tr(),)
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
                             StringTranslateExtension('customer_information',).tr(),
                              style: CustomTextStyles.titleText(context),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: StringTranslateExtension('customer_name',).tr(),
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
                                hintText:  StringTranslateExtension('phone_no',).tr(),
                                width: context.screenWidth / 4.8,
                                enabled: true,
                                icon: IconsaxPlusLinear.mobile,
                              ),
                            ),
                            Expanded(
                              child: CustomTextField(
                                hintText: StringTranslateExtension('tellphone',).tr(),
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
                                hintText: StringTranslateExtension('country',).tr(),
                                width: context.screenWidth / 4.8,
                                enabled: true,
                                icon: Iconsax.location,
                              ),
                            ),
                            Expanded(
                              child: CustomTextField(
                                hintText: StringTranslateExtension('city',).tr(),
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
                                    hintText: StringTranslateExtension('street',).tr(),
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
                              StringTranslateExtension('account_information',).tr(),
                              style: CustomTextStyles.titleText(context),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.verSpacesBetweenContainers),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: StringTranslateExtension('account_no',).tr(),
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
                                hintText: StringTranslateExtension('account_creation_date',).tr(),
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
                                hintText: StringTranslateExtension('notes',).tr(),
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
                CustomButton(text:  StringTranslateExtension('save',).tr(), radius: true, width: 200, page: CustomersPage(), height: AppSizes.widgetHeight, color: AppColors.darkPurple, textColor: AppColors.white,),
                SizedBox(width: AppSizes.horiSpacesBetweenElements,),
                CustomCancelOutlinedButton(text: StringTranslateExtension('cancel',).tr(),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
