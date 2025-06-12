import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/add_customer/add_customer_page.dart';
import 'package:app/presentation/pages/customers/widgets/customers_card.dart';
import 'package:app/presentation/pages/customers/widgets/customers_app_bar.dart';
import 'package:app/presentation/widgets/bars/icon_side_bar.dart';
import 'package:app/presentation/widgets/bars/side_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_icon_text_button.dart';
import 'package:app/presentation/widgets/fields/custom_search_field.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Column(children: [CustomersAppBar(), CustomersBody()]),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomersBody extends StatefulWidget {
  const CustomersBody({super.key});

  @override
  State<CustomersBody> createState() => _CustomersBodyState();
}

class _CustomersBodyState extends State<CustomersBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
       horizontal:  AppSizes.horiScreenPadding,
       vertical: AppSizes.verScreenPadding),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSearchField(text: 'Search',),
                CustomIconTextButton(text: 'Add Customer', icon: IconsaxPlusLinear.user_add, page: AddCustomerPage(),),
              ],
            ),
            SizedBox(height: AppSizes.verSpacesBetweenContainers),
            Column(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.horiScreenPadding),
                width: MediaQuery.of(context).size.width,
                height: AppSizes.widgetHeight,
                color: AppColors.lightPurple,
                child: Row(
                  children: [
                    Text('Customers', style: CustomTextStyles.tableHeader(context),),
                    
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 300,
                      child: ListView(
                        children: [
                          CustomerCard(city: 'Dammam', country: 'Saudi Arebia', name: 'Ahmad ',),
                          CustomerCard(city: 'Dammam', country: 'Saudi Arebia', name: 'Maha ',),
                          CustomerCard(city: 'Dammam', country: 'Saudi Arebia', name: 'Yaser ',),
                          CustomerCard(city: 'Dammam', country: 'Saudi Arebia', name: 'Mohammed ',),
                          CustomerCard(city: 'Dammam', country: 'Saudi Arebia', name: 'Adam',),
                          CustomerCard(city: 'Dammam', country: 'Saudi Arebia', name: 'Yazan',),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ],)
          ],
        ),
      ),
    );
  }
}
