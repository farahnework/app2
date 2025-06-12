import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/core/responsive/responsive_sizing.dart';
import 'package:app/core/responsive/screen_layouts.dart';
import 'package:app/presentation/pages/restaurant_orders.dart/widgets/add_note_dialog.dart';
import 'package:app/presentation/pages/sell/widgets/add_customer_button.dart';
import 'package:app/presentation/pages/sell/widgets/choose_device_dialog.dart';
import 'package:app/presentation/pages/sell/widgets/sell_app_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/buttons/custom_cancel_outlined_button.dart';
import 'package:app/presentation/widgets/buttons/custom_dialog_button.dart';
import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:app/presentation/widgets/crads/category_card.dart';
import 'package:app/presentation/widgets/crads/order_number_card.dart';
import 'package:app/presentation/widgets/fields/custom_search_field.dart';
import 'package:app/presentation/widgets/fields/custom_text_field.dart';
import 'package:app/presentation/widgets/crads/sell_product_card.dart';
import 'package:app/presentation/widgets/numbers_palette.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_images.dart';
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
        resizeToAvoidBottomInset: true,
        body:
            context.isMobile
                ? Row(
                  children: [
                    // Expanded(
                    //   flex: 2,
                    //   child: Column(children: [CustomAppBar(), LeftSide()]),
                    // ),
                    RightSide(),
                  ],
                )
                : Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(children: [CustomAppBar(), LeftSide()]),
                    ),
                    RightSide(),
                  ],
                ),
      ),
    );
  }
}

class LeftSide extends StatefulWidget {
  const LeftSide({super.key});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
  @override
  Widget build(BuildContext context) {
    int crossAxisCount =
        context.isMobile
            ? ScreenLayouts.mobileCrossAxisCount
            : ResponsiveSizing.isTablet(context)
            ? ScreenLayouts.tabletCrossAxisCount
            : ScreenLayouts.desktopCrossAxisCount;

    double spacing =
        context.isMobile
            ? ScreenLayouts.mobileSpacing
            : ResponsiveSizing.isTablet(context)
            ? ScreenLayouts.tabletSpacing
            : ScreenLayouts.desktopSpacing;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSizes.horizontalPadding,
          right: AppSizes.horizontalPadding,
          top: AppSizes.verticalPadding / 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomSearchField(text: 'Search'),
                    SizedBox(width: AppSizes.horiSpacesBetweenElements),
                    CustomIconButton(
                      icon: IconsaxPlusLinear.scan_barcode,
                      color: AppColors.lightPurple,
                      iconColor: AppColors.darkPurple,
                      size: AppSizes.widgetHeight,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      IconsaxPlusLinear.home_2,
                      color: AppColors.darkPurple,
                      size: context.responsiveIconSize(AppSizes.iconSize2),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppSizes.verSpacesBetweenContainers),
            Row(
              children: [
                Text('Categories', style: CustomTextStyles.titleText(context)),
              ],
            ),
            SizedBox(height: AppSizes.verSpacesBetweenElements),
            SizedBox(
              height: context.responsiveRelativeSize(
                containerSize: context.screenHeight,
                percentage: AppSizes.widgetHeight * 1.3,
              ),
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
                Text('Products', style: CustomTextStyles.titleText(context)),
              ],
            ),
            SizedBox(height: AppSizes.verSpacesBetweenElements),

            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: context.isDesktop ? 0.95 : 0.8,
                ),
                children: [
                  ProductCard(
                    image: 'lib/assets/images/eraser.jpg',
                    productName: 'Color Pencils',
                    price: 6,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/eraser2.jpg',
                    productName: 'Color Pencils',
                    price: 3,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/image8.jpg',
                    productName: 'Color Pencils',
                    price: 5,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/highlights.jpg',
                    productName: 'Color Pencils',
                    price: 6,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/image2.jpg',
                    productName: 'Color Pencils',
                    price: 2,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/image4.jpg',
                    productName: 'Color Pencils',
                    price: 8,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/image3.jpg',
                    productName: 'Color Pencils',
                    price: 11,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/image6.jpg',
                    productName: 'Color Pencils',
                    price: 4,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/image5.jpg',
                    productName: 'Color Pencils',
                    price: 9,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/image1.jpg',
                    productName: 'Color Pencils',
                    price: 7,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/image2.jpg',
                    productName: 'Color Pencils',
                    price: 5,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/image8.jpg',
                    productName: 'Color Pencils',
                    price: 12,
                  ),
                  ProductCard(
                    image: 'lib/assets/images/image7.jpg',
                    productName: 'Color Pencils',
                    price: 22,
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
              height: context.responsiveRelativeSize(
                containerSize: context.screenHeight,
                percentage: AppSizes.widgetHeight,
              ),
              child: Row(
                children: [
                  if (context.isMobile)
                    Container(
                      width: context.responsiveRelativeSize(
                        containerSize: context.screenHeight,
                        percentage: AppSizes.widgetHeight,
                      ),
                      height: context.responsiveRelativeSize(
                        containerSize: context.screenHeight,
                        percentage: AppSizes.widgetHeight,
                      ),
                      decoration: BoxDecoration(color: AppColors.darkBlue),
                      child: IconButton(
                        color: AppColors.darkPurple,
                        onPressed: () {},
                        icon: Icon(
                          IconsaxPlusLinear.box,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  Container(
                    width: context.responsiveRelativeSize(
                      containerSize: context.screenHeight,
                      percentage: AppSizes.widgetHeight,
                    ),
                    height: context.responsiveRelativeSize(
                      containerSize: context.screenHeight,
                      percentage: AppSizes.widgetHeight,
                    ),
                    decoration: BoxDecoration(color: AppColors.darkPurple),
                    child: IconButton(
                      color: AppColors.darkPurple,
                      onPressed: () {},
                      icon: Icon(Icons.add, color: AppColors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: context.responsiveRelativeSize(
                        containerSize: context.screenHeight,
                        percentage: AppSizes.widgetHeight,
                      ),
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
                left:
                    context.responsiveSpacing(AppSizes.horizontalPadding) / 1.5,
                right:
                    context.responsiveSpacing(AppSizes.horizontalPadding) / 1.5,
                top:
                    context.responsiveSpacing(AppSizes.horizontalPadding) / 1.5,
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
                          size: context.responsiveIconSize(AppSizes.iconSize),
                        ),
                        SizedBox(width: AppSizes.horiSpacesBetweenElements),

                        Text(
                          'Ganeral Customer',
                          style: CustomTextStyles.meduimText(context),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomIconButton(
                          icon: Iconsax.printer,
                          color: AppColors.lightPurple,
                          iconColor: AppColors.darkPurple,
                          size: AppSizes.widgetHeight,
                        ),
                        SizedBox(width: AppSizes.horiSpacesBetweenElements),
                        CustomIconButton(
                          icon: Iconsax.trash,
                          color: AppColors.lightPurple,
                          iconColor: AppColors.darkPurple,
                          size: AppSizes.widgetHeight,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSizes.verSpacesBetweenElements),

            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  SellProductCard(
                    image: 'lib/assets/images/eraser.jpg',
                    amount: 1,
                    price: 2000,
                    productName: "Asus Laptop",
                  ),
                  SellProductCard(
                    image: 'lib/assets/images/image1.jpg',
                    amount: 2,
                    price: 20,
                    productName: "Pens",
                  ),
                  SellProductCard(
                    image: 'lib/assets/images/image2.jpg',
                    amount: 2,
                    price: 3,
                    productName: "Pens",
                  ),
                  SellProductCard(
                    image: 'lib/assets/images/image3.jpg',
                    amount: 1,
                    price: 5,
                    productName: "Pens",
                  ),
                  SellProductCard(
                    image: 'lib/assets/images/image4.jpg',
                    amount: 2,
                    price: 7,
                    productName: "Pens",
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(
                right: AppSizes.horizontalPadding / 2,
                left: AppSizes.horizontalPadding / 2,
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
                  SizedBox(height: AppSizes.verSpacesBetweenElements * 1.5),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Delete',
                          radius: true,
                          width: 20,
                          height: AppSizes.widgetHeight * 0.8,
                          color: AppColors.red,
                          textColor: AppColors.white,
                        ),
                      ),
                      SizedBox(width: AppSizes.horiSpacesBetweenElements),

                      Expanded(
                        child: CustomButton(
                          text: 'Price',
                          radius: true,
                          width: 20,
                          height: AppSizes.widgetHeight * 0.8,
                          color: AppColors.lightGreen,
                          textColor: AppColors.darkGreen,
                        ),
                      ),
                      SizedBox(width: AppSizes.horiSpacesBetweenElements),

                      Expanded(
                        child: CustomButton(
                          text: 'Amount',
                          radius: true,
                          width: 20,
                          height: AppSizes.widgetHeight * 0.8,
                          color: AppColors.lightBlue,
                          textColor: AppColors.darkBlue,
                        ),
                      ),
                      SizedBox(width: AppSizes.horiSpacesBetweenElements),
                      Expanded(
                        child: CustomDialogButton(
                          color: AppColors.lightYellow,
                          textColor: AppColors.yellow,
                          text: 'Note',
                          dialog: addNoteDialog,
                          height: AppSizes.widgetHeight * 0.8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.verSpacesBetweenElements * 1.5),
            NumbersPalette(),
            SizedBox(height: AppSizes.verSpacesBetweenElements * 1.5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Payment:',
                      style: CustomTextStyles.buttonText(
                        context,
                      ).copyWith(fontWeight: AppSizes.fontWeight1),
                    ),
                    SizedBox(width: AppSizes.horiSpacesBetweenElements),
                    SvgPicture.asset(
                      AppImages.rial,
                      width: context.responsiveFontSize(AppSizes.fontSize6),
                      color: AppColors.white,
                    ),
                    SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                    Text(
                      '260',
                      style: CustomTextStyles.buttonText(
                        context,
                      ).copyWith(fontWeight: AppSizes.fontWeight1),
                    ),
                  ],
                ),
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
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        width:
            context.screenWidth /
            (context.isDesktop
                ? 1.5
                : context.isDesktop
                ? 1.5
                : 1),
        height: context.screenHeight / 1.3,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.horizontalPadding,
                vertical: AppSizes.verticalPadding /2,
              ),
              color: AppColors.lightPurple,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Iconsax.close_circle,
                      color: AppColors.darkPurple,
                      size: context.responsiveIconSize(AppSizes.iconSize),
                    ),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements),
                  Text(
                    'Payment',
                    style: CustomTextStyles.titleText(
                      context,
                    ).copyWith(color: AppColors.darkPurple),
                  ),
                ],
              ),
            ),
            Expanded(child: DialogBody()),
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
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding,
        vertical: AppSizes.verticalPadding,
      ),
      child:
          context.isMobile
              ? Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dialogleftSide(context),
                      Container(
                        width: 40,
                        decoration: BoxDecoration(color: AppColors.black),
                      ),

                      StatefulBuilder(
                        builder: (context, setState) {
                          TabController tabController = TabController(
                            length: 4,
                            vsync: Navigator.of(context),
                          );
                          return dialogRightSide(tabController, context);
                        },
                      ),
                    ],
                  ),
                ),
              )
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: dialogleftSide(context)),
                  SizedBox(width: AppSizes.horiSpacesBetweenElements * 2),
                  Expanded(
                    flex: 3,
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        TabController tabController = TabController(
                          length: 4,
                          vsync: Navigator.of(context),
                        );
                        return dialogRightSide(tabController, context);
                      },
                    ),
                  ),
                ],
              ),
    );
  }
}

Widget tab1(BuildContext context) {
  return Center(
    child: Container(
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.textFieldRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Subtotal:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('Discount:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('VAT:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('Total:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text(
                'Payed:',
                style: CustomTextStyles.largeText(
                  context,
                ).copyWith(color: AppColors.darkGreen),
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text(
                'Returned:',
                style: CustomTextStyles.largeText(
                  context,
                ).copyWith(color: AppColors.red),
              ),
            ],
          ),
          SizedBox(width: AppSizes.verSpacesBetweenContainers),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.rial,
                    width: context.responsiveFontSize(AppSizes.fontSize6),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('1520', style: CustomTextStyles.smallText(context)),
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

                  Text('200', style: CustomTextStyles.smallText(context)),
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

                  Text('350', style: CustomTextStyles.smallText(context)),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.rial,
                    width: context.responsiveFontSize(AppSizes.fontSize6),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('1800', style: CustomTextStyles.smallText(context)),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.rial,
                    width: context.responsiveFontSize(AppSizes.fontSize6),
                    color: AppColors.darkGreen,
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text(
                    '2000',
                    style: CustomTextStyles.largeText(
                      context,
                    ).copyWith(color: AppColors.darkGreen),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.rial,
                    width: context.responsiveFontSize(AppSizes.fontSize6),
                    color: AppColors.red,
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text(
                    '20',
                    style: CustomTextStyles.largeText(
                      context,
                    ).copyWith(color: AppColors.red),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget tab2(BuildContext context) {
  return Center(
    child: Container(
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.textFieldRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Subtotal:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('Discount:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('VAT:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('Total:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text(
                'Payed:',
                style: CustomTextStyles.largeText(
                  context,
                ).copyWith(color: AppColors.darkGreen),
              ),
              
            ],
          ),
          SizedBox(width: AppSizes.verSpacesBetweenContainers),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.rial,
                    width: context.responsiveFontSize(AppSizes.fontSize6),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('1520', style: CustomTextStyles.smallText(context)),
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

                  Text('200', style: CustomTextStyles.smallText(context)),
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

                  Text('350', style: CustomTextStyles.smallText(context)),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.rial,
                    width: context.responsiveFontSize(AppSizes.fontSize6),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('1800', style: CustomTextStyles.smallText(context)),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.rial,
                    width: context.responsiveFontSize(AppSizes.fontSize6),
                    color: AppColors.darkGreen,
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text(
                    '2000',
                    style: CustomTextStyles.largeText(
                      context,
                    ).copyWith(color: AppColors.darkGreen),
                  ),
                ],
              ),
             
            ],
          ),
        ],
      ),
    ),
  );
}

Widget tab3(BuildContext context) {
  ScrollController _scrollController = ScrollController();
  return Center(
    child: Container(
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.textFieldRadius),
        ),
      ),
      child: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text("Cash:", style: CustomTextStyles.meduimText(context)),
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
                  Text("Card:", style: CustomTextStyles.meduimText(context)),
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
                  Text("Total:", style: CustomTextStyles.meduimText(context)),
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
      ),
    ),
  );
}

Widget tab4(BuildContext context) {
   return Center(
    child: Container(
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.textFieldRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Subtotal:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('Discount:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('VAT:', style: CustomTextStyles.meduimText(context)),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Text('Total:', style: CustomTextStyles.meduimText(context)),
            
            ],
          ),
          SizedBox(width: AppSizes.verSpacesBetweenContainers),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.rial,
                    width: context.responsiveFontSize(AppSizes.fontSize6),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('1520', style: CustomTextStyles.smallText(context)),
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

                  Text('200', style: CustomTextStyles.smallText(context)),
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

                  Text('350', style: CustomTextStyles.smallText(context)),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.rial,
                    width: context.responsiveFontSize(AppSizes.fontSize6),
                  ),
                  SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                  Text('1800', style: CustomTextStyles.smallText(context)),
                ],
              ),
             
            ],
          ),
        ],
      ),
    ),
  );
}

Widget dialogleftSide(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      if(context.isMobile)
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Customer Information:', style: CustomTextStyles.titleText(context),),
        ],
      ),
      if(context.isMobile)
      SizedBox(height: AppSizes.verSpacesBetweenElements,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddCustomerButton(
            color: AppColors.lightPurple,
            iconColor: AppColors.darkPurple,
            size: AppSizes.iconButtonSize,
          ),
          SizedBox(
            width: context.responsiveRelativeSize(containerSize: context.screenWidth, percentage: context.isMobile?70:25),
            child: CustomDropDownButton(
              icon: IconsaxPlusLinear.tag,
              color: AppColors.white,

              title: 'General Customer',
              list: ['Customer 1', 'Customer 2'],
              selected: "Customer 1",
              width: 200,
              height: AppSizes.widgetHeight,
            ),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "General Customer",
              style: CustomTextStyles.titleText(context),
            ),
            SizedBox(height: AppSizes.verSpacesBetweenElements),
            Row(
              children: [
                SvgPicture.asset(
                  AppImages.rial,
                  width: context.responsiveFontSize(AppSizes.fontSize6),
                ),
                SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                Text("200,444", style: CustomTextStyles.titleText(context)),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: AppSizes.verSpacesBetweenContainers),
    ],
  );
}

Widget dialogRightSide(TabController tabController, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      if(context.isMobile)
      SizedBox(height: AppSizes.verSpacesBetweenContainers,),
      if(context.isMobile)
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Payment Method:', style: CustomTextStyles.titleText(context),),
        ],
      ),
      if(context.isMobile)
      SizedBox(height: AppSizes.verSpacesBetweenElements,),
      Container(
        height: context.responsiveRelativeSize(
          containerSize: context.screenHeight,
          percentage: AppSizes.widgetHeight,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radius12)),
          border: Border.all(color: AppColors.grey),
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: AppColors.white,
          indicatorColor: AppColors.white,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicator: BoxDecoration(
            color: AppColors.darkPurple,
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.radius12)),
          ),
          automaticIndicatorColorAdjustment: true,
          labelColor: AppColors.white,
          controller: tabController,
          tabs: [
            Tab(text: 'Cash'),
            Tab(text: 'Card'),
            Tab(text: 'Cash + Card'),
            Tab(text: 'Debt'),
          ],
        ),
      ),
      SizedBox(height: AppSizes.verSpacesBetweenContainers),
      Container(
        height: context.screenHeight / 3,
        child: TabBarView(
          controller: tabController,
          children: [
            tab1(context),
            tab2(context),
            tab3(context),
            tab4(context),
          ],
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
            color: AppColors.darkPurple,
            textColor: AppColors.white,
          ),
          SizedBox(width: AppSizes.horiSpacesBetweenElements),
          CustomCancelOutlinedButton(text: 'Cancel'),
        ],
      ),
    ],
  );
}
