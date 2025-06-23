import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/orders/widgets/order_details.dart';
import 'package:app/presentation/pages/restaurant_orders.dart/restaurant_orders_page.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/pages/orders/widgets/order_card.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final ValueNotifier<bool> showCategories = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.lightGrey,
          body:
              context.isMobile
                  ? Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: LeftSide(
                          onClose: () => showCategories.value = false,
                        ),
                        
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
                              child: 
                              RightSide(menuNotifier: showCategories),
                              
                             
                            );
                          },
                        ),
                    ],
                  )
                  : Row(
                    children: [
                      RightSide(menuNotifier: showCategories),
                      LeftSide(onClose: () => showCategories.value = false),
                    ],
                  ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    showCategories.dispose();
    super.dispose();
  }
}

class LeftSide extends StatefulWidget {
  final VoidCallback onClose;
  const LeftSide({super.key, required this.onClose});

  @override
  State<LeftSide> createState() => _LeftSideState();
}

class _LeftSideState extends State<LeftSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: AppColors.lightGrey,
        child: Column(
          children: [
            SizedBox(height: AppSizes.verSpacesBetweenContainers),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.horizontalPadding,
              ),
              child:
                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: context.responsiveRelativeSize(
                              containerSize: context.screenWidth,
                              percentage: context.isMobile ? 100 : 50,
                            ),
                            height: context.responsiveRelativeSize(
                              containerSize: context.screenHeight,
                              percentage: AppSizes.widgetHeight,
                            ),
                            decoration: CustomBoxDecoration.boxDecoration,
                            child: TabBar(
                              dividerColor: Colors.transparent,
                              overlayColor: WidgetStateProperty.all(
                                Colors.transparent,
                              ),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: EdgeInsets.symmetric(horizontal: 0),

                              unselectedLabelStyle: TextStyle(
                                color: AppColors.darkGray,
                                fontSize: context.responsiveFontSize(
                                  AppSizes.fontSize4,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: AppColors.darkPurple,
                                fontSize: context.responsiveFontSize(
                                  AppSizes.fontSize4,
                                ),
                                fontWeight: AppSizes.fontWeight2,
                              ),
                              tabs: [
                                Tab(
                                  text:
                                      StringTranslateExtension(
                                        'all_orders',
                                      ).tr(),
                                ),
                                Tab(
                                  text:
                                      StringTranslateExtension('dine_in').tr(),
                                ),
                                Tab(
                                  text:
                                      StringTranslateExtension('takeaway').tr(),
                                ),
                                Tab(
                                  text:
                                      StringTranslateExtension('delivery').tr(),
                                ),
                              ],
                            ),
                          ),
                          if(context.isMobile)
                          Container(
                            height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
                            width: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),

                            decoration: BoxDecoration(
                              color: AppColors.lightPurple,
                              borderRadius: BorderRadius.circular(context.responsiveBorderRadius(AppSizes.radius12))
                            ),
                            child: IconButton(
                              color: AppColors.darkPurple,
                             
                              onPressed: () {
                            
                              Get.to(RestaurantOrdersPage());
                            }, icon: Icon(IconsaxPlusLinear.keyboard_open,)),
                          ),
                          // CustomIconButton(icon: IconsaxPlusLinear.activity, color: AppColors.darkPurple, iconColor: AppColors.white, size: AppSizes.widgetHeight, onPresse: RestaurantOrdersPage()),
                          SizedBox(
                            width: AppSizes.horiSpacesBetweenElements,
                          ),
                          if(!context.isMobile)
                          CustomButton(
                            text:
                                StringTranslateExtension(
                                  'sale_screen',
                                ).tr(),
                            radius: true,
                            width: 120,
                            page: RestaurantOrdersPage(),
                            height: AppSizes.widgetHeight,
                            color: AppColors.darkPurple,
                            textColor: AppColors.white,
                          ),
                        ],
                      ),
            ),
            SizedBox(height: AppSizes.verSpacesBetweenContainers),

            Expanded(
              child: TabBarView(children: [View1(), View2(), View3(), View4()]),
            ),
          ],
        ),
      ),
    );
  }
}

class RightSide extends StatefulWidget {
  final ValueNotifier<bool> menuNotifier;
  const RightSide({super.key, required this.menuNotifier});

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
        child: OrderDetails(
          menuNotifier: widget.menuNotifier,
          date: '11:25 AM',
          orderId: 'D-003',
          price: 220,
          type: StringTranslateExtension('delivery').tr(),
        ),
      ),
    );
  }
}

class View1 extends StatefulWidget {
  const View1({super.key});

  @override
  State<View1> createState() => _View1State();
}

class _View1State extends State<View1> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: AppSizes.horizontalPadding,
          bottom: AppSizes.verticalPadding,
          left: AppSizes.horizontalPadding,
        ),

        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            OrderCard(
              price: 25,
              orderId: 'D-002',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 10:25 AM',
            ),
            OrderCard(
              price: 320,
              orderId: 'T-025',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:05 AM',
            ),
            OrderCard(
              price: 200,
              orderId: 'E-012',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:10 AM',
            ),
            OrderCard(
              price: 361,
              orderId: 'E-013',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:22 AM',
            ),
            OrderCard(
              price: 60,
              orderId: 'E-014',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:36 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'E-005',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
          ],
        ),
      ),
    );
  }
}

class View2 extends StatefulWidget {
  const View2({super.key});

  @override
  State<View2> createState() => _View2State();
}

class _View2State extends State<View2> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: AppSizes.horizontalPadding,
          bottom: AppSizes.verticalPadding,
          left: AppSizes.horizontalPadding,
        ),

        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            OrderCard(
              price: 25,
              orderId: 'D-002',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 10:25 AM',
            ),
            OrderCard(
              price: 320,
              orderId: 'T-025',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:05 AM',
            ),
            OrderCard(
              price: 200,
              orderId: 'E-012',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:10 AM',
            ),
            OrderCard(
              price: 361,
              orderId: 'E-013',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:22 AM',
            ),
            OrderCard(
              price: 60,
              orderId: 'E-014',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:36 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('dine_in').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'E-005',
              type: ' Dine in',
              date: '2025/5/26, 11:15 AM',
            ),
          ],
        ),
      ),
    );
  }
}

class View3 extends StatefulWidget {
  const View3({super.key});

  @override
  State<View3> createState() => _View3State();
}

class _View3State extends State<View3> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: AppSizes.horizontalPadding,
          bottom: AppSizes.verticalPadding,
          left: AppSizes.horizontalPadding,
        ),

        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            OrderCard(
              price: 25,
              orderId: 'D-002',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 10:25 AM',
            ),
            OrderCard(
              price: 320,
              orderId: 'T-025',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:05 AM',
            ),
            OrderCard(
              price: 200,
              orderId: 'E-012',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:10 AM',
            ),
            OrderCard(
              price: 361,
              orderId: 'E-013',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:22 AM',
            ),
            OrderCard(
              price: 60,
              orderId: 'E-014',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:36 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'E-005',
              type: StringTranslateExtension('takeaway').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
          ],
        ),
      ),
    );
  }
}

class View4 extends StatefulWidget {
  const View4({super.key});

  @override
  State<View4> createState() => _View4State();
}

class _View4State extends State<View4> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: AppSizes.horizontalPadding,
          bottom: AppSizes.verticalPadding,
          left: AppSizes.horizontalPadding,
        ),

        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            OrderCard(
              price: 25,
              orderId: 'D-002',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 10:25 AM',
            ),
            OrderCard(
              price: 320,
              orderId: 'T-025',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:05 AM',
            ),
            OrderCard(
              price: 200,
              orderId: 'E-012',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:10 AM',
            ),
            OrderCard(
              price: 361,
              orderId: 'E-013',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:22 AM',
            ),
            OrderCard(
              price: 60,
              orderId: 'E-014',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:36 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'E-005',
              type: StringTranslateExtension('delivery').tr(),
              date: '2025/5/26, 11:15 AM',
            ),
          ],
        ),
      ),
    );
  }
}
