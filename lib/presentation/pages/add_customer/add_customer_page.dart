import 'package:app/presentation/pages/add_customer/widgets/add_customer_app_bar.dart';
import 'package:app/presentation/pages/customers/customers_page.dart';
import 'package:app/presentation/widgets/bars/side_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/buttons/custom_cancel_outlined_button.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
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
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Column(children: [AddCustomerAppBar(), AddCustomerBody()]),
          ),
        ],
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
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: AppSizes.verScreenPadding,
        left: AppSizes.horiScreenPadding,
        right: AppSizes.horiScreenPadding,
      ),
      child: Column(
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
                            style: CustomTextStyles.header2,
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),
                      CustomTextField(
                        hintText: 'Customer Name',
                        width: width,
                        enabled: true,
                        icon: IconsaxPlusLinear.user,
                      ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            hintText: 'Mobile',
                            width: width / 4.8,
                            enabled: true,
                            icon: IconsaxPlusLinear.mobile,
                          ),
                          CustomTextField(
                            hintText: 'Tellphone',
                            width: width / 4.8,
                            enabled: true,
                            icon: IconsaxPlusLinear.call,
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            hintText: 'Country',
                            width: width / 4.8,
                            enabled: true,
                            icon: Iconsax.location,
                          ),
                          CustomTextField(
                            hintText: 'City',
                            width: width / 4.8,
                            enabled: true,
                            icon: IconsaxPlusLinear.location,
                          ),
                          
                        ],
                        
                      ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),
          
                      CustomTextField(
                            hintText: 'Street',
                            width: width / 4.8,
                            enabled: true,
                            icon: Iconsax.location,
                          ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: AppSizes.horiScreenPadding),
          
              Expanded(
                flex: 2,
                child: CustomContainer(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Account Information',
                            style: CustomTextStyles.header2,
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),
                      CustomTextField(
                        hintText: 'Account No.',
                        width: width,
                        enabled: false,
                        icon: IconsaxPlusLinear.hashtag_1,
                      ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),
                      CustomTextField(
                        hintText: 'Account creation date',
                        width: width,
                        enabled: false,
                        icon: IconsaxPlusLinear.calendar,
                      ),
                      SizedBox(height: AppSizes.verSpacesBetweenContainers),
                      CustomTextField(
                        hintText: 'Notes',
                        width: width,
                        enabled: true,
                        icon: Iconsax.note,
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
    );
  }
}
