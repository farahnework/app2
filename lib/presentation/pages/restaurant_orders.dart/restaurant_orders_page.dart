import 'package:app/controllers/toggle_button_controller.dart';
import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/core/responsive/responsive_sizing.dart';
import 'package:app/core/responsive/screen_layouts.dart';
import 'package:app/presentation/pages/orders/orders_page.dart';
import 'package:app/presentation/pages/restaurant_orders.dart/widgets/add_caurse_button.dart';
import 'package:app/presentation/pages/restaurant_orders.dart/widgets/add_note_dialog.dart';
import 'package:app/presentation/pages/restaurant_orders.dart/widgets/restaurant_app_bar.dart';
import 'package:app/presentation/pages/sell/sell_page.dart';
import 'package:app/presentation/pages/sell/widgets/choose_device_dialog.dart';
import 'package:app/presentation/pages/sell/widgets/sell_app_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/buttons/custom_dialog_button.dart';
import 'package:app/presentation/widgets/buttons/custom_drop_down_button.dart';
import 'package:app/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:app/presentation/widgets/crads/category_card.dart';
import 'package:app/presentation/widgets/crads/food_card.dart';
import 'package:app/presentation/widgets/crads/order_number_card.dart';
import 'package:app/presentation/widgets/crads/sell_product_card.dart';
import 'package:app/presentation/widgets/fields/custom_search_field.dart';
import 'package:app/presentation/widgets/numbers_palette.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class RestaurantOrdersPage extends StatefulWidget {
   const RestaurantOrdersPage({super.key});

  @override
  State<RestaurantOrdersPage> createState() => _RestaurantOrdersPageState();
}

class _RestaurantOrdersPageState extends State<RestaurantOrdersPage> {
  
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> showCategories = ValueNotifier(false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chooseDeviceDialog(context);
    });

   
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        body:
         context.isMobile
                
                ? Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: RightSide(menuNotifier: showCategories),
                    ),
                    if (context.isMobile)
                      ValueListenableBuilder<bool>(
                        valueListenable: showCategories,
                        builder: (context, visible, _) {
                          return AnimatedPositioned(
                            duration: Duration(milliseconds: 300),
                            left:
                                visible
                                    ? 0
                                    : -MediaQuery.of(context).size.width,
                            width: MediaQuery.of(context).size.width,
                            top: 0,
                            bottom: 0,
                            child: Column(
                              children: [
                                CustomAppBar(),
                                LeftSide(
                                  onClose: () => showCategories.value = false,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ):
         Row(
          children: [
            Expanded(
              flex: 2,
              child: 
             
              Column(children: [RestaurantAppBar(), LeftSide(onClose: () => showCategories.value = false)])
            
            ),
            RightSide(menuNotifier: showCategories), 
          ],
        ),
      ),
    );
  }
}

class LeftSide extends StatefulWidget {
  final VoidCallback onClose;
  const LeftSide({super.key , required this.onClose});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
  @override
  Widget build(BuildContext context) {
     int categoriesCrossAxisCount =
        context.isMobile
            ? 2
            : ResponsiveSizing.isTablet(context)
            ? 3
            : 4;
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
      child: Container(
        color: AppColors.lightGrey,
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSizes.horizontalPadding,
            right: AppSizes.horizontalPadding,
            top: AppSizes.verticalPadding ,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                            decoration: BoxDecoration(color: AppColors.darkBlue, borderRadius: BorderRadius.circular(context.responsiveBorderRadius(AppSizes.radius12))),
                            child: IconButton(
                              color: AppColors.darkPurple,
        
                              onPressed: () {
                                widget.onClose();
                              },
        
                              icon: Icon(
                                IconsaxPlusLinear.arrow_left_1,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                           SizedBox(width: AppSizes.horiSpacesBetweenElements),
                      CustomSearchField(text: StringTranslateExtension('search').tr(),),
                      SizedBox(width: AppSizes.horiSpacesBetweenElements),
                      CustomButton(
                    text: StringTranslateExtension('orders').tr(),
                    radius: true,
                    width: 100,
                    page: OrdersPage(),
                    height: AppSizes.widgetHeight,
                    color: AppColors.darkPurple,
                    textColor: AppColors.white,
                  ),
                     
                    ],
                  ),
                  if(!context.isMobile)
                  Row(
                    children: [
                      // Icon(IconsaxPlusLinear.arrow_left_1, color: AppColors.darkGray,),
                      // SizedBox(width: AppSizes.horiSpacesBetweenElements,),
                      Icon(IconsaxPlusLinear.home_2, color: AppColors.darkPurple),
                    ],
                  ),
                ],
              ),
               SizedBox(height: AppSizes.verSpacesBetweenContainers),
                Row(
                children: [
                  Text(StringTranslateExtension('categories').tr(),style: CustomTextStyles.titleText(context)),
                ],
              ),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
               Expanded(
                flex: 1,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: categoriesCrossAxisCount,
                    crossAxisSpacing: spacing,
                    mainAxisSpacing: spacing,
                    childAspectRatio: 4,
                  ),
                  children: [
                    
                      CategoryCard(
                        image: 'assets/images/food2.jpg',
                        category: 'Sweets',
                        itemsNum: 10,
                      ),
                      CategoryCard(
                        image: 'assets/images/food7.jpg',
                        category: 'Sanwishes',
                        itemsNum: 23,
                      ),
        
                      CategoryCard(
                        image: 'assets/images/food3.jpg',
                        category: 'Healthy',
                        itemsNum: 12,
                      ),
                      CategoryCard(
                        image: 'assets/images/food9.jpg',
                        category: 'Breakfast',
                        itemsNum: 3,
                      ),
                      CategoryCard(
                        image: 'assets/images/food12.jpg',
                        category: 'Fast Food',
                        itemsNum: 10,
                      ),
                      CategoryCard(
                        image: 'assets/images/food6.jpg',
                        category: 'Rice',
                        itemsNum: 6,
                      ),
                    ],
                ),
              ),
             
              SizedBox(height: AppSizes.verSpacesBetweenContainers),
              Row(children: [Text(StringTranslateExtension('products').tr(), style: CustomTextStyles.titleText(context))]),
              SizedBox(height: AppSizes.verSpacesBetweenElements),
        
              Expanded(
                flex: 2,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: crossAxisCount,
                    crossAxisSpacing: spacing,
                    mainAxisSpacing: spacing,
                    childAspectRatio: context.isDesktop? 0.9
                            : context.isMobile
                            ? 0.95
                            : 0.75,
                  ),
                  children: [
                    FoodCard(
                      image: 'assets/images/food5.jpg',
                      productName: 'Color Pencils',
                      price: 6,
                    ),
                    FoodCard(
                      image: 'assets/images/food2.jpg',
                      productName: 'Color Pencils',
                      price: 3,
                    ),
                    FoodCard(
                      image: 'assets/images/food3.jpg',
                      productName: 'Color Pencils',
                      price: 5,
                    ),
                    FoodCard(
                      image: 'assets/images/food1.jpg',
                      productName: 'Color Pencils',
                      price: 6,
                    ),
                    FoodCard(
                      image: 'assets/images/food4.jpg',
                      productName: 'Color Pencils',
                      price: 2,
                    ),
                    FoodCard(
                      image: 'assets/images/food6.jpg',
                      productName: 'Color Pencils',
                      price: 8,
                    ),
                    FoodCard(
                      image: 'assets/images/food7.jpg',
                      productName: 'Color Pencils',
                      price: 11,
                    ),
                    FoodCard(
                      image: 'assets/images/food8.jpg',
                      productName: 'Color Pencils',
                      price: 4,
                    ),
                    FoodCard(
                      image: 'assets/images/food9.jpg',
                      productName: 'Color Pencils',
                      price: 9,
                    ),
                    FoodCard(
                      image: 'assets/images/food10.jpg',
                      productName: 'Color Pencils',
                      price: 7,
                    ),
                    FoodCard(
                      image: 'assets/images/food11.jpg',
                      productName: 'Color Pencils',
                      price: 5,
                    ),
                    FoodCard(
                      image: 'assets/images/food12.jpg',
                      productName: 'Color Pencils',
                      price: 12,
                    ),
                    FoodCard(
                      image: 'assets/images/food1.jpg',
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
              //       return FoodCard();
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class RightSide extends StatefulWidget {
  final ValueNotifier<bool> menuNotifier;
  const RightSide({super.key, required this.menuNotifier,});

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  
  @override
  Widget build(BuildContext context) {
    final sideToggle = Provider.of<SideToggleProvider>(context);

    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          border: Border(
            left: BorderSide(color: AppColors.grey,  width: AppSizes.borderSize),
            right: BorderSide(color: AppColors.grey, width: AppSizes.borderSize),
            ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
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
                        onPressed: () {
                          widget.menuNotifier.value = true;
                        },

                        icon: Icon(
                          IconsaxPlusLinear.box,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  Container(
                    width: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
                    height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
                    decoration: BoxDecoration(color: AppColors.darkPurple),
                    child: IconButton(
                      color: AppColors.darkPurple,
                      onPressed: () {},
                      icon: Icon(Icons.add, color: AppColors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
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
                left: AppSizes.horizontalPadding / 2,
                right: AppSizes.horizontalPadding / 2,
                top: AppSizes.verticalPadding / 2,
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
                          StringTranslateExtension('general_customer').tr(),
                          style: CustomTextStyles.meduimText(context),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                         CustomIconButton(
                          icon: IconsaxPlusLinear.note_2,
                          color: AppColors.lightPurple,
                          iconColor: AppColors.darkPurple,
                          size: AppSizes.widgetHeight,
                          onPresse: addNoteDialog,
                        ),
                        SizedBox(width: AppSizes.horiSpacesBetweenElements),
                        CustomIconButton(
                          onPresse: addNoteDialog,
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
                    image: 'assets/images/food5.jpg',
                    amount: 1,
                    price: 15,
                    productName: "Rice with checken",
                  ),
                  SellProductCard(
                    image: 'assets/images/food3.jpg',
                    amount: 2,
                    price: 30,
                    productName: "Checken",
                  ),
                  SellProductCard(
                    image: 'assets/images/food2.jpg',
                    amount: 2,
                    price: 30,
                    productName: "Bluebary sweet",
                  ),
                  SellProductCard(
                    image: 'assets/images/food10.jpg',
                    amount: 1,
                    price: 25,
                    productName: "Frid Checken",
                  ),
                  SellProductCard(
                    image: 'assets/images/food12.jpg',
                    amount: 2,
                    price: 10,
                    productName: "Fast Food",
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
                      AddCaurseButton(),
                      SizedBox(width: AppSizes.horiSpacesBetweenElements),
                      CustomDialogButton(
                        color: AppColors.yellow,
                        textColor: AppColors.black,
                        text: StringTranslateExtension('add_note').tr(),
                        dialog: addNoteDialog,
                        height: AppSizes.widgetHeight,
                      ),
                      SizedBox(width: AppSizes.horiSpacesBetweenElements),

                      Expanded(
                        child: CustomDropDownButton(
                          color: AppColors.lightBlue,

                          title: StringTranslateExtension('order_type').tr(),
                          list: ['Dine in', 'Take away', 'Delivery'],
                          selected: 'Dine in',
                          width: 300,
                          height: AppSizes.widgetHeight,
                          icon: IconsaxPlusLinear.activity,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.verSpacesBetweenElements),
            NumbersPalette(),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringTranslateExtension('payment').tr(), style: CustomTextStyles.buttonText(context)),
                    SizedBox(width: AppSizes.horiSpacesBetweenElements),
                    SvgPicture.asset(
                      AppImages.rial,
                      width: context.responsiveFontSize(AppSizes.fontSize6),
                      color: AppColors.white,
                    ),
                    SizedBox(width: AppSizes.horiSpacesBetweentTexts),

                    Text(
                      '260',
                      style: CustomTextStyles.buttonText(context).copyWith(fontWeight: AppSizes.fontWeight1,)
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
