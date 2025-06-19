import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/orders/widgets/order_details.dart';
import 'package:app/presentation/pages/restaurant_orders.dart/restaurant_orders_page.dart';
import 'package:app/presentation/pages/session_details/widgets/session_app_bar.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/pages/orders/widgets/order_card.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SessionAppBar(),
                  SizedBox(height: AppSizes.verSpacesBetweenContainers),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: context.screenWidth/ 3,
                          height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
                          decoration: CustomBoxDecoration.boxDecoration,
                          child: TabBar(
                            dividerColor: Colors.transparent,
                            overlayColor: MaterialStateProperty.all(
                              Colors.transparent,
                            ),
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: EdgeInsets.symmetric(horizontal: 0),

                            unselectedLabelStyle: TextStyle(
                              color: AppColors.darkGray,
                              fontSize: context.responsiveFontSize(AppSizes.fontSize4),
                            ),
                            labelStyle: TextStyle(
                              color: AppColors.darkPurple,
                              fontSize: context.responsiveFontSize(AppSizes.fontSize4),
                              fontWeight: AppSizes.fontWeight2,
                            ),
                            tabs: [
                              Tab(text: StringTranslateExtension('all_orders').tr(),),
                              Tab(text: StringTranslateExtension('dine_in').tr(),),
                              Tab(text: StringTranslateExtension('takeaway').tr(),),
                              Tab(text: StringTranslateExtension('delivery').tr(),),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            // CustomButton(
                            //   text: 'Sessions',
                            //   radius: true,
                            //   width: 100,
                            //   page: SellPage(),
                            //   height: AppSizes.widgetHeight,
                            //   color: AppColors.darkPurple,
                            //   textColor: AppColors.white,
                            // ),
                            SizedBox(width: AppSizes.horiSpacesBetweenElements),
                            CustomButton(
                              text: StringTranslateExtension('sale_screen').tr(),
                              radius: true,
                              width: 120,
                              page: RestaurantOrdersPage(),
                              height: AppSizes.widgetHeight,
                              color: AppColors.darkPurple,
                              textColor: AppColors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.verSpacesBetweenContainers),

                  Expanded(
                    child: TabBarView(
                      children: [View1(), View2(), View3(), View4()],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  border: Border(left: BorderSide(color: AppColors.grey)),
                ),
                child: OrderDetails(date: '11:25 AM', orderId: 'D-003', price: 220, type: StringTranslateExtension('delivery').tr(),),
              ),
            ),
          ],
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
    return  Expanded(
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
