import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/core/responsive/responsive_sizing.dart';
import 'package:app/core/responsive/screen_layouts.dart';
import 'package:app/presentation/pages/kitchen_display/widgets/kitchen_app_bar.dart';
import 'package:app/presentation/pages/kitchen_display/widgets/kitchen_order_card.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.lightGrey,
          body: Column(
            children: [
              KitchenAppBar(),
              SizedBox(height: AppSizes.verSpacesBetweenContainers),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontalPadding,
                ),
                child: Column(
                  children: [
                    Container(
                      width:
                          context.isMobile
                              ? context.responsiveRelativeSize(
                                containerSize: context.screenWidth,
                                percentage: 120,
                              )
                              : context.responsiveRelativeSize(
                                containerSize: context.screenWidth,
                                percentage: 50,
                              ),
                      height: context.responsiveRelativeSize(containerSize: context.screenHeight, percentage: AppSizes.widgetHeight),
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
                            AppSizes.fontSize3,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: AppColors.darkPurple,
                          fontSize: context.responsiveFontSize(
                            AppSizes.fontSize3,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                        tabs: [
                          Tab(text: StringTranslateExtension('all_orders').tr() ),
                          Tab(text: StringTranslateExtension('to_cook').tr() ),
                          Tab(text: StringTranslateExtension('ready').tr() ),
                          Tab(text: StringTranslateExtension('completed').tr() ),
                        ],
                      ),
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
    int crossAxisCount =
        context.isMobile
            ? ScreenLayouts.mobileCrossAxisCount
            : context.isTablet
            ? ScreenLayouts.tabletCrossAxisCount
            : ScreenLayouts.desktopCrossAxisCount;

    double spacing =
        context.isMobile
            ? ScreenLayouts.mobileSpacing
            : context.isTablet
            ? ScreenLayouts.tabletSpacing
            : ScreenLayouts.desktopSpacing;

    double childAspectRatio =
        context.isMobile
            ? 0.8
            : 1;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),

        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          scrollDirection: Axis.vertical,
          children: [
            KitchenOrderCard(
              orderId: 'D-002',
              type: StringTranslateExtension('delivery').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),
            KitchenOrderCard(
              orderId: 'D-002',
              type: StringTranslateExtension('delivery').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),
            KitchenOrderCard(
              orderId: 'D-002',
              type: StringTranslateExtension('takeaway').tr(),
              items: [
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),

            KitchenOrderCard(
              orderId: 'D-002',
              type:  StringTranslateExtension('dine_in').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),
            KitchenOrderCard(
              orderId: 'D-002',
              type: StringTranslateExtension('takeaway').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),
            KitchenOrderCard(
              orderId: 'D-002',
              type: StringTranslateExtension('delivery').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
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
             double childAspectRatio =
        context.isMobile
            ? 0.8
            : 1;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: AppSizes.horizontalPadding,
          bottom: AppSizes.verticalPadding,
          left: AppSizes.horizontalPadding,
        ),

        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          scrollDirection: Axis.vertical,
          children: [
            KitchenOrderCard(
              orderId: 'D-002',
              type: StringTranslateExtension('delivery').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),
            KitchenOrderCard(
              orderId: 'T-012',
              type: StringTranslateExtension('takeaway').tr(),
              items: [
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),

            KitchenOrderCard(
              orderId: 'D-003',
              type: 'Dine in',
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),
            KitchenOrderCard(
              orderId: 'D-014',
              type: StringTranslateExtension('delivery').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
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
             double childAspectRatio =
        context.isMobile
            ? 0.8
            : 1;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: AppSizes.horizontalPadding,
          bottom: AppSizes.verticalPadding,
          left: AppSizes.horizontalPadding,
        ),

        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio
          ),
          scrollDirection: Axis.vertical,
          children: [
            KitchenOrderCard(
              orderId: 'D-001',
              type: StringTranslateExtension('delivery').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),
            KitchenOrderCard(
              orderId: 'T-045',
              type: StringTranslateExtension('takeaway').tr(),
              items: [
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),

            KitchenOrderCard(
              orderId: 'T-012',
              type: StringTranslateExtension('takeaway').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
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
             double childAspectRatio =
        context.isMobile
            ? 0.8
            : 1;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: AppSizes.horizontalPadding,
          bottom: AppSizes.verticalPadding,
          left: AppSizes.horizontalPadding,
        ),

        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio
          ),
          scrollDirection: Axis.vertical,
          children: [
            KitchenOrderCard(
              orderId: 'D-004',
              type: StringTranslateExtension('delivery').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),
            KitchenOrderCard(
              orderId: 'D-003',
              type: StringTranslateExtension('delivery').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),

            KitchenOrderCard(
              orderId: 'D-002',
              type: 'Dine in',
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),
            KitchenOrderCard(
              orderId: 'D-002',
              type: StringTranslateExtension('delivery').tr(),
              items: [
                {'name': 'Burger', 'quantity': 2},
                {'name': 'Fries', 'quantity': 1},
                {'name': 'Soda', 'quantity': 2},
                {'name': 'Soda', 'quantity': 2},
              ],
            ),
          ],
        ),
      ),
    );
  }
}
