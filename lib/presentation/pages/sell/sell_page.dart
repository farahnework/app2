import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/sell/widgets/add_customer_button.dart';
import 'package:app/presentation/pages/sell/widgets/close_dialog_button.dart';
import 'package:app/presentation/pages/sell/widgets/sell_app_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/buttons/custom_cancel_outlined_button.dart';
import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:app/presentation/widgets/buttons/custom_outlined_button.dart';
import 'package:app/presentation/widgets/crads/category_card.dart';
import 'package:app/presentation/widgets/crads/order_number_card.dart';
import 'package:app/presentation/widgets/custom_drop_down_list.dart';
import 'package:app/presentation/widgets/fields/custom_search_field.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/presentation/widgets/crads/sell_product_card.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../widgets/crads/product_card.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chooseDeviceDialog(context);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(children: [CustomAppBar(), LiftSide()]),
            ),
            RightSide(),
          ],
        ),
      ),
    );
  }
}

void chooseDeviceDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          color: AppColors.white,
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.25,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenPadding,
            vertical: AppSizes.screenPadding / 2,
          ),
          child: Column(
            children: [
              SizedBox(height: AppSizes.verSpacesBetweenContainers),
              Text('Select session details', style: CustomTextStyles.header1),
              SizedBox(height: AppSizes.verSpacesBetweenContainers),

              CustomDropDownButton(
                title: 'Shift',
                list: ['Main Shift', 'Shift 2'],
                selected: 'Main Shift',
                width: 400,
                height: AppSizes.widgetHeight,
                icon: Iconsax.devices,
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),

              CustomDropDownButton(
                title: 'Device',
                list: ['Device 1', 'Device 2'],
                selected: 'Device 1',
                width: 400,
                height: AppSizes.widgetHeight,
                icon: Iconsax.devices,
              ),
              SizedBox(height: AppSizes.verSpacesBetweenContainers),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CloseDialogButton(
                    text: 'Start the session',
                    radius: true,
                    width: 200,
                    context: dialogContext,
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements),
                  CustomOutlinedButton(text: 'Cancel', page: HomePage()),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

class LiftSide extends StatefulWidget {
  const LiftSide({super.key});

  @override
  State<LiftSide> createState() => _LiftSideState();
}

class _LiftSideState extends State<LiftSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSizes.screenPadding,
          right: AppSizes.screenPadding,
          top: AppSizes.screenPadding / 2,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomSearchField(text: 'Search'),
                    SizedBox(width: AppSizes.horiSpacesBetweenElements),
                    CustomIconButton(icon: IconsaxPlusLinear.scan_barcode, color: AppColors.lightPurple, iconColor: AppColors.darkPurple, size: AppSizes.widgetHeight),
                  ],
                ),
                Row(
                  children: [
                  // Icon(IconsaxPlusLinear.arrow_left_1, color: AppColors.darkGray,),
                  // SizedBox(width: AppSizes.horiSpacesBetweenElements,),
                  Icon(IconsaxPlusLinear.home_2, color: AppColors.darkPurple,),
                ],)
              ],
            ),
            SizedBox(height: AppSizes.verSpacesBetweenContainers),
            Row(
              children: [
                Text(
                  'Categories',
                  style: CustomTextStyles.header2,
                ),
              ],
            ),
            SizedBox(height: AppSizes.verSpacesBetweenElements),
            SizedBox(
              height: AppSizes.widgetHeight *1.5,

              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: [
                    CategoryCard(
                      image: 'lib/assets/images/pens.webp',
                      categoryName: 'Pens',
                      itemsNum: 10,
                    ),
                  CategoryCard(
                    image: 'lib/assets/images/pencils.webp',
                    categoryName: 'Pencils',
                    itemsNum: 23,
                  ),
                 
                  CategoryCard(
                    image: 'lib/assets/images/notebooks.jpg',
                    categoryName: 'Notebooks',
                    itemsNum: 12,
                  ),
                  CategoryCard(
                    image: 'lib/assets/images/highlights.jpg',
                    categoryName: 'Highlights',
                    itemsNum: 3,
                  ),
                  CategoryCard(
                    image: 'lib/assets/images/pens.webp',
                    categoryName: 'Pens',
                    itemsNum: 10,
                  ),
                  CategoryCard(
                    image: 'lib/assets/images/eraser.jpg',
                    categoryName: 'Eraser',
                    itemsNum: 6,
                  ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSizes.verSpacesBetweenContainers),
            Row(
              children: [
                Text(
                  'Products',
                  style: CustomTextStyles.header2,
                ),
              ],
            ),
            SizedBox(height: AppSizes.verSpacesBetweenElements),

            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: AppSizes.horiSpacesBetweenElements,
                  mainAxisSpacing: AppSizes.horiSpacesBetweenElements,
                  childAspectRatio: 0.9,
                ),
                children: [
                  
                  ProductCard(
                    image: 'lib/assets/images/eraser.jpg',
                    productName: 'Color Pencils',
                  ),
                  ProductCard(
                    image: 'lib/assets/images/eraser2.jpg',
                    productName: 'Color Pencils',
                  ),
                  ProductCard(
                    image: 'lib/assets/images/eraser2.jpg',
                    productName: 'Color Pencils',
                  ),
                  ProductCard(
                    image: 'lib/assets/images/highlights.jpg',
                    productName: 'Color Pencils',
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: GridView.builder(
            //     itemCount: 30,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 5,
            //       crossAxisSpacing: AppSizes.horiSpacesBetweenElements,
            //       mainAxisSpacing: AppSizes.horiSpacesBetweenElements,
            //     ),
            //     itemBuilder: (context, index) {
            //       return ProductCard();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class RightSide extends StatefulWidget {
  const RightSide({super.key});

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          border: Border(left: BorderSide(color: AppColors.grey)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: AppSizes.widgetHeight,
              child: Row(
                children: [
                  Container(
                    width: AppSizes.widgetHeight,
                    height: AppSizes.widgetHeight,
                    decoration: BoxDecoration(color: AppColors.darkPurple),
                    child: IconButton(
                      color: AppColors.darkPurple,
                      onPressed: () {},
                      icon: Icon(Icons.add, color: AppColors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: AppSizes.widgetHeight,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          OrderNumberCard(orderNumber: '1', isActive: false),
                          OrderNumberCard(orderNumber: '2', isActive: false),
                          OrderNumberCard(orderNumber: '3', isActive: false),
                          OrderNumberCard(orderNumber: '4', isActive: true),
                          OrderNumberCard(orderNumber: '5', isActive: false),
                          OrderNumberCard(orderNumber: '6', isActive: false),
                          OrderNumberCard(orderNumber: '7', isActive: false),
                          OrderNumberCard(orderNumber: '8', isActive: false),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: AppSizes.screenPadding / 2,
                right: AppSizes.screenPadding / 2,
                top: AppSizes.screenPadding / 2,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Iconsax.user,
                          color: AppColors.darkPurple,
                          size: 25,
                        ),
                        SizedBox(width: AppSizes.horiSpacesBetweenElements),

                        Text(
                          'Ganeral Customer',
                          style: CustomTextStyles.header2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomIconButton(
                          icon: Iconsax.printer,
                          color: AppColors.lightPurple,
                          iconColor: AppColors.darkPurple,
                          size: AppSizes.iconButtonSize,
                        ),
                        SizedBox(width: AppSizes.horiSpacesBetweenElements),
                        CustomIconButton(
                          icon: Iconsax.trash,
                          color: AppColors.lightPurple,
                          iconColor: AppColors.darkPurple,
                          size: AppSizes.iconButtonSize,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSizes.verSpacesBetweenElements),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SellProductCard(
                    image: 'lib/assets/images/eraser.jpg',
                    amount: 1,
                    price: 2000,
                    productName: "Asus Laptop",
                  );
                },
              ),
            ),

            Container(
              padding: EdgeInsets.only(
                right: AppSizes.screenPadding / 2,
                left: AppSizes.screenPadding / 2,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border(
                  top: BorderSide(
                    color: AppColors.darkPurple,
                    width: AppSizes.borderSize,
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: AppSizes.horiSpacesBetweenElements),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('subtotal:', style: CustomTextStyles.body),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                      Row(
                        children: [
                          SizedBox(
                            width: AppSizes.fontSize2,
                            height: AppSizes.fontSize2,
                            child: SvgPicture.asset(
                              AppImages.rial,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                          Text('2000', style: CustomTextStyles.body),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text('VAT:', style: CustomTextStyles.body),
                      SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                      Row(
                        children: [
                          SizedBox(
                            width: AppSizes.fontSize2,
                            height: AppSizes.fontSize2,
                            child: SvgPicture.asset(
                              AppImages.rial,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                          Text('120', style: CustomTextStyles.body),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.verSpacesBetweenElements / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:', style: CustomTextStyles.header1),

                      SizedBox(width: AppSizes.horiSpacesBetweentTexts),
                      Row(
                        children: [
                          SizedBox(
                            width: AppSizes.fontSize1,
                            height: AppSizes.fontSize1,
                            child: SvgPicture.asset(
                              AppImages.rial,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                          Text('2000', style: CustomTextStyles.header1),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.horiSpacesBetweenElements),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.darkPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
                child: Text('Payment', style: CustomTextStyles.buttonTextStyle),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: AppColors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer, // Rounded corners
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.8,
        height: MediaQuery.of(context).size.height / 1.4,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.screenPadding,
                vertical: AppSizes.screenPadding / 2.5,
              ),
              color: AppColors.lightPurple,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Iconsax.close_circle, color: AppColors.black),
                  ),
                ],
              ),
            ),
            DialogBody(),
          ],
        ),
      ),
    );
  }
}

class DialogBody extends StatefulWidget {
  const DialogBody({super.key});

  @override
  State<DialogBody> createState() => _DialogBodyState();
}

class _DialogBodyState extends State<DialogBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.screenPadding),
      child: Row(
        children: [
          Expanded(child: dialogLiftSide()),
          Container(
            width: 40,
            decoration: BoxDecoration(color: AppColors.black),
          ),

          Expanded(
            child: StatefulBuilder(
              builder: (context, setState) {
                TabController tabController = TabController(
                  length: 3,
                  vsync: Navigator.of(context),
                );
                return dialogRightSide(tabController);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget tab1() {
  return Center(
    child: Container(
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.textFieldRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Payed:", style: CustomTextStyles.header2),
          SizedBox(height: AppSizes.verSpacesBetweenElements),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: AppSizes.fontSize1,
                height: AppSizes.fontSize1,
                child: SvgPicture.asset(AppImages.rial),
              ),
              SizedBox(width: AppSizes.horiSpacesBetweentTexts),

              Text("2000", style: CustomTextStyles.header1),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget tab2() {
  return Center(
    child: Container(
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.textFieldRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Payed:", style: CustomTextStyles.header2),
          SizedBox(height: AppSizes.verSpacesBetweenElements),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: AppSizes.fontSize1,
                height: AppSizes.fontSize1,
                child: SvgPicture.asset(AppImages.rial),
              ),
              SizedBox(width: AppSizes.horiSpacesBetweentTexts),

              Text("2000", style: CustomTextStyles.header1),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget tab3() {
  return Center(
    child: Container(
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.textFieldRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("Cash:", style: CustomTextStyles.header2),
              SizedBox(width: AppSizes.horiSpacesBetweenElements),
              CustomTextField(
                hintText: 'Cash',
                width: 250,
                enabled: true,
                icon: IconsaxPlusLinear.coin,
              ),
            ],
          ),
          SizedBox(height: AppSizes.verSpacesBetweenElements),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Card:", style: CustomTextStyles.header2),
              SizedBox(width: AppSizes.horiSpacesBetweenElements),
              CustomTextField(
                hintText: 'Card',
                width: 250,
                enabled: true,
                icon: IconsaxPlusLinear.card,
              ),
            ],
          ),
          SizedBox(height: AppSizes.verSpacesBetweenElements),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("Total:", style: CustomTextStyles.header2),
              SizedBox(width: AppSizes.horiSpacesBetweenElements),
              CustomTextField(
                hintText: '2000',
                width: 250,
                enabled: false,
                icon: IconsaxPlusLinear.wallet_money,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget dialogLiftSide() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AddCustomerButton(color: AppColors.lightPurple, iconColor: AppColors.darkPurple, size: AppSizes.iconButtonSize),
          CustomDropDownButton(
            icon: IconsaxPlusLinear.tag,

            title: 'General Customer',
            list: ['Customer 1', 'Customer 2'],
            selected: "Customer 1",
            width: 200,
            height: AppSizes.widgetHeight,
          ),
        ],
      ),
      SizedBox(height: AppSizes.verSpacesBetweenContainers),
      Container(
        padding: EdgeInsets.all(AppSizes.cardPadding),
        decoration: BoxDecoration(
          color: AppColors.lightPurple,
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.textFieldRadius),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("General Customer", style: CustomTextStyles.header2),
            SizedBox(height: AppSizes.verSpacesBetweenElements),
            Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset("lib/assets/icons/rial.png"),
                ),
                SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                Text("200,444", style: CustomTextStyles.header1),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: AppSizes.verSpacesBetweenContainers),
      Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Subtotal:', style: CustomTextStyles.header2),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('Discount:', style: CustomTextStyles.header2),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('VAT:', style: CustomTextStyles.header2),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('Payed:', style: CustomTextStyles.header2),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('Returned:', style: CustomTextStyles.header2),
            ],
          ),
          SizedBox(width: AppSizes.verSpacesBetweenContainers),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("lib/assets/icons/rial.png"),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('2000', style: CustomTextStyles.body),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("lib/assets/icons/rial.png"),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('2000', style: CustomTextStyles.body),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("lib/assets/icons/rial.png"),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('2000', style: CustomTextStyles.body),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("lib/assets/icons/rial.png"),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('2000', style: CustomTextStyles.body),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset("lib/assets/icons/rial.png"),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('2000', style: CustomTextStyles.body),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget dialogRightSide(TabController tabController) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.textFieldRadius),
          ),
          border: Border.all(color: AppColors.grey),
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: AppColors.white,
          indicatorColor: AppColors.white,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicator: BoxDecoration(
            color: AppColors.darkPurple,
            borderRadius: BorderRadius.all(
              Radius.circular(AppSizes.textFieldRadius),
            ),
          ),
          automaticIndicatorColorAdjustment: true,
          labelColor: AppColors.white,
          controller: tabController,
          tabs: [
            Tab(text: 'Cash'),
            Tab(text: 'Card'),
            Tab(text: 'Cash + Card'),
          ],
        ),
      ),
      SizedBox(height: AppSizes.verSpacesBetweenContainers),
      Container(
        height: 200,
        child: TabBarView(
          controller: tabController,
          children: [tab1(), tab2(), tab3()],
        ),
      ),
      SizedBox(height: AppSizes.verSpacesBetweenContainers),
      Row(
        children: [
          CustomButton(
            text: 'Validate',
            radius: true,
            width: 200,
            page: SellPage(),
            height: AppSizes.widgetHeight,
          ),
          SizedBox(width: AppSizes.horiSpacesBetweenElements),
          CustomCancelOutlinedButton(text: 'Cancel'),
        ],
      ),
    ],
  );
}
