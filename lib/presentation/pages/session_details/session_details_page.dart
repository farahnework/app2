import 'package:app/core/responsive/app_sizes.dart';
import 'package:app/core/responsive/context_extension.dart';
import 'package:app/presentation/pages/sell/sell_page.dart';
import 'package:app/presentation/pages/session_details/widgets/details_of_payment_table.dart';
import 'package:app/presentation/pages/session_details/widgets/payment_methods_table.dart';
import 'package:app/presentation/pages/session_details/widgets/session_app_bar.dart';
import 'package:app/presentation/pages/session_details/widgets/session_details_table.dart';
import 'package:app/presentation/widgets/buttons/custom_button.dart';
import 'package:app/presentation/widgets/custom_container.dart';
import 'package:app/shared/styles/box_decoration.dart';
import 'package:app/shared/styles/custom_text_styles.dart';
import 'package:app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SessionDetailsPage extends StatefulWidget {
  const SessionDetailsPage({super.key});

  @override
  State<SessionDetailsPage> createState() => _SessionDetailsPageState();
}

class _SessionDetailsPageState extends State<SessionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SessionAppBar(),
            SizedBox(height: AppSizes.verSpacesBetweenContainers),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: context.screenWidth / 2,
                    height: AppSizes.widgetHeight,
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
                        fontSize:context.responsiveFontSize(AppSizes.fontSize3),
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.darkPurple,
                        fontSize: context.responsiveFontSize(AppSizes.fontSize3),
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: [
                        Tab(text: "Summary"),
                        Tab(text: "Money Movments"),
                        Tab(text: "Transactions"),
                        Tab(text: "Payable"),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      CustomButton(
                        text: 'Sessions',
                        radius: true,
                        width: 100,
                        page: SellPage(),
                        height: AppSizes.widgetHeight,
                        textColor: AppColors.white,
                        color: AppColors.darkPurple,
                      ),
                      SizedBox(width: AppSizes.horiSpacesBetweenElements),
                      CustomButton(
                        text: 'Sale Screen',
                        radius: true,
                        width: 120,
                        page: SellPage(),
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
              child: TabBarView(children: [View1(), View2(), View3(), View4()]),
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
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: AppSizes.horizontalPadding,
            bottom: AppSizes.verticalPadding,
            left: AppSizes.horizontalPadding,
          ),
          child: CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Session Deatils:',style: CustomTextStyles.titleText(context)),
                SizedBox(height: AppSizes.verSpacesBetweenElements),
                SessionDetailsTable(),
                SizedBox(height: AppSizes.verSpacesBetweenContainers),

                Text(
                  'Summery of Payment Method:'
                  , style: CustomTextStyles.titleText(context)
                ),
                SizedBox(height: AppSizes.verSpacesBetweenElements),
                PaymentMethodsTable(),
                SizedBox(height: AppSizes.verSpacesBetweenContainers),

                Text(
                  'Payment Method Details for Sales:'
                  ,style:  CustomTextStyles.titleText(context),
                ),
                SizedBox(height: AppSizes.verSpacesBetweenElements),
                DetailOfPaymentTable(),
              ],
            ),
          ),
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
    return  Column(
      children: [
        Icon(IconsaxPlusLinear.warning_2),
        Text(
          'There is No Data',
          style: TextStyle(
            color: AppColors.darkGray,
            fontSize: AppSizes.fontSize2,
          ),
        ),
      ],
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
    return  Column(
      children: [
        Icon(IconsaxPlusLinear.warning_2),
        Text(
          'There is No Data',
          style: TextStyle(
            color: AppColors.darkGray,
            fontSize: AppSizes.fontSize2,
          ),
        ),
      ],
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
    return Column(
      children: [
        Icon(IconsaxPlusLinear.warning_2),
        Text(
          'There is No Data',
          style: TextStyle(
            color: AppColors.darkGray,
            fontSize: AppSizes.fontSize2,
          ),
        ),
      ],
    );
  }
}
