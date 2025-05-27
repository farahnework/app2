import 'package:app/presentation/pages/kitchen_display/widgets/kitchen_app_bar.dart';
import 'package:app/presentation/pages/kitchen_display/widgets/kitchen_order_card.dart';
import 'package:app/presentation/pages/orders/widgets/order_card.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:app/shared/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class KitchenDisplayPage extends StatefulWidget {
  const KitchenDisplayPage({super.key});

  @override
  State<KitchenDisplayPage> createState() => _KitchenDisplayPageState();
}

class _KitchenDisplayPageState extends State<KitchenDisplayPage> {
  @override
  Widget build(BuildContext context) {
  return DefaultTabController(
    length: 4,
    child: Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Column(
        children: [
          KitchenAppBar(),
          SizedBox(height: AppSizes.verSpacesBetweenContainers,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.screenPadding),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: AppSizes.widgetHeight,
                  decoration: CustomBoxDecoration.boxDecoration,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.symmetric(horizontal: 0),
                    unselectedLabelStyle: TextStyle(
                      color: AppColors.darkGray,
                      fontSize: AppSizes.fontSize2,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.darkPurple,
                      fontSize: AppSizes.fontSize2,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: [
                      Tab(text: "All Orders"),
                      Tab(text: "To Cook"),
                      Tab(text: "Ready"),
                      Tab(text: "Completed"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizes.verSpacesBetweenContainers,),
          Expanded( 
            child: TabBarView(
              children: [View1(), View2(), View3(), View4()],
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
          right: AppSizes.screenPadding,
          bottom: AppSizes.screenPadding,
          left: AppSizes.screenPadding,
        ),

        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: AppSizes.horiSpacesBetweenElements *2,
            mainAxisSpacing: AppSizes.verSpacesBetweenElements *2,
            ),
          scrollDirection: Axis.vertical,
          children: [
         KitchenOrderCard(
  orderId: 'D-002',
  type: 'Delivery',
  items: [
    {'name': 'Burger', 'quantity': 2, },
    {'name': 'Fries', 'quantity': 1, },
    {'name': 'Soda', 'quantity': 2, },
    {'name': 'Soda', 'quantity': 2, },
    {'name': 'Soda', 'quantity': 2,},
    {'name': 'Soda', 'quantity': 2,},
    {'name': 'Soda', 'quantity': 2, },
    {'name': 'Soda', 'quantity': 2,},
    {'name': 'Soda', 'quantity': 2,},
  ],
  backgroundColor: AppColors.lightYellow, // Customize based on order type
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
          right: AppSizes.screenPadding,
          bottom: AppSizes.screenPadding,
          left: AppSizes.screenPadding,
        ),

        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            OrderCard(
              price: 25,
              orderId: 'D-002',
              type: 'Dine in',
              date: '2025/5/26, 10:25 AM',
            ),
            OrderCard(
              price: 320,
              orderId: 'T-025',
              type: 'Dine in',
              date: '2025/5/26, 11:05 AM',
            ),
            OrderCard(
              price: 200,
              orderId: 'E-012',
              type: 'Dine in',
              date: '2025/5/26, 11:10 AM',
            ),
            OrderCard(
              price: 361,
              orderId: 'E-013',
              type: 'Dine in',
              date: '2025/5/26, 11:22 AM',
            ),
            OrderCard(
              price: 60,
              orderId: 'E-014',
              type: 'Dine in',
              date: '2025/5/26, 11:36 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Dine in',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Dine in',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Dine in',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Dine in',
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
          right: AppSizes.screenPadding,
          bottom: AppSizes.screenPadding,
          left: AppSizes.screenPadding,
        ),

        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            OrderCard(
              price: 25,
              orderId: 'D-002',
              type: 'Takeaway',
              date: '2025/5/26, 10:25 AM',
            ),
            OrderCard(
              price: 320,
              orderId: 'T-025',
              type: 'Takeaway',
              date: '2025/5/26, 11:05 AM',
            ),
            OrderCard(
              price: 200,
              orderId: 'E-012',
              type: 'Takeaway',
              date: '2025/5/26, 11:10 AM',
            ),
            OrderCard(
              price: 361,
              orderId: 'E-013',
              type: 'Takeaway',
              date: '2025/5/26, 11:22 AM',
            ),
            OrderCard(
              price: 60,
              orderId: 'E-014',
              type: 'Takeaway',
              date: '2025/5/26, 11:36 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Takeaway',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Takeaway',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Takeaway',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Takeaway',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'E-005',
              type: 'Takeaway',
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
          right: AppSizes.screenPadding,
          bottom: AppSizes.screenPadding,
          left: AppSizes.screenPadding,
        ),

        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            OrderCard(
              price: 25,
              orderId: 'D-002',
              type: 'Delivery',
              date: '2025/5/26, 10:25 AM',
            ),
            OrderCard(
              price: 320,
              orderId: 'T-025',
              type: 'Delivery',
              date: '2025/5/26, 11:05 AM',
            ),
            OrderCard(
              price: 200,
              orderId: 'E-012',
              type: 'Delivery',
              date: '2025/5/26, 11:10 AM',
            ),
            OrderCard(
              price: 361,
              orderId: 'E-013',
              type: 'Delivery',
              date: '2025/5/26, 11:22 AM',
            ),
            OrderCard(
              price: 60,
              orderId: 'E-014',
              type: 'Delivery',
              date: '2025/5/26, 11:36 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Delivery',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Delivery',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Delivery',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'D-003',
              type: 'Delivery',
              date: '2025/5/26, 11:15 AM',
            ),
            OrderCard(
              price: 21,
              orderId: 'E-005',
              type: 'Delivery',
              date: '2025/5/26, 11:15 AM',
            ),
          ],
        ),
      ),
    );
  }
}
