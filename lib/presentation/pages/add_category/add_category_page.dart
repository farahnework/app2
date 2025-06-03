import 'package:app/presentation/pages/add_product/widgets/add_products_app_bar.dart';
import 'package:app/presentation/pages/customers/customers_page.dart';
import 'package:app/presentation/widgets/bars/side_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/buttons/custom_cancel_outlined_button.dart';
import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: SideBar()),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                AddProductAppBar(),
                Expanded(child: SingleChildScrollView(child: AddCategoryPage())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddCategoryBody extends StatefulWidget {
  const AddCategoryBody({super.key});

  @override
  State<AddCategoryBody> createState() => _AddCategoryBodyState();
}

class _AddCategoryBodyState extends State<AddCategoryBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: AppSizes.horiScreenPadding,
        right: AppSizes.horiScreenPadding,
      ),
      child: Column(
        children: [
          CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Product Information',
                      style: CustomTextStyles.header2,
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.verSpacesBetweenContainers),
                CustomTextField(
                  hintText: 'Product Name',
                  width: width,
                  enabled: true,
                  icon: IconsaxPlusLinear.box,
                ),
                SizedBox(height: AppSizes.verSpacesBetweenContainers),

                CustomTextField(
                  hintText: 'Description',
                  width: width,
                  enabled: true,
                  icon: Iconsax.document,
                ),
                SizedBox(height: AppSizes.verSpacesBetweenContainers),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      hintText: 'SKU',
                      width: width / 3,
                      enabled: true,
                      icon: IconsaxPlusLinear.hashtag_1,
                    ),
                    CustomTextField(
                      hintText: 'Barcode',
                      width: width / 3,
                      enabled: true,
                      icon: IconsaxPlusLinear.barcode,
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.verSpacesBetweenContainers),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropDownButton(
                      icon: IconsaxPlusLinear.tag,
                      title: 'Category',
                      list: ['Category 1', 'Category 2', 'Category 3'],
                      selected: 'Category 1',
                      width: width / 3,
                      height: AppSizes.widgetHeight,
                      color: AppColors.white,
                    ),

                    CustomDropDownButton(
                      icon: IconsaxPlusLinear.tag,

                      title: 'Brand',
                      list: ['Brand 1', 'Brand 2', 'Brand 3'],
                      selected: 'Brand 1',
                      width: width / 3,
                      height: AppSizes.widgetHeight,
                      color: AppColors.white,
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.verSpacesBetweenContainers),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text('Available Online', style: CustomTextStyles.body),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizes.verSpacesBetweenContainers),
          CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [Text('Pricing', style: CustomTextStyles.header2)],
                ),
                SizedBox(height: AppSizes.verSpacesBetweenContainers),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      hintText: 'Selling Price',
                      width: width / 3,
                      enabled: true,
                      icon: IconsaxPlusLinear.tag,
                    ),
                    CustomTextField(
                      hintText: 'Purchase Price',
                      width: width / 3,
                      enabled: true,
                      icon: Iconsax.card,
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.verSpacesBetweenContainers),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropDownButton(
                      icon: IconsaxPlusLinear.tag,
                      title: 'First Tax',
                      list: ['القيمة المضافة', 'صفرية', 'معافاة'],
                      selected: 'القيمة المضافة',
                      width: width / 3,
                      height: AppSizes.widgetHeight,
                      color: AppColors.white,
                    ),

                    CustomDropDownButton(
                      icon: IconsaxPlusLinear.tag,

                      title: 'Second Tax',
                      list: ['القيمة المضافة', 'صفرية', 'معافاة'],
                      selected: 'القيمة المضافة',
                      width: width / 3,
                      height: AppSizes.widgetHeight,
                      color: AppColors.white,
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.verSpacesBetweenContainers),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      hintText: 'Minimum Selling Price',
                      width: width / 3,
                      enabled: true,
                      icon: Iconsax.trend_down,
                    ),
                    Row(
                      children: [
                        CustomTextField(
                          hintText: 'Discount',
                          width: width / 5,
                          enabled: true,
                          icon: Iconsax.discount_shape,
                        ),
                        SizedBox(width: AppSizes.horiSpacesBetweenElements,),
                        CustomDropDownButton(
                          title: 'Discount Type',
                          list: ['Riyal', '%'],
                          selected: '%',
                          width: width/8,
                          height: AppSizes.widgetHeight,
                          icon: Icons.dangerous,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizes.verSpacesBetweenContainers),
          Row(
            children: [
              CustomButton(
                text: 'Save',
                radius: true,
                width: 200,
                page: CustomersPage(),
                height: AppSizes.widgetHeight,
                color: AppColors.darkPurple,
                textColor: AppColors.white,
              ),
              SizedBox(width: AppSizes.horiSpacesBetweenElements),
              CustomCancelOutlinedButton(text: 'Cancel'),
            ],
          ),
          SizedBox(height: AppSizes.verSpacesBetweenContainers),
        ],
      ),
    );
  }
}
