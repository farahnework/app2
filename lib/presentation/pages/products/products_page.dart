import 'package:app/presentation/pages/add_product/add_product_page.dart';
import 'package:app/presentation/pages/products/widgets/product_card.dart';
import 'package:app/presentation/pages/products/widgets/products_app_bar.dart';
import 'package:app/presentation/pages/products/widgets/products_search_icon_button.dart';
import 'package:app/presentation/widgets/bars/side_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/buttons/custom_icon_text_button.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Column(
              children: [
                ProductsAppBar(),
                Expanded(child: SingleChildScrollView(child: ProductsBody())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductsBody extends StatefulWidget {
  const ProductsBody({super.key});

  @override
  State<ProductsBody> createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: AppSizes.screenPadding,
          left: AppSizes.screenPadding,
          right: AppSizes.screenPadding,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  hintText: 'Keyword',
                  icon: IconsaxPlusLinear.search_normal_1,
                  width: 500,
                  enabled: true,
                ),
                Row(
                  children: [
                    CustomIconTextButton(
                      text: 'Add Product',
                      icon: IconsaxPlusLinear.box,
                      page: AddProductPage(),
                    ),
                    SizedBox(width: AppSizes.horiSpacesBetweenElements),
                    CustomIconTextButton(
                      text: 'Add Category',
                      icon: IconsaxPlusLinear.box,
                      page: AddProductPage(),
                    ),
                    SizedBox(width: AppSizes.horiSpacesBetweenElements),

                    CustomIconTextButton(
                      text: 'Add brand',
                      icon: IconsaxPlusLinear.box,
                      page: AddProductPage(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppSizes.verSpacesBetweenContainers),
            CustomContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomTextField(
                            hintText: 'Barcode',
                            icon: IconsaxPlusLinear.barcode,
                            width: 250,
                            enabled: true,
                          ),
                          SizedBox(width: AppSizes.horiSpacesBetweenElements),

                          CustomDropDownButton(
                            icon: IconsaxPlusLinear.tag,
                            color: AppColors.white,

                            title: 'Category',
                            list: ['Category 1', 'Category 2', 'Category 3'],
                            selected: 'Category 1',
                            width: 200,
                            height: AppSizes.widgetHeight,
                          ),
                          SizedBox(width: AppSizes.horiSpacesBetweenElements),

                          CustomDropDownButton(
                            icon: IconsaxPlusLinear.tag,
                            color: AppColors.white,

                            title: 'Brand',
                            list: ['Brand 1', 'Brand 2', 'Brand 3'],
                            selected: 'Brand 1',
                            width: 200,
                            height: AppSizes.widgetHeight,
                          ),
                          SizedBox(width: AppSizes.horiSpacesBetweenElements),

                          CustomDropDownButton(
                            icon: IconsaxPlusLinear.tag,
                            color: AppColors.white,

                            title: 'Status',
                            list: ['Status 1', 'Status 2', 'Status 3'],
                            selected: 'Status 1',
                            width: 200,
                            height: AppSizes.widgetHeight,
                          ),
                        ],
                      ),
                      ProductsPageIconButton(
                        icon: IconsaxPlusLinear.search_normal_1,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.verSpacesBetweenElements),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, i) {
                              return ProductCard(
                                name: 'Apple',
                                image: 'lib/assets/images/apple.webp',
                                price: '6',
                                stock: 30,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
